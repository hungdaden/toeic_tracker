import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import '../models/toeic_score.dart';
import '../models/mun_ai_chat.dart';
import '../models/group_model.dart';
import '../services/notification_service.dart';

class UserProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<UserModel> _users = [];
  UserModel? _currentUser;
  bool _isLoading = false; // Bắt đầu bằng false để không block UI nếu chưa đăng nhập
  StreamSubscription<QuerySnapshot>? _usersSubscription;
  StreamSubscription<QuerySnapshot>? _groupSubscription;
  String? _authUid;
  List<UserModel> _groupMembers = [];
  List<UserModel> _pendingMembers = [];
  GroupModel? _currentGroup;
  StreamSubscription<DocumentSnapshot>? _groupMetadataSubscription;
  StreamSubscription<QuerySnapshot>? _pendingMembersSubscription;

  List<UserModel> get users => _users;
  UserModel? get currentUser => _currentUser;
  List<UserModel> get groupMembers => _groupMembers;
  List<UserModel> get pendingMembers => _pendingMembers;
  GroupModel? get currentGroup => _currentGroup;
  bool get isLoading => _isLoading;

  UserProvider();

  @override
  void dispose() {
    _usersSubscription?.cancel();
    _groupSubscription?.cancel();
    _groupMetadataSubscription?.cancel();
    _pendingMembersSubscription?.cancel();
    super.dispose();
  }

  void updateAuthUid(String? authUid) {
    if (_authUid == authUid) return;
    _authUid = authUid;
    
    _usersSubscription?.cancel();
    _groupSubscription?.cancel();
    _groupMetadataSubscription?.cancel();
    _pendingMembersSubscription?.cancel();
    _users.clear();
    _groupMembers.clear();
    _pendingMembers.clear();
    _currentGroup = null;
    _currentUser = null;
    
    if (_authUid != null) {
      _isLoading = true;
      notifyListeners();
      _initAndListen();
      // KHỞI TẠO THÔNG BÁO SAU KHI ĐÃ CÓ AUTH UID
      NotificationService().init();
    } else {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _initAndListen() {
    if (_authUid == null) return;
    
    // Safety fallback timer: Nếu Firestore snapshots không phản hồi sau 5s, tắt _isLoading để không chặn giao diện
    Timer(const Duration(seconds: 5), () {
      if (_isLoading) {
        debugPrint('UserProvider: Snapshot timeout/offline, resetting _isLoading = false');
        _isLoading = false;
        notifyListeners();
      }
    });

    _usersSubscription = _firestore
        .collection('users')
        .where('authUid', isEqualTo: _authUid)
        .snapshots()
        .listen((snapshot) async {
      if (snapshot.docs.isEmpty) {
        // Nếu user mới chưa có profile nào, danh sách rỗng
        _users = [];
        _currentUser = null;
        _isLoading = false;
        notifyListeners();
      } else {
        _users = snapshot.docs.map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
        
        // KIỂM TRA TÀI KHOẢN BỊ KHÓA
        // Chỉ xử lý nếu dữ liệu là mới nhất từ Server hoặc nếu đã chắc chắn bị khóa trong Cache
        if (_users.any((u) => u.isDisabled)) {
          // Nếu dữ liệu này lấy từ Cache, chúng ta tạm thời bỏ qua để đợi Server cập nhật trạng thái mới nhất
          // (Tránh trường hợp vừa được Admin mở khóa nhưng Cache máy vẫn báo là bị khóa)
          if (snapshot.metadata.isFromCache) {
             debugPrint('Phát hiện trạng thái isDisabled trong Cache, đang đợi Server xác nhận...');
          } else {
            _handleDisabledUser();
            return;
          }
        }
        
        if (_currentUser != null) {
           try {
             final updatedUser = _users.firstWhere((u) => u.id == _currentUser!.id);
             // Nếu groupId thay đổi, cập nhật listener nhóm
             if (updatedUser.groupId != _currentUser!.groupId) {
               _listenToGroup(updatedUser.groupId);
             }
             _currentUser = updatedUser;
           } catch (e) {
             _currentUser = null;
             _groupSubscription?.cancel();
             _groupMembers = [];
           }
        } else if (_users.isNotEmpty) {
           // Tự động chọn profile đầu tiên nếu có
           _currentUser = _users.first;
           _listenToGroup(_currentUser!.groupId);
        }
        
        _isLoading = false;
        notifyListeners();
      }
    }, onError: (error) {
      debugPrint('Error listening to users stream: $error');
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> _migrateDataToFirestore() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final String? usersJson = prefs.getString('toeic_users');
      List<UserModel> initialUsers = [];

      if (usersJson != null) {
        final List<dynamic> decoded = json.decode(usersJson);
        initialUsers = decoded.map((e) => UserModel.fromJson(e)).toList();
      } else {
        final mockDataString = await rootBundle.loadString('assets/mock_users_data.json');
        final List<dynamic> decoded = json.decode(mockDataString);
        initialUsers = decoded.map((e) => UserModel.fromJson(e)).toList();
      }

      // Batch write to Firestore
      final batch = _firestore.batch();
      for (var user in initialUsers) {
        final docRef = _firestore.collection('users').doc(user.id);
        batch.set(docRef, user.toJson());
      }
      await batch.commit();
      
    } catch (e) {
      debugPrint('Error migrating data: $e');
      _isLoading = false;
      notifyListeners();
    }
  }

  void setCurrentUser(UserModel user) {
    if (_currentUser?.id != user.id || _currentUser?.groupId != user.groupId) {
      _listenToGroup(user.groupId);
    }
    _currentUser = user;
    notifyListeners();
  }

  Future<void> addUser(UserModel user) async {
    user.authUid = _authUid; // Gắn hồ sơ này với tài khoản đang đăng nhập
    await _firestore.collection('users').doc(user.id).set(user.toJson());
  }

  Future<void> updateUser(UserModel updatedUser) async {
    await _firestore.collection('users').doc(updatedUser.id).update(updatedUser.toJson());
  }

  Future<void> deleteUser(String id) async {
    await _firestore.collection('users').doc(id).delete();
  }

  // Score management for current user
  Future<void> addScore(ToeicScore score) async {
    if (_currentUser == null) return;
    
    final updatedScores = List<ToeicScore>.from(_currentUser!.scores)..add(score);
    updatedScores.sort((a, b) => b.date.compareTo(a.date));
    
    await _firestore.collection('users').doc(_currentUser!.id).update({
      'scores': updatedScores.map((e) => e.toJson()).toList(),
    });
  }

  Future<void> updateScore(ToeicScore newScore) async {
    if (_currentUser == null) return;
    
    final updatedScores = List<ToeicScore>.from(_currentUser!.scores);
    final index = updatedScores.indexWhere((s) => s.id == newScore.id);
    if (index != -1) {
      updatedScores[index] = newScore;
      updatedScores.sort((a, b) => b.date.compareTo(a.date));
      
      await _firestore.collection('users').doc(_currentUser!.id).update({
        'scores': updatedScores.map((e) => e.toJson()).toList(),
      });
    }
  }

  Future<void> deleteScore(String scoreId) async {
    if (_currentUser == null) return;
    
    final updatedScores = List<ToeicScore>.from(_currentUser!.scores)
      ..removeWhere((s) => s.id == scoreId);
      
    await _firestore.collection('users').doc(_currentUser!.id).update({
      'scores': updatedScores.map((e) => e.toJson()).toList(),
    });
  }
  
  ToeicScore? get latestScore {
      if (_currentUser == null || _currentUser!.scores.isEmpty) return null;
      return _currentUser!.scores.reduce((a, b) => a.date.isAfter(b.date) ? a : b);
  }

  // Chat History Management
  Future<void> saveChatSession(MunAIChatSession session) async {
    if (_currentUser == null) return;

    final updatedHistory = List<MunAIChatSession>.from(_currentUser!.chatHistory);
    final index = updatedHistory.indexWhere((s) => s.id == session.id);

    if (index != -1) {
      updatedHistory[index] = session; // Update existing
    } else {
      updatedHistory.insert(0, session); // Add new at the beginning
      // Keep only the 3 most recent sessions
      if (updatedHistory.length > 3) {
        updatedHistory.removeLast();
      }
    }

    // Sort by created date descending just in case
    updatedHistory.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    // Cập nhật ngay lập tức vào state nội bộ để UI phản hồi ngay (Optimistic UI)
    _currentUser!.chatHistory = updatedHistory;
    notifyListeners();

    try {
      await _firestore.collection('users').doc(_currentUser!.id).update({
        'chatHistory': updatedHistory.map((e) => e.toJson()).toList(),
      });
    } catch (e) {
      debugPrint("Lỗi khi lưu lịch sử chat lên Firestore: $e");
    }
  }

  Future<void> deleteChatSession(String sessionId) async {
    if (_currentUser == null) return;

    final updatedHistory = List<MunAIChatSession>.from(_currentUser!.chatHistory)
      ..removeWhere((s) => s.id == sessionId);

    _currentUser!.chatHistory = updatedHistory;
    notifyListeners();

    try {
      await _firestore.collection('users').doc(_currentUser!.id).update({
        'chatHistory': updatedHistory.map((e) => e.toJson()).toList(),
      });
    } catch (e) {
      debugPrint("Lỗi khi xóa lịch sử chat khỏi Firestore: $e");
    }
  }

  // --- Group Logic ---

  void _listenToGroup(String? groupId) {
    _groupSubscription?.cancel();
    _groupMetadataSubscription?.cancel();
    _pendingMembersSubscription?.cancel();

    if (groupId == null || groupId.isEmpty) {
      _groupMembers = [];
      _pendingMembers = [];
      _currentGroup = null;
      notifyListeners();
      return;
    }

    // 1. Listen to group members
    _groupSubscription = _firestore
        .collection('users')
        .where('groupId', isEqualTo: groupId)
        .snapshots()
        .listen((snapshot) {
      _groupMembers = snapshot.docs
          .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      notifyListeners();
    });

    // 2. Listen to group metadata
    _groupMetadataSubscription = _firestore
        .collection('groups')
        .doc(groupId)
        .snapshots()
        .listen((doc) {
      if (doc.exists) {
        _currentGroup = GroupModel.fromJson(doc.data() as Map<String, dynamic>);
        notifyListeners();
      }
    });

    // 3. Listen to pending members (only if current user is leader or co-leader)
    // Actually, we can just listen and filter in the UI, but let's be efficient
    _pendingMembersSubscription = _firestore
        .collection('users')
        .where('pendingGroupId', isEqualTo: groupId)
        .snapshots()
        .listen((snapshot) {
      _pendingMembers = snapshot.docs
          .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      notifyListeners();
    });
  }

  Future<void> createGroup(String name) async {
    if (_currentUser == null) return;
    
    final String newGroupCode = _generateGroupCode();
    
    // Tạo document trong collection 'groups' để đánh dấu nhóm tồn tại
    await _firestore.collection('groups').doc(newGroupCode).set({
      'id': newGroupCode,
      'name': name.isEmpty ? 'Nhóm của ${_currentUser!.name}' : name,
      'requireApproval': false,
      'leaderId': _currentUser!.id,
      'leaderAuthUid': _authUid, // Lưu Auth UID để bảo mật
      'createdAt': FieldValue.serverTimestamp(),
    });

    // Gán groupId và role cho user hiện tại
    final updatedUser = _currentUser!;
    updatedUser.groupId = newGroupCode;
    updatedUser.groupRole = 'leader';
    
    await updateUser(updatedUser);
    _listenToGroup(newGroupCode);
  }

  Future<String> joinGroup(String code) async {
    if (_currentUser == null) return 'error';
    
    final cleanCode = code.trim().toUpperCase();
    if (cleanCode.length != 5) return 'invalid_code';

    try {
      // Kiểm tra xem nhóm có tồn tại trong collection 'groups' không
      final groupDoc = await _firestore.collection('groups').doc(cleanCode).get();
        
      if (!groupDoc.exists) {
        return 'not_found';
      }

      final group = GroupModel.fromJson(groupDoc.data() as Map<String, dynamic>);

      if (group.requireApproval) {
        // Cần phê duyệt
        final updatedUser = _currentUser!;
        updatedUser.pendingGroupId = cleanCode;
        await updateUser(updatedUser);
        return 'pending';
      } else {
        // Gia nhập luôn
        final updatedUser = _currentUser!;
        updatedUser.groupId = cleanCode;
        updatedUser.groupRole = 'member';
        updatedUser.pendingGroupId = null;
        await updateUser(updatedUser);
        _listenToGroup(cleanCode);
        return 'success';
      }
    } catch (e) {
      debugPrint('Error joining group: $e');
      return 'error';
    }
  }

  Future<void> updateGroupName(String name) async {
    if (_currentGroup == null) return;
    await _firestore.collection('groups').doc(_currentGroup!.id).update({'name': name});
  }

  Future<void> toggleApproval(bool value) async {
    if (_currentGroup == null) return;
    await _firestore.collection('groups').doc(_currentGroup!.id).update({'requireApproval': value});
  }

  Future<void> approveMember(UserModel member) async {
    if (_currentGroup == null) return;
    await _firestore.collection('users').doc(member.id).update({
      'groupId': _currentGroup!.id,
      'groupRole': 'member',
      'pendingGroupId': FieldValue.delete(), // Xóa pendingGroupId
    });
  }

  Future<void> rejectMember(UserModel member) async {
    await _firestore.collection('users').doc(member.id).update({
      'pendingGroupId': FieldValue.delete(),
    });
  }

  Future<void> promoteMember(UserModel member) async {
    await _firestore.collection('users').doc(member.id).update({
      'groupRole': 'co-leader',
    });
  }

  Future<void> kickMember(UserModel member) async {
    await _firestore.collection('users').doc(member.id).update({
      'groupId': FieldValue.delete(),
      'groupRole': FieldValue.delete(),
    });
  }

  Future<void> leaveGroup() async {
    if (_currentUser == null || _currentUser!.groupId == null) return;
    
    final String oldGroupId = _currentUser!.groupId!;
    final bool isLeader = _currentUser!.groupRole == 'leader';

    // 1. Cập nhật bản thân
    final updatedSelf = _currentUser!;
    updatedSelf.groupId = null;
    updatedSelf.groupRole = null;
    await updateUser(updatedSelf);

    // 2. Kiểm tra xem có phải là người cuối cùng không
    if (_groupMembers.length <= 1) {
      // Xóa nhóm khỏi Firestore vì không còn ai
      await _firestore.collection('groups').doc(oldGroupId).delete();
      return;
    }

    // 3. Logic chuyển giao quyền lực nếu là trưởng nhóm
    if (isLeader) {
      // Tìm người kế nhiệm (ưu tiên phó nhóm)
      UserModel? nextLeader;
      try {
        nextLeader = _groupMembers.firstWhere(
          (m) => m.id != updatedSelf.id && m.groupRole == 'co-leader',
        );
      } catch (_) {
        try {
          nextLeader = _groupMembers.firstWhere(
            (m) => m.id != updatedSelf.id,
          );
        } catch (_) {
          nextLeader = null;
        }
      }

      if (nextLeader != null) {
        // Có người kế nhiệm
        nextLeader.groupRole = 'leader';
        await _firestore.collection('users').doc(nextLeader.id).update({
          'groupRole': 'leader',
        });
        await _firestore.collection('groups').doc(oldGroupId).update({
          'leaderId': nextLeader.id,
          'leaderAuthUid': nextLeader.authUid,
        });
      } else {
        // Trường hợp hy hữu không tìm thấy ai dù list > 1, xóa nhóm cho an toàn
        await _firestore.collection('groups').doc(oldGroupId).delete();
      }
    }
  }

  void _handleDisabledUser() {
    FirebaseAuth.instance.signOut();
    _authUid = null;
    _currentUser = null;
    _users = [];
    _isLoading = false;
    notifyListeners();
    // Chúng ta không cần xóa listener ở đây vì authStateChanges ở main sẽ lo việc nhảy về Login
  }

  String _generateGroupCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rnd = math.Random();
    return String.fromCharCodes(Iterable.generate(
        5, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }
}

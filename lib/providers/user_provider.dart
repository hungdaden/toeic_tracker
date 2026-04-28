import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../models/toeic_score.dart';
import '../models/mun_ai_chat.dart';

class UserProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<UserModel> _users = [];
  UserModel? _currentUser;
  bool _isLoading = false; // Bắt đầu bằng false để không block UI nếu chưa đăng nhập
  StreamSubscription<QuerySnapshot>? _usersSubscription;
  String? _authUid;

  List<UserModel> get users => _users;
  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  UserProvider();

  @override
  void dispose() {
    _usersSubscription?.cancel();
    super.dispose();
  }

  void updateAuthUid(String? authUid) {
    if (_authUid == authUid) return;
    _authUid = authUid;
    
    _usersSubscription?.cancel();
    _users.clear();
    _currentUser = null;
    
    if (_authUid != null) {
      _isLoading = true;
      notifyListeners();
      _initAndListen();
    } else {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _initAndListen() {
    if (_authUid == null) return;
    
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
        
        if (_currentUser != null) {
           try {
             _currentUser = _users.firstWhere((u) => u.id == _currentUser!.id);
           } catch (e) {
             _currentUser = null;
           }
        } else if (_users.isNotEmpty) {
           // Tự động chọn profile đầu tiên nếu có
           _currentUser = _users.first;
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
}

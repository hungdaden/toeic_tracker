import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../models/toeic_score.dart';

class UserProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<UserModel> _users = [];
  UserModel? _currentUser;
  bool _isLoading = true;
  StreamSubscription<QuerySnapshot>? _usersSubscription;

  List<UserModel> get users => _users;
  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  UserProvider() {
    _initAndListen();
  }

  @override
  void dispose() {
    _usersSubscription?.cancel();
    super.dispose();
  }

  void _initAndListen() {
    _usersSubscription = _firestore.collection('users').snapshots().listen((snapshot) async {
      if (snapshot.docs.isEmpty) {
        // First time, database is empty. Let's do data migration.
        await _migrateDataToFirestore();
      } else {
        _users = snapshot.docs.map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
        
        // Update _currentUser object from _users list if it exists
        if (_currentUser != null) {
           try {
             _currentUser = _users.firstWhere((u) => u.id == _currentUser!.id);
           } catch (e) {
             _currentUser = null;
           }
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
}

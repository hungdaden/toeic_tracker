import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../models/toeic_score.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> _users = [];
  UserModel? _currentUser;
  bool _isLoading = true;

  List<UserModel> get users => _users;
  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  UserProvider() {
    loadUsers();
  }

  Future<void> loadUsers() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final String? usersJson = prefs.getString('toeic_users');

    if (usersJson != null) {
      final List<dynamic> decoded = json.decode(usersJson);
      _users = decoded.map((e) => UserModel.fromJson(e)).toList();
    } else {
      try {
        final mockDataString = await rootBundle.loadString('assets/mock_users_data.json');
        final List<dynamic> decoded = json.decode(mockDataString);
        _users = decoded.map((e) => UserModel.fromJson(e)).toList();
        
        // Lưu lại ngay vào SharedPreferences để các lần sau không cần tải lại file mock
        final String encoded = json.encode(_users.map((e) => e.toJson()).toList());
        await prefs.setString('toeic_users', encoded);
      } catch (e) {
        debugPrint('Could not load mock users data: $e');
      }
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = json.encode(_users.map((e) => e.toJson()).toList());
    await prefs.setString('toeic_users', encoded);
  }

  void setCurrentUser(UserModel user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<void> addUser(UserModel user) async {
    _users.add(user);
    await saveToPrefs();
    notifyListeners();
  }

  Future<void> updateUser(UserModel updatedUser) async {
    final index = _users.indexWhere((u) => u.id == updatedUser.id);
    if (index != -1) {
      _users[index] = updatedUser;
      if (_currentUser?.id == updatedUser.id) {
        _currentUser = updatedUser;
      }
      await saveToPrefs();
      notifyListeners();
    }
  }

  Future<void> deleteUser(String id) async {
    _users.removeWhere((u) => u.id == id);
    if (_currentUser?.id == id) {
      _currentUser = null;
    }
    await saveToPrefs();
    notifyListeners();
  }

  // Score management for current user
  Future<void> addScore(ToeicScore score) async {
    if (_currentUser != null) {
      _currentUser!.scores.add(score);
      _currentUser!.scores.sort((a, b) => b.date.compareTo(a.date));
      await saveToPrefs();
      notifyListeners();
    }
  }

  Future<void> updateScore(ToeicScore newScore) async {
    if (_currentUser != null) {
      final index = _currentUser!.scores.indexWhere((s) => s.id == newScore.id);
      if (index != -1) {
        _currentUser!.scores[index] = newScore;
        _currentUser!.scores.sort((a, b) => b.date.compareTo(a.date));
        await saveToPrefs();
        notifyListeners();
      }
    }
  }

  Future<void> deleteScore(String scoreId) async {
    if (_currentUser != null) {
      _currentUser!.scores.removeWhere((s) => s.id == scoreId);
      await saveToPrefs();
      notifyListeners();
    }
  }
  
  ToeicScore? get latestScore {
      if (_currentUser == null || _currentUser!.scores.isEmpty) return null;
      return _currentUser!.scores.reduce((a, b) => a.date.isAfter(b.date) ? a : b);
  }
}

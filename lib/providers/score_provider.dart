import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/toeic_score.dart';

class ScoreProvider with ChangeNotifier {
  List<ToeicScore> _scores = [];
  bool _isLoading = true;

  List<ToeicScore> get scores => _scores;
  bool get isLoading => _isLoading;

  ToeicScore? get latestScore {
    if (_scores.isEmpty) return null;
    return _scores.reduce((a, b) => a.date.isAfter(b.date) ? a : b);
  }

  ScoreProvider() {
    loadScores();
  }

  Future<void> loadScores() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final String? scoresJson = prefs.getString('toeic_scores');

    if (scoresJson != null) {
      final List<dynamic> decoded = json.decode(scoresJson);
      _scores = decoded.map((e) => ToeicScore.fromJson(e)).toList();
      // Sort by date descending
      _scores.sort((a, b) => b.date.compareTo(a.date));
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addScore(ToeicScore score) async {
    _scores.add(score);
    _scores.sort((a, b) => b.date.compareTo(a.date));
    await _saveToPrefs();
    notifyListeners();
  }

  Future<void> deleteScore(String id) async {
    _scores.removeWhere((element) => element.id == id);
    await _saveToPrefs();
    notifyListeners();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = json.encode(_scores.map((e) => e.toJson()).toList());
    await prefs.setString('toeic_scores', encoded);
  }
}

import 'toeic_score.dart';

class UserModel {
  final String id;
  final String name;
  final DateTime dateOfBirth;
  final int targetScore;
  final String? avatarPath;
  final List<ToeicScore> scores;

  UserModel({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    this.targetScore = 500,
    this.avatarPath,
    List<ToeicScore>? scores,
  }) : scores = scores ?? [];

  int get currentStreak {
    if (scores.isEmpty) return 0;
    
    // Dùng utc để tính toán cho chuẩn xác tránh lỗi khác múi giờ / DST
    final uniqueDates = scores.map((s) => DateTime.utc(s.date.year, s.date.month, s.date.day)).toSet().toList();
    uniqueDates.sort((a, b) => b.compareTo(a));

    int streak = 1;
    for (int i = 0; i < uniqueDates.length - 1; i++) {
      final diff = uniqueDates[i].difference(uniqueDates[i+1]).inDays;
      if (diff == 1) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'dateOfBirth': dateOfBirth.toIso8601String(),
        'targetScore': targetScore,
        'avatarPath': avatarPath,
        'scores': scores.map((x) => x.toJson()).toList(),
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        dateOfBirth: DateTime.parse(json['dateOfBirth']),
        targetScore: json['targetScore'] ?? 500,
        avatarPath: json['avatarPath'],
        scores: (json['scores'] as List<dynamic>?)
                ?.map((x) => ToeicScore.fromJson(x))
                .toList() ??
            [],
      );
}

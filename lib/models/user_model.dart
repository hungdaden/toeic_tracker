import 'toeic_score.dart';
import 'mun_ai_chat.dart';

class UserModel {
  final String id;
  String? authUid; // ID của tài khoản đăng nhập (Firebase Auth UID)
  String name;
  DateTime dateOfBirth;
  int targetScore;
  String? avatarUrl;
  bool isFourSkills; // Thêm thuộc tính này
  List<ToeicScore> scores;
  List<MunAIChatSession> chatHistory;

  UserModel({
    required this.id,
    this.authUid,
    required this.name,
    required this.dateOfBirth,
    this.targetScore = 500,
    this.avatarUrl,
    this.isFourSkills = false, // Mặc định là false (2 kỹ năng)
    List<ToeicScore>? scores,
    List<MunAIChatSession>? chatHistory,
  })  : scores = scores ?? [],
        chatHistory = chatHistory ?? [];

  int get currentStreak {
    if (scores.isEmpty) return 0;

    // Dùng utc để tính toán cho chuẩn xác tránh lỗi khác múi giờ / DST
    final uniqueDates = scores
        .map((s) => DateTime.utc(s.date.year, s.date.month, s.date.day))
        .toSet()
        .toList();
    uniqueDates.sort((a, b) => b.compareTo(a));

    int streak = 1;
    for (int i = 0; i < uniqueDates.length - 1; i++) {
      final diff = uniqueDates[i].difference(uniqueDates[i + 1]).inDays;
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
    'authUid': authUid,
    'name': name,
    'dateOfBirth': dateOfBirth.toIso8601String(),
    'targetScore': targetScore,
    'avatarUrl': avatarUrl,
    'isFourSkills': isFourSkills,
    'scores': scores.map((x) => x.toJson()).toList(),
    'chatHistory': chatHistory.map((x) => x.toJson()).toList(),
  };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    authUid: json['authUid'],
    name: json['name'],
    dateOfBirth: DateTime.parse(json['dateOfBirth']),
    targetScore: json['targetScore'] ?? 500,
    avatarUrl: json['avatarUrl'],
    isFourSkills: json['isFourSkills'] ?? false,
    scores:
        (json['scores'] as List<dynamic>?)
            ?.map((x) => ToeicScore.fromJson(x))
            .toList() ??
        [],
    chatHistory:
        (json['chatHistory'] as List<dynamic>?)
            ?.map((x) => MunAIChatSession.fromJson(x as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

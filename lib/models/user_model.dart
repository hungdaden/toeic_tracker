import 'toeic_score.dart';

class UserModel {
  final String id;
  final String name;
  final DateTime dateOfBirth;
  final String? avatarPath;
  final List<ToeicScore> scores;

  UserModel({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    this.avatarPath,
    List<ToeicScore>? scores,
  }) : scores = scores ?? [];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'dateOfBirth': dateOfBirth.toIso8601String(),
        'avatarPath': avatarPath,
        'scores': scores.map((x) => x.toJson()).toList(),
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        dateOfBirth: DateTime.parse(json['dateOfBirth']),
        avatarPath: json['avatarPath'],
        scores: (json['scores'] as List<dynamic>?)
                ?.map((x) => ToeicScore.fromJson(x))
                .toList() ??
            [],
      );
}

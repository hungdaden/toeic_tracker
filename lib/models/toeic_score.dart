class ToeicScore {
  final String id;
  final DateTime date;
  final int listeningScore;
  final int readingScore;

  ToeicScore({
    required this.id,
    required this.date,
    required this.listeningScore,
    required this.readingScore,
  });

  int get totalScore => listeningScore + readingScore;

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'listeningScore': listeningScore,
        'readingScore': readingScore,
      };

  factory ToeicScore.fromJson(Map<String, dynamic> json) => ToeicScore(
        id: json['id'],
        date: DateTime.parse(json['date']),
        listeningScore: json['listeningScore'],
        readingScore: json['readingScore'],
      );
}

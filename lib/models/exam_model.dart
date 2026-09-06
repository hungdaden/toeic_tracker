import 'dart:convert';

class ToeicExam {
  final String id;
  final String title;
  final String? description;
  final String? tag;
  final List<ToeicQuestion> questions;
  final int timeLimitMinutes;

  ToeicExam({
    required this.id,
    required this.title,
    this.description,
    this.tag,
    required this.questions,
    this.timeLimitMinutes = 120,
  });

  int get totalQuestions => questions.length;
}

enum QuestionPart { part1, part2, part3, part4, part5, part6, part7 }

class ToeicQuestion {
  final int number;
  final QuestionPart part;
  final String? questionText;
  final List<String> options;
  final int correctOptionIndex; // 0 for A, 1 for B, etc.
  final String? imageUrl;
  final String? audioUrl;
  final String? passage; // For Part 6, 7
  final String? explanation; // Explanation / Translation
  final String? transcript; // Audio transcript if applicable

  ToeicQuestion({
    required this.number,
    required this.part,
    this.questionText,
    required this.options,
    required this.correctOptionIndex,
    this.imageUrl,
    this.audioUrl,
    this.passage,
    this.explanation,
    this.transcript,
  });
}

class ExamResult {
  final String examId;
  final String examTitle;
  final Map<int, int> userAnswers; // questionNumber: selectedOptionIndex
  final int correctListening;
  final int correctReading;
  final int listeningScore;
  final int readingScore;
  final DateTime timestamp;

  ExamResult({
    required this.examId,
    required this.examTitle,
    required this.userAnswers,
    required this.correctListening,
    required this.correctReading,
    required this.listeningScore,
    required this.readingScore,
    required this.timestamp,
  });

  int get totalScore => listeningScore + readingScore;
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toeic_tracker/models/toeic_score.dart';
import 'package:toeic_tracker/models/user_model.dart';
import 'package:toeic_tracker/widgets/mun_ai_roadmap_modal.dart';
import 'package:toeic_tracker/services/exam_service.dart';

void main() {
  group('ExamService Tests', () {
    test('ExamService provides 10 ETS 2026 tests with 200 questions each', () {
      final exams = ExamService().getAvailableExams();
      expect(exams.length, equals(10));

      final test1 = exams.first;
      expect(test1.id, equals('ets_2026_test_1'));
      expect(test1.title, equals('ETS TOEIC 2026 - Test 01'));
      expect(test1.questions.length, equals(200));

      final test10 = exams.last;
      expect(test10.id, equals('ets_2026_test_10'));
      expect(test10.title, equals('ETS TOEIC 2026 - Test 10'));
      expect(test10.questions.length, equals(200));
    });

    test('ExamService loadExam loads Test 1 and Test 2 offline JSON with assets media', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final examService = ExamService();

      final test1 = await examService.loadExam('ets_2026_test_1');
      expect(test1.questions.length, equals(200));
      expect(test1.questions.first.audioUrl, contains('assets/exams/test_1/audio/'));
      expect(test1.questions.first.imageUrl, contains('assets/exams/test_1/images/'));

      final test2 = await examService.loadExam('ets_2026_test_2');
      expect(test2.questions.length, equals(200));
      expect(test2.questions.first.audioUrl, contains('assets/exams/test_2/audio/'));
      expect(test2.questions.first.imageUrl, contains('assets/exams/test_2/images/'));
    });
  });

  group('Mun AI Roadmap Personalization Tests', () {
    testWidgets('MunAIRoadmapModal generates advice for low score', (tester) async {
      final user = UserModel(
        id: 'u1',
        name: 'Nguyen Van A',
        targetScore: 800,
        dateOfBirth: DateTime(2000, 1, 1),
        scores: [],
      );

      final lowScore = ToeicScore(
        id: 's_low',
        date: DateTime(2026, 3, 1),
        listeningScore: 200,
        readingScore: 150,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => MunAIRoadmapModal.show(context, score: lowScore, user: user),
                child: const Text('Show Low'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Low'));
      await tester.pumpAndSettle();

      expect(find.text('Lộ trình Mun AI'), findsOneWidget);
      expect(find.textContaining('Band Cơ Bản (<450)'), findsOneWidget);
      expect(find.textContaining('Học 600 từ vựng TOEIC căn bản'), findsOneWidget);
    });

    testWidgets('MunAIRoadmapModal generates advice for high score', (tester) async {
      final user = UserModel(
        id: 'u1',
        name: 'Nguyen Van A',
        targetScore: 990,
        dateOfBirth: DateTime(2000, 1, 1),
        scores: [],
      );

      final highScore = ToeicScore(
        id: 's_high',
        date: DateTime(2026, 4, 1),
        listeningScore: 460,
        readingScore: 430,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => MunAIRoadmapModal.show(context, score: highScore, user: user),
                child: const Text('Show High'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show High'));
      await tester.pumpAndSettle();

      expect(find.text('Lộ trình Mun AI'), findsOneWidget);
      expect(find.textContaining('Band Xuất Sắc (850 - 990)'), findsOneWidget);
      expect(find.textContaining('Quản lý năng lượng & Tránh bẫy sơ suất'), findsOneWidget);
    });

    testWidgets('MunAIRoadmapModal detects skill imbalance when listening is much higher than reading', (tester) async {
      final user = UserModel(
        id: 'u2',
        name: 'Tran B',
        targetScore: 750,
        dateOfBirth: DateTime(2000, 1, 1),
        scores: [],
      );

      final imbalancedScore = ToeicScore(
        id: 's_imb',
        date: DateTime(2026, 5, 1),
        listeningScore: 410,
        readingScore: 230,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => MunAIRoadmapModal.show(context, score: imbalancedScore, user: user),
                child: const Text('Show Imbalanced'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Imbalanced'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Điểm mạnh'), findsOneWidget);
      expect(find.textContaining('Cần kéo lên ⚠️'), findsOneWidget);
      expect(find.textContaining('Bạn nghe rất tốt'), findsOneWidget);
    });
  });
}

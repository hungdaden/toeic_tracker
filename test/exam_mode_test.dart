import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:toeic_tracker/models/exam_model.dart';
import 'package:toeic_tracker/models/user_model.dart';
import 'package:toeic_tracker/models/toeic_score.dart';
import 'package:toeic_tracker/providers/user_provider.dart';
import 'package:toeic_tracker/widgets/exam_mode_modal.dart';
import 'package:toeic_tracker/screens/exam_session_screen.dart';

class MockUserProvider extends ChangeNotifier implements UserProvider {
  ToeicScore? addedScore;

  @override
  dynamic noSuchMethod(Invocation invocation) => null;

  @override
  Future<void> addScore(ToeicScore score) async {
    addedScore = score;
  }
}

void main() {
  final testExam = ToeicExam(
    id: 'test_demo',
    title: 'ETS TOEIC 2026 - Test 01',
    description: 'Đề thi thử nghiệm',
    tag: 'ETS 2026',
    timeLimitMinutes: 120,
    questions: [
      ToeicQuestion(
        number: 1,
        part: QuestionPart.part1,
        questionText: 'Câu hỏi số 1',
        options: ['(A)', '(B)', '(C)', '(D)'],
        correctOptionIndex: 1,
        audioUrl: 'assets/exams/test_1/audio/E26-T01-01.mp3',
        imageUrl: null,
      ),
      ToeicQuestion(
        number: 2,
        part: QuestionPart.part1,
        questionText: 'Câu hỏi số 2',
        options: ['(A)', '(B)', '(C)', '(D)'],
        correctOptionIndex: 3,
        audioUrl: 'assets/exams/test_1/audio/E26-T01-02.mp3',
        imageUrl: null,
      ),
    ],
  );

  group('ExamModeModal Tests', () {
    testWidgets('Renders both Practice and Real Exam modes', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ExamModeModal(
              exam: testExam,
              onSelectMode: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('CHỌN CHẾ ĐỘ LÀM BÀI'), findsOneWidget);
      expect(find.text('ETS TOEIC 2026 - Test 01'), findsOneWidget);
      expect(find.text('Chế độ Ôn Luyện'), findsOneWidget);
      expect(find.text('Chế độ Thi Thử Thực Tế'), findsOneWidget);
      expect(find.text('Tự do tua Audio'), findsOneWidget);
      expect(find.text('Chuẩn ETS 120p'), findsOneWidget);
    });

    testWidgets('Triggers callback with false for Practice Mode and true for Real Exam Mode',
        (WidgetTester tester) async {
      bool? selectedMode;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ExamModeModal(
              exam: testExam,
              onSelectMode: (mode) {
                selectedMode = mode;
              },
            ),
          ),
        ),
      );

      // Tap Practice Mode button
      await tester.tap(find.text('Bắt đầu Ôn Luyện'));
      await tester.pump();
      expect(selectedMode, false);

      // Tap Real Exam Mode button
      await tester.tap(find.text('Bắt đầu Thi Thử'));
      await tester.pump();
      expect(selectedMode, true);
    });
  });

  group('ExamSessionScreen Mode & Exit Tests', () {
    testWidgets('Displays THI THỬ badge and locked rewind indicator in Exam Mode without overlapping NỘP BÀI',
        (WidgetTester tester) async {
      final mockProvider = MockUserProvider();

      await tester.pumpWidget(
        ChangeNotifierProvider<UserProvider>.value(
          value: mockProvider,
          child: MaterialApp(
            home: ExamSessionScreen(
              exam: testExam,
              isExamMode: true,
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('THI THỬ'), findsOneWidget);
      expect(find.text('Không thể tua lại (Chế độ thi thử ETS)'), findsOneWidget);
      expect(find.byType(Slider), findsNothing);

      // Verify no overlap between THI THỬ badge and NỘP BÀI button
      final badgeRect = tester.getRect(find.text('THI THỬ'));
      final submitRect = tester.getRect(find.text('NỘP BÀI'));
      expect(badgeRect.right < submitRect.left, isTrue,
          reason: 'Badge THI THỬ must be on the left and never overlap NỘP BÀI');

      // Test next question advancement
      expect(find.text('Câu 1/2'), findsOneWidget);
      await tester.tap(find.text('TIẾP THEO'));
      await tester.pump();
      expect(find.text('Câu 2/2'), findsOneWidget);
    });

    testWidgets('Displays ÔN LUYỆN badge and interactive Slider in Practice Mode without overlapping NỘP BÀI',
        (WidgetTester tester) async {
      final mockProvider = MockUserProvider();

      await tester.pumpWidget(
        ChangeNotifierProvider<UserProvider>.value(
          value: mockProvider,
          child: MaterialApp(
            home: ExamSessionScreen(
              exam: testExam,
              isExamMode: false,
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('ÔN LUYỆN'), findsOneWidget);
      expect(find.text('Không thể tua lại (Chế độ thi thử ETS)'), findsNothing);
      expect(find.byType(Slider), findsOneWidget);

      // Verify no overlap between ÔN LUYỆN badge and NỘP BÀI button
      final badgeRect = tester.getRect(find.text('ÔN LUYỆN'));
      final submitRect = tester.getRect(find.text('NỘP BÀI'));
      expect(badgeRect.right < submitRect.left, isTrue,
          reason: 'Badge ÔN LUYỆN must be on the left and never overlap NỘP BÀI');

      // Test next question advancement in practice mode
      expect(find.text('Câu 1/2'), findsOneWidget);
      await tester.tap(find.text('TIẾP THEO'));
      await tester.pump();
      expect(find.text('Câu 2/2'), findsOneWidget);
    });

    testWidgets('Submit exam dialog shows scores and closes cleanly without black screen',
        (WidgetTester tester) async {
      final mockProvider = MockUserProvider();

      await tester.pumpWidget(
        ChangeNotifierProvider<UserProvider>.value(
          value: mockProvider,
          child: MaterialApp(
            home: Builder(
              builder: (ctx) => Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      ctx,
                      MaterialPageRoute(
                        builder: (_) => ExamSessionScreen(
                          exam: testExam,
                          isExamMode: false,
                        ),
                      ),
                    );
                  },
                  child: const Text('Mở phòng thi'),
                ),
              ),
            ),
          ),
        ),
      );

      // Open exam screen
      await tester.tap(find.text('Mở phòng thi'));
      await tester.pumpAndSettle();

      expect(find.text('NỘP BÀI'), findsOneWidget);

      // Tap submit
      await tester.tap(find.text('NỘP BÀI'));
      await tester.pumpAndSettle();

      // Because questions unanswered, prompt appears: "Vẫn nộp bài"
      expect(find.text('Chưa hoàn thành'), findsOneWidget);
      await tester.tap(find.text('Vẫn nộp bài'));
      await tester.pumpAndSettle();

      // Result dialog appears
      expect(find.text('Kết Quả Bài Thi'), findsOneWidget);
      expect(find.text('TỔNG ĐIỂM TOEIC'), findsOneWidget);
      expect(find.text('Lưu & Trở về'), findsOneWidget);

      // Tap Lưu & Trở về
      await tester.tap(find.text('Lưu & Trở về'));
      await tester.pumpAndSettle();

      // Must safely return to root page ("Mở phòng thi"), NOT a black screen!
      expect(find.text('Mở phòng thi'), findsOneWidget);
      expect(mockProvider.addedScore, isNotNull);
    });
  });
}

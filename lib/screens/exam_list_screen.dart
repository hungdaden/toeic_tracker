import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import '../models/exam_model.dart';
import 'exam_session_screen.dart';
import '../widgets/liquid_glass_app_bar.dart';
import '../theme/liquid_glass_theme.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data cho đề thi
    final exams = [
      ToeicExam(
        id: 'mock_1',
        title: 'ETS TOEIC 2024 - Test 1',
        description: 'Đề thi mô phỏng cấu trúc 2024, đầy đủ 200 câu 7 Part.',
        questions: _generateFullToeicExam(),
      ),
    ];

    final topPadding = LiquidGlassTheme.getAppBarContentTop(context, 8);

    return LiquidGlassScaffoldWrapper(
      appBar: const LiquidGlassAppBar(title: 'Danh sách đề thi'),
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(16, topPadding, 16, 40),
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return LiquidGlassContainer(
            margin: const EdgeInsets.only(bottom: 16),
            borderRadius: 20,
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: LiquidGlassTheme.primaryAccent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.assignment_rounded, color: LiquidGlassTheme.primaryAccent, size: 28),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exam.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        exam.description ?? '',
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                GlassButtonV2(
                  title: 'Bắt đầu',
                  color: const Color(0xFF4F46E5),
                  borderColor: const Color(0xFF818CF8).withValues(alpha: 0.4),
                  textColor: Colors.white,
                  shadowColor: const Color(0xFF4F46E5).withValues(alpha: 0.35),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExamSessionScreen(exam: exam),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<ToeicQuestion> _generateFullToeicExam() {
    final List<ToeicQuestion> questions = [];

    // Phân bổ câu hỏi theo chuẩn TOEIC 2024
    final partDistribution = {
      QuestionPart.part1: 6,
      QuestionPart.part2: 25,
      QuestionPart.part3: 39,
      QuestionPart.part4: 30,
      QuestionPart.part5: 30,
      QuestionPart.part6: 16,
      QuestionPart.part7: 54,
    };

    int currentNumber = 1;
    partDistribution.forEach((part, count) {
      for (int i = 0; i < count; i++) {
        questions.add(
          ToeicQuestion(
            number: currentNumber++,
            part: part,
            questionText:
                'Câu hỏi số ${currentNumber - 1} (Part ${part.index + 1})',
            options: ['Đáp án A', 'Đáp án B', 'Đáp án C', 'Đáp án D'],
            correctOptionIndex: 0,
            passage: (part == QuestionPart.part6 || part == QuestionPart.part7)
                ? 'Đây là đoạn văn mẫu cho Part ${part.index + 1}. Bạn hãy đọc kỹ đoạn văn trên trước khi chọn đáp án chính xác nhất.'
                : null,
            imageUrl: (part == QuestionPart.part1)
                ? 'https://picsum.photos/seed/${currentNumber}/400/300'
                : null,
            audioUrl: (part.index <= 3) ? 'mock_audio_url' : null,
          ),
        );
      }
    });

    return questions;
  }
}

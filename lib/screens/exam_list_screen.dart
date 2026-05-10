import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import 'exam_session_screen.dart';

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

    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách đề thi')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.assignment, color: Colors.blue),
              title: Text(
                exam.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(exam.description ?? ''),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ExamSessionScreen(exam: exam),
                    ),
                  );
                },
                child: const Text('Bắt đầu'),
              ),
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

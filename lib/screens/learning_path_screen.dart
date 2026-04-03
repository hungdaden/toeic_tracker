import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class LearningPathScreen extends StatelessWidget {
  const LearningPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();
    final latestScore = provider.latestScore;

    if (latestScore == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Lộ Trình Học')),
        body: const Center(
          child: Text('Hãy nhập điểm để nhận lộ trình phù hợp.'),
        ),
      );
    }

    final total = latestScore.totalScore;
    String level;
    String description;
    List<String> advice;
    Color levelColor;

    if (total < 450) {
      level = 'Mức Cơ Bản (< 450)';
      description = 'Tập trung xây dựng nền tảng ngữ pháp và từ vựng.';
      levelColor = Colors.orangeAccent;
      advice = [
        'Học 600 từ vựng TOEIC cơ bản.',
        'Ôn tập các cấu trúc ngữ pháp thông dụng.',
        'Luyện nghe chép chính tả hội thoại Part 1, 2.',
      ];
    } else if (total < 650) {
      level = 'Mức Trung Cấp (450 - 650)';
      description = 'Tăng cường từ vựng chuyên ngành và kỹ năng trả lời nhanh.';
      levelColor = Colors.lightBlueAccent;
      advice = [
        'Đọc hiểu điền từ Part 5, 6.',
        'Nghe hiểu đoạn hội thoại ngắn Part 3.',
        'Làm quen với các bẫy thường gặp trong TOEIC.',
      ];
    } else if (total < 800) {
      level = 'Mức Khá (650 - 800)';
      description = 'Rèn luyện phản xạ và tốc độ làm bài.';
      levelColor = Colors.greenAccent;
      advice = [
        'Tập trung luyện nghe phát biểu Part 4.',
        'Kỹ năng quét thông tin (Scanning & Skimming) Part 7.',
        'Làm bài test bấm giờ thực tế định kỳ.',
      ];
    } else {
      level = 'Mức Nâng Cao (> 800)';
      description = 'Hoàn thiện kĩ năng để đạt điểm tối đa.';
      levelColor = Colors.purpleAccent;
      advice = [
        'Luyện đề siêu tốc, rút gọn thời gian làm bài.',
        'Ôn lại các câu hỏi hóc búa, từ vựng hiếm gặp.',
        'Phân tích lỗi sai thật kỹ sau mỗi đề thi.',
      ];
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Lộ Trình Cá Nhân Hóa')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: levelColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: levelColor, width: 2),
              ),
              child: Column(
                children: [
                  Text(level, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: levelColor)),
                  const SizedBox(height: 12),
                  Text(description, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
                  const Divider(height: 30, color: Colors.white24),
                  Text('Kết quả gần nhất: $total', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Listening: ${latestScore.listeningScore}  |  Reading: ${latestScore.readingScore}', style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Nhiệm vụ trọng tâm:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            ...advice.map((e) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Icon(Icons.auto_awesome, color: levelColor),
                title: Text(e, style: const TextStyle(fontSize: 15)),
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}

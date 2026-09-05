import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../models/toeic_score.dart';
import '../widgets/liquid_glass_app_bar.dart';
import '../theme/liquid_glass_theme.dart';

class LearningPathScreen extends StatelessWidget {
  final ToeicScore? targetScore;
  const LearningPathScreen({super.key, this.targetScore});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();
    final scoreToUse = targetScore ?? provider.latestScore;

    if (scoreToUse == null) {
      return LiquidGlassScaffoldWrapper(
        appBar: const LiquidGlassAppBar(title: 'Lộ Trình Học'),
        child: Center(
          child: LiquidGlassContainer(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(24),
            child: const Text(
              'Hãy nhập điểm để nhận lộ trình phù hợp.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    final total = scoreToUse.calculateTotal(provider.currentUser?.isFourSkills ?? false);
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

    final topPadding = LiquidGlassTheme.getAppBarContentTop(context, 8);

    return LiquidGlassScaffoldWrapper(
      appBar: const LiquidGlassAppBar(title: 'Lộ Trình Cá Nhân Hóa'),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, topPadding, 16, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LiquidGlassContainer(
              borderRadius: 24,
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: levelColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: levelColor.withValues(alpha: 0.5)),
                    ),
                    child: Text(
                      level,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: levelColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15, color: Colors.white, height: 1.4),
                  ),
                  const SizedBox(height: 16),
                  Divider(height: 1, color: Colors.white.withValues(alpha: 0.1)),
                  const SizedBox(height: 16),
                  Text(
                    targetScore != null
                        ? 'Kết quả đang xem: $total điểm'
                        : 'Kết quả gần nhất: $total điểm',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Listening: ${scoreToUse.listeningScore}  |  Reading: ${scoreToUse.readingScore}',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.only(left: 4),
              child: Text(
                'Nhiệm vụ trọng tâm:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            ...advice.map(
              (e) => LiquidGlassContainer(
                margin: const EdgeInsets.only(bottom: 12),
                borderRadius: 16,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: levelColor.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.auto_awesome_rounded, color: levelColor, size: 20),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        e,
                        style: const TextStyle(fontSize: 14, color: Colors.white, height: 1.35),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import '../models/exam_model.dart';

class ExamModeModal extends StatelessWidget {
  final ToeicExam exam;
  final ValueChanged<bool> onSelectMode;

  const ExamModeModal({
    super.key,
    required this.exam,
    required this.onSelectMode,
  });

  /// Hiển thị modal chọn chế độ làm bài (Ôn luyện vs Thi thử).
  /// Trả về `true` nếu chọn Thi Thử, `false` nếu chọn Ôn Luyện, hoặc `null` nếu đóng.
  static Future<bool?> show(BuildContext context, {required ToeicExam exam}) {
    HapticUtil.mediumImpact();
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => ExamModeModal(
        exam: exam,
        onSelectMode: (isExamMode) {
          Navigator.pop(ctx, isExamMode);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 28,
          top: 14,
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withValues(alpha: 0.92),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.16),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6366F1).withValues(alpha: 0.25),
              blurRadius: 36,
              offset: const Offset(0, -10),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Thanh kéo handle bar
              Center(
                child: Container(
                  width: 44,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 18),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // Header
              Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6366F1).withValues(alpha: 0.4),
                          blurRadius: 14,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.quiz_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CHỌN CHẾ ĐỘ LÀM BÀI',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          exam.title,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withValues(alpha: 0.7),
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded, color: Colors.white60, size: 22),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // Option 1: Chế độ Ôn Luyện (Practice Mode)
              _buildModeOption(
                context: context,
                isExamMode: false,
                title: 'Chế độ Ôn Luyện',
                subtitle: 'Luyện tập tự do & linh hoạt',
                badgeText: 'Tự do tua Audio',
                badgeColor: const Color(0xFF06B6D4),
                icon: Icons.auto_stories_rounded,
                accentColor: const Color(0xFF06B6D4),
                bulletPoints: [
                  'Cho phép tua tới, tua lui & tạm dừng file nghe (Audio).',
                  'Tự do chuyển câu hỏi và điều chỉnh tốc độ làm bài.',
                  'Phù hợp để ôn luyện kiến thức, giải đề chi tiết.',
                ],
                buttonTitle: 'Bắt đầu Ôn Luyện',
              ),

              const SizedBox(height: 16),

              // Option 2: Chế độ Thi Thử (Real Exam Mode)
              _buildModeOption(
                context: context,
                isExamMode: true,
                title: 'Chế độ Thi Thử Thực Tế',
                subtitle: 'Mô phỏng 100% phòng thi thật',
                badgeText: 'Chuẩn ETS 120p',
                badgeColor: const Color(0xFF8B5CF6),
                icon: Icons.timer_rounded,
                accentColor: const Color(0xFF6366F1),
                bulletPoints: [
                  'Khóa tua lại Audio (mô phỏng áp lực thi thật).',
                  'Tự động chạy Audio ngay khi bắt đầu làm bài.',
                  'Chạy hết audio câu 1 sẽ tự nhảy sang câu 2 & tiếp tục.',
                  'Đồng hồ đếm ngược 120 phút & tính điểm chuẩn ETS.',
                ],
                buttonTitle: 'Bắt đầu Thi Thử',
                isHighlighted: true,
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModeOption({
    required BuildContext context,
    required bool isExamMode,
    required String title,
    required String subtitle,
    required String badgeText,
    required Color badgeColor,
    required IconData icon,
    required Color accentColor,
    required List<String> bulletPoints,
    required String buttonTitle,
    bool isHighlighted = false,
  }) {
    return PressableCardContainerV2(
      onTap: () {
        HapticUtil.lightImpact();
        onSelectMode(isExamMode);
      },
      borderRadius: 20,
      color: isHighlighted
          ? const Color(0xFF1E1B4B).withValues(alpha: 0.6)
          : const Color(0xFF1E293B).withValues(alpha: 0.5),
      borderWidth: isHighlighted ? 1.5 : 1.0,
      borderColor: isHighlighted
          ? accentColor.withValues(alpha: 0.6)
          : Colors.white.withValues(alpha: 0.12),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Row header option
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: accentColor.withValues(alpha: 0.4)),
                ),
                child: Icon(icon, color: accentColor, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: badgeColor.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: badgeColor.withValues(alpha: 0.4)),
                          ),
                          child: Text(
                            badgeText,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: badgeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Bullet points
          ...bulletPoints.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: accentColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      point,
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.white.withValues(alpha: 0.82),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Action Button
          GlassButtonV2(
            title: buttonTitle,
            icon: Icon(
              isExamMode ? Icons.play_arrow_rounded : Icons.menu_book_rounded,
              color: Colors.white,
              size: 16,
            ),
            color: accentColor,
            borderColor: accentColor.withValues(alpha: 0.6),
            textColor: Colors.white,
            shadowColor: accentColor.withValues(alpha: 0.4),
            padding: const EdgeInsets.symmetric(vertical: 10),
            borderRadius: 14,
            onTap: () {
              HapticUtil.mediumImpact();
              onSelectMode(isExamMode);
            },
          ),
        ],
      ),
    );
  }
}

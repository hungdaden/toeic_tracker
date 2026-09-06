import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:may_uikit/may_uikit.dart';
import '../models/toeic_score.dart';
import '../models/user_model.dart';
import '../theme/liquid_glass_theme.dart';
import '../screens/mun_ai_screen.dart';

class MunAIRoadmapModal extends StatelessWidget {
  final ToeicScore score;
  final UserModel user;

  const MunAIRoadmapModal({
    super.key,
    required this.score,
    required this.user,
  });

  static void show(BuildContext context, {required ToeicScore score, required UserModel user}) {
    HapticUtil.mediumImpact();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => MunAIRoadmapModal(score: score, user: user),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isFour = user.isFourSkills;
    final total = score.calculateTotal(isFour);
    final target = user.targetScore ?? (isFour ? 1200 : 750);
    final gap = target - total;
    final advice = _generatePersonalizedAdvice(score, isFour, total, gap);

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          top: 12,
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withValues(alpha: 0.88),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.16),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFA855F7).withValues(alpha: 0.2),
              blurRadius: 32,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Thanh kéo nhỏ (Handle bar)
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

              // Header Mun AI với hiệu ứng Neon
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFA855F7), Color(0xFF7C3AED)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFA855F7).withValues(alpha: 0.45),
                          blurRadius: 14,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: FaIcon(FontAwesomeIcons.cat, color: Colors.white, size: 22),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Lộ trình Mun AI',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFFA855F7).withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFFA855F7).withValues(alpha: 0.5),
                                  width: 1,
                                ),
                              ),
                              child: const Text(
                                'Cá nhân hóa',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFC084FC),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Bài thi: ${DateFormat('dd/MM/yyyy').format(score.date)} • $total điểm',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withValues(alpha: 0.65),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close_rounded, color: Colors.white.withValues(alpha: 0.6)),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Thẻ Band điểm & Chẩn đoán tổng quan
              LiquidGlassContainer(
                padding: const EdgeInsets.all(16),
                borderRadius: 18,
                surfaceColor: advice.tierColor.withValues(alpha: 0.12),
                borderColor: advice.tierColor.withValues(alpha: 0.35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            advice.tierTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.5,
                              color: advice.tierColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (gap > 0)
                          Text(
                            'Cách mục tiêu: +$gap đ',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFF59E0B),
                            ),
                          )
                        else
                          const Text(
                            'Đã vượt mục tiêu! 🎉',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF10B981),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      advice.diagnosisSummary,
                      style: const TextStyle(
                        fontSize: 13.5,
                        height: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Phân tích kỹ năng chi tiết
              Row(
                children: [
                  Expanded(
                    child: _buildSkillStatBox(
                      label: 'Listening',
                      score: score.listening,
                      color: LiquidGlassTheme.scoreListening,
                      icon: Icons.headphones_rounded,
                      status: advice.listeningStatus,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildSkillStatBox(
                      label: 'Reading',
                      score: score.reading,
                      color: LiquidGlassTheme.scoreReading,
                      icon: Icons.menu_book_rounded,
                      status: advice.readingStatus,
                    ),
                  ),
                  if (isFour) ...[
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildSkillStatBox(
                        label: 'Speaking',
                        score: score.speaking,
                        color: LiquidGlassTheme.scoreSpeaking,
                        icon: Icons.mic_rounded,
                        status: score.speaking >= 130 ? 'Khá' : 'Cần ôn',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildSkillStatBox(
                        label: 'Writing',
                        score: score.writing,
                        color: LiquidGlassTheme.scoreWriting,
                        icon: Icons.edit_note_rounded,
                        status: score.writing >= 130 ? 'Khá' : 'Cần ôn',
                      ),
                    ),
                  ],
                ],
              ),

              const SizedBox(height: 18),

              // Kế hoạch hành động gợi ý từ Mun AI
              const Text(
                'KẾ HOẠCH HÀNH ĐỘNG GỢI Ý',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                  color: Color(0xFFC084FC),
                ),
              ),
              const SizedBox(height: 10),

              ...advice.actionSteps.map((step) => _buildActionStepTile(step)),

              const SizedBox(height: 20),

              // Nút CTA: Trò chuyện thêm với Mun AI
              GlassButtonV2(
                title: 'Hỏi Mun AI chi tiết lộ trình này',
                icon: const FaIcon(FontAwesomeIcons.commentDots, size: 16, color: Colors.white),
                gradient: const LinearGradient(
                  colors: [Color(0xFFA855F7), Color(0xFF7C3AED)],
                ),
                borderColor: const Color(0xFFC084FC).withValues(alpha: 0.5),
                textColor: Colors.white,
                shadowColor: const Color(0xFFA855F7).withValues(alpha: 0.4),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MunAIScreen(
                        initialPrompt: 'Mun AI ơi, với bài thi TOEIC ngày ${DateFormat('dd/MM/yyyy').format(score.date)} mình đạt ${score.listening} điểm Nghe và ${score.reading} điểm Đọc (tổng $total điểm). Bạn hãy lên cho mình thời khóa biểu và chiến thuật chi tiết 4 tuần tới nhé!',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillStatBox({
    required String label,
    required int score,
    required Color color,
    required IconData icon,
    required String status,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.6)),
          ),
          const SizedBox(height: 2),
          Text(
            '$score',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
          ),
          const SizedBox(height: 2),
          Text(
            status,
            style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.75)),
          ),
        ],
      ),
    );
  }

  Widget _buildActionStepTile(_RoadmapStep step) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: step.color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(step.icon, color: step.color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  step.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.7),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _PersonalizedAdvice _generatePersonalizedAdvice(ToeicScore s, bool isFour, int total, int gap) {
    final lc = s.listening;
    final rc = s.reading;
    final diff = lc - rc;

    String listeningStatus = 'Ổn định';
    String readingStatus = 'Ổn định';
    if (diff >= 70) {
      listeningStatus = 'Điểm mạnh';
      readingStatus = 'Cần kéo lên ⚠️';
    } else if (diff <= -40) {
      listeningStatus = 'Cần kéo lên ⚠️';
      readingStatus = 'Điểm mạnh';
    }

    // 1. Phân loại theo band điểm
    if (total < 450) {
      return _PersonalizedAdvice(
        tierTitle: 'Band Cơ Bản (<450): Lấy lại nền tảng',
        tierColor: const Color(0xFFEF4444),
        diagnosisSummary: diff >= 50
            ? 'Bạn có khả năng nghe tự nhiên tốt hơn đọc, nhưng ngữ pháp căn bản và từ vựng Part 5 đang làm mất nhiều điểm đáng tiếc.'
            : 'Hãy tập trung xây móng thật vững với 600 từ vựng TOEIC cốt lõi và làm quen các bẫy phổ biến của Part 1 & 2 trước khi giải đề hoàn chỉnh.',
        listeningStatus: listeningStatus,
        readingStatus: readingStatus,
        actionSteps: [
          _RoadmapStep(
            title: 'Học 600 từ vựng TOEIC căn bản',
            description: 'Nắm vững từ vựng các chủ đề văn phòng, du lịch, hợp đồng để hiểu nhanh Part 1, 2 và Part 5.',
            icon: Icons.book_rounded,
            color: const Color(0xFF38BDF8),
          ),
          _RoadmapStep(
            title: 'Chiến thuật Part 1 & Part 2',
            description: 'Luyện nghe bẫy đồng âm, bẫy đại từ Who/Where/When và câu trả lời gián tiếp ở Part 2.',
            icon: Icons.hearing_rounded,
            color: const Color(0xFFA855F7),
          ),
          _RoadmapStep(
            title: 'Ngữ pháp Part 5: Từ loại & Thì',
            description: 'Thuộc lòng vị trí Danh-Tính-Động-Trạng trong câu để giải quyết 15 câu ngữ pháp Part 5 trong 10 giây/câu.',
            icon: Icons.spellcheck_rounded,
            color: const Color(0xFF10B981),
          ),
        ],
      );
    } else if (total < 600) {
      return _PersonalizedAdvice(
        tierTitle: 'Band Tăng Tốc (450 - 595): Vượt ngưỡng 600+',
        tierColor: const Color(0xFFF59E0B),
        diagnosisSummary: diff >= 60
            ? 'Kỹ năng Nghe của bạn ($lc) đang gánh điểm Đọc ($rc). Bạn cần gia tăng tốc độ đọc Part 7 và mệnh đề quan hệ Part 5 để bứt phá band 650+.'
            : 'Điểm số của bạn đang ở ngưỡng bứt phá quan trọng. Cần nâng cao phản xạ Part 3 & 4 và kỹ thuật lướt quét câu hỏi trước khi nghe.',
        listeningStatus: listeningStatus,
        readingStatus: readingStatus,
        actionSteps: [
          _RoadmapStep(
            title: 'Luyện lướt 3 câu hỏi trước ở Part 3 & 4',
            description: 'Dành 15-20 giây lúc máy đọc hướng dẫn để quét nhanh từ khóa hỏi của 3 câu tiếp theo.',
            icon: Icons.speed_rounded,
            color: const Color(0xFFF59E0B),
          ),
          _RoadmapStep(
            title: 'Cải thiện kỹ thuật Scanning Part 7',
            description: 'Đọc lướt câu hỏi -> gạch chân từ khóa (tên riêng, số tiền, ngày tháng) -> định vị thông tin trong bài.',
            icon: Icons.find_in_page_rounded,
            color: const Color(0xFF06B6D4),
          ),
          _RoadmapStep(
            title: 'Tăng tốc độ Part 5 & 6 dưới 20 phút',
            description: 'Không dành quá 30 giây cho bất kỳ câu hỏi nào ở Part 5. Nếu phân vân hãy đánh dấu loại trừ ngay.',
            icon: Icons.timer_outlined,
            color: const Color(0xFF10B981),
          ),
        ],
      );
    } else if (total < 750) {
      return _PersonalizedAdvice(
        tierTitle: 'Band Trung Cao (600 - 745): Chinh phục 750+',
        tierColor: const Color(0xFF06B6D4),
        diagnosisSummary: diff >= 50
            ? 'Bạn nghe rất tốt ($lc) nhưng thời gian làm Part 7 còn chậm khiến bạn phải đánh lụi các câu cuối. Cần tối ưu thời gian 54 câu Part 7!'
            : 'Khả năng đọc hiểu khá vững ($rc). Cần chú trọng các đoạn hội thoại có 3 người nói và biểu đồ hình ảnh ở Part 3 & 4.',
        listeningStatus: listeningStatus,
        readingStatus: readingStatus,
        actionSteps: [
          _RoadmapStep(
            title: 'Xử lý các bài đọc kép & ba (Part 7)',
            description: 'Luyện tập kết nối thông tin giữa 2-3 đoạn văn (ví dụ: email khiếu nại và hóa đơn thanh toán).',
            icon: Icons.auto_stories_rounded,
            color: const Color(0xFF38BDF8),
          ),
          _RoadmapStep(
            title: 'Bẫy giọng Anh - Úc và nối âm (Part 3-4)',
            description: 'Tập nghe giọng người đọc Úc và Anh với kỹ thuật Shadowing 15 phút mỗi ngày sau giờ học.',
            icon: Icons.record_voice_over_rounded,
            color: const Color(0xFFA855F7),
          ),
          _RoadmapStep(
            title: 'Tối ưu phân bổ 75 phút làm Reading',
            description: 'Quy chuẩn: Part 5 (10 phút) -> Part 6 (8 phút) -> Part 7 đơn (25 phút) -> Part 7 kép/ba (32 phút).',
            icon: Icons.access_time_filled_rounded,
            color: const Color(0xFF10B981),
          ),
        ],
      );
    } else if (total < 850) {
      return _PersonalizedAdvice(
        tierTitle: 'Band Cao Cấp (750 - 845): Chạm mốc 850+',
        tierColor: const Color(0xFF6366F1),
        diagnosisSummary: 'Phong độ thi rất ấn tượng! Ở band điểm này, sự khác biệt nằm ở các câu bẫy từ vựng hiếm gặp (collocations), câu hỏi suy luận ngầm (implication) và sức bền tập trung suốt 120 phút.',
        listeningStatus: listeningStatus,
        readingStatus: readingStatus,
        actionSteps: [
          _RoadmapStep(
            title: 'Bẫy câu hỏi suy luận & hàm ý (Implication)',
            description: 'Tập trung các câu hỏi "What does the speaker imply when he says...?" ở Part 3 & 4.',
            icon: Icons.psychology_rounded,
            color: const Color(0xFF6366F1),
          ),
          _RoadmapStep(
            title: 'Bộ cụm từ Collocations & Phrasal Verbs',
            description: 'Ghi chép các cụm từ cố định trong kinh doanh để đạt điểm tuyệt đối ở Part 5 & 6.',
            icon: Icons.menu_book_rounded,
            color: const Color(0xFF8B5CF6),
          ),
          _RoadmapStep(
            title: 'Giải đề ETS 2026 bấm giờ nghiêm ngặt',
            description: 'Luyện 1 đề hoàn chỉnh mỗi tuần trong đúng khung giờ thi thật để rèn luyện độ bền não bộ.',
            icon: Icons.bolt_rounded,
            color: const Color(0xFFF59E0B),
          ),
        ],
      );
    } else {
      return _PersonalizedAdvice(
        tierTitle: 'Band Xuất Sắc (850 - 990): Chinh phục điểm tuyệt đối',
        tierColor: const Color(0xFF10B981),
        diagnosisSummary: 'Chúc mừng bạn! Đây là điểm số mơ ước của mọi thí sinh TOEIC. Bạn đã nắm chắc gần như toàn bộ kiến thức. Mục tiêu của bạn lúc này là duy trì sự ổn định tuyệt đối và loại trừ 100% các sơ suất nhỏ.',
        listeningStatus: 'Tuyệt vời',
        readingStatus: 'Tuyệt vời',
        actionSteps: [
          _RoadmapStep(
            title: 'Quản lý năng lượng & Tránh bẫy sơ suất',
            description: 'Kiểm tra kỹ phiếu tô đáp án, không để mất điểm vì đọc sót chữ "NOT" hoặc "EXCEPT" trong đề.',
            icon: Icons.verified_rounded,
            color: const Color(0xFF10B981),
          ),
          _RoadmapStep(
            title: 'Chiến thuật duy trì phong độ đỉnh cao',
            description: 'Nghe podcast tin tức tiếng Anh quốc tế (BBC, CNN Business) để giữ đôi tai luôn sắc bén.',
            icon: Icons.headset_mic_rounded,
            color: const Color(0xFF06B6D4),
          ),
          _RoadmapStep(
            title: 'Thử thách với đề thi ETS 2026 mới nhất',
            description: 'Làm đề ETS 2026 Test 1 - 10 trong ứng dụng để tiếp cận xu hướng ra đề mới nhất của IIG/ETS.',
            icon: Icons.military_tech_rounded,
            color: const Color(0xFFF59E0B),
          ),
        ],
      );
    }
  }
}

class _PersonalizedAdvice {
  final String tierTitle;
  final Color tierColor;
  final String diagnosisSummary;
  final String listeningStatus;
  final String readingStatus;
  final List<_RoadmapStep> actionSteps;

  _PersonalizedAdvice({
    required this.tierTitle,
    required this.tierColor,
    required this.diagnosisSummary,
    required this.listeningStatus,
    required this.readingStatus,
    required this.actionSteps,
  });
}

class _RoadmapStep {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  _RoadmapStep({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

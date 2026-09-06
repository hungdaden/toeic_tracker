import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:confetti/confetti.dart';
import 'package:intl/intl.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../providers/user_provider.dart';
import 'add_score_screen.dart';
import 'learning_path_screen.dart';
import '../models/toeic_score.dart';
import '../widgets/dynamic_island_notification.dart';
import 'exam_list_screen.dart';
import 'exam_session_screen.dart';
import '../services/exam_service.dart';
import '../models/exam_model.dart';
import '../widgets/mun_ai_roadmap_modal.dart';
import '../widgets/exam_mode_modal.dart';
import '../widgets/notification_bell.dart';
import '../widgets/liquid_glass_app_bar.dart';
import '../theme/liquid_glass_theme.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  ToeicScore? _viewedScore;
  late ConfettiController _confettiController;
  OverlayEntry? _overlayEntry;
  late ScrollController _scrollController;
  bool _isFabVisible = true;

  late ScrollController _examScrollController;
  Timer? _examAutoScrollTimer;
  Timer? _examResumeTimer;
  bool _isUserInteractingWithExams = false;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 8),
    );
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isFabVisible) setState(() => _isFabVisible = false);
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!_isFabVisible) setState(() => _isFabVisible = true);
      }
    });

    _examScrollController = ScrollController();
    _startExamAutoScroll();
  }

  void _startExamAutoScroll() {
    _examAutoScrollTimer?.cancel();
    _examAutoScrollTimer = Timer.periodic(const Duration(milliseconds: 3500), (timer) {
      _scrollToNextExam();
    });
  }

  void _scrollToNextExam() {
    if (!_examScrollController.hasClients || _isUserInteractingWithExams || !mounted) return;

    final maxScroll = _examScrollController.position.maxScrollExtent;
    final currentScroll = _examScrollController.offset;
    const cardSpan = 287.0; // 275 card width + 12 right margin

    // Tính chỉ số card tiếp theo để luôn đặt đề tiếp theo vào điểm đầu một cách chuẩn xác
    final int nextIndex = (currentScroll / cardSpan + 0.05).floor() + 1;
    final double targetScroll = nextIndex * cardSpan;

    if (currentScroll >= maxScroll - 5 || targetScroll > maxScroll + 10) {
      // Đến cuối danh sách -> lướt mượt mà trở lại đầu
      _examScrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeInOutCubic,
      );
    } else {
      // Trượt sang đề tiếp theo và căn chuẩn vào điểm đầu
      _examScrollController.animateTo(
        targetScroll.clamp(0.0, maxScroll),
        duration: const Duration(milliseconds: 750),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _onUserExamInteractionStart() {
    _isUserInteractingWithExams = true;
    _examAutoScrollTimer?.cancel();
    _examResumeTimer?.cancel();
  }

  void _onUserExamInteractionEnd() {
    _isUserInteractingWithExams = false;
    _examResumeTimer?.cancel();
    _examResumeTimer = Timer(const Duration(milliseconds: 3500), () {
      if (!_isUserInteractingWithExams && mounted) {
        // Căn chỉnh đề tiếp theo vào điểm đầu ngay khi tiếp tục auto-scroll
        _scrollToNextExam();
        _startExamAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _examAutoScrollTimer?.cancel();
    _examResumeTimer?.cancel();
    _examScrollController.dispose();
    _confettiController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _showAimHitOverlay() {
    if (_overlayEntry != null) return;

    _confettiController.play();
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return _AimHitOverlay(
          confettiController: _confettiController,
          onDismiss: _removeOverlay,
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, child) {
        final currentUser = provider.currentUser;
        if (currentUser == null) {
          return const LiquidGlassScaffoldWrapper(
            child: Center(
              child: Text(
                'Vui lòng chọn hoặc tạo hồ sơ ở tab Hồ Sơ',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          );
        }

        if (_viewedScore != null &&
            !currentUser.scores.any((s) => s.id == _viewedScore!.id)) {
          _viewedScore = null;
        }

        final displayScore = _viewedScore ?? provider.latestScore;

        final topPadding = LiquidGlassTheme.getAppBarContentTop(context, 4);

        return LiquidGlassScaffoldWrapper(
          appBar: LiquidGlassAppBar(
            titleWidget: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                  ),
                  child: ClipOval(
                    child: currentUser.avatarUrl != null
                        ? Image.network(
                            currentUser.avatarUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => _buildAvatarFallback(currentUser.name),
                          )
                        : _buildAvatarFallback(currentUser.name),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  currentUser.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            actions: const [
              NotificationBell(),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: AnimatedSlide(
            offset: _isFabVisible ? Offset.zero : const Offset(0, 2),
            duration: const Duration(milliseconds: 300),
            child: AnimatedOpacity(
              opacity: _isFabVisible ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: LiquidGlassTheme.getFloatingButtonBottomPadding(context),
                ),
                child: GlassButtonV2(
                  title: 'Nhập điểm',
                  icon: const Icon(Icons.add_rounded, color: Colors.white, size: 20),
                  color: const Color(0xFF4F46E5),
                  borderColor: const Color(0xFF818CF8).withValues(alpha: 0.4),
                  textColor: Colors.white,
                  shadowColor: const Color(0xFF4F46E5).withValues(alpha: 0.35),
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AddScoreScreen()),
                    );
                    if (result == true && mounted) {
                      _showAimHitOverlay();
                    }
                  },
                ),
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildExamSelector(context),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'LỊCH SỬ THI',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.1,
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                    if (currentUser.scores.isNotEmpty)
                      Text(
                        '${currentUser.scores.length} bài thi',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                  ],
                ),
              ),
              if (currentUser.scores.isEmpty)
                Expanded(
                  child: Center(
                    child: LiquidGlassContainer(
                      margin: const EdgeInsets.all(24),
                      child: Text(
                        'Chưa có dữ liệu điểm.\nHãy nhấn "Nhập điểm" để bắt đầu!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
                      ),
                    ),
                  ),
                )
              else
                Expanded(
                  child: CommonScrollbarWithIosStatusBarTapDetectorV2(
                    controller: _scrollController,
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 180),
                      itemCount: currentUser.scores.length + 1,
                      itemBuilder: (context, index) {
                        if (index == currentUser.scores.length) {
                          return _buildSupportContactCard();
                        }

                        final score = currentUser.scores[index];
                        final isSelected = _viewedScore?.id == score.id;
                        final total = score.calculateTotal(currentUser.isFourSkills);

                        return Slidable(
                          key: Key(score.id),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.75,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                                  child: Builder(
                                    builder: (actionCtx) => PressableCardContainerV2(
                                      onTap: () {
                                        Slidable.of(actionCtx)?.close();
                                        MunAIRoadmapModal.show(context, score: score, user: currentUser);
                                      },
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFFA855F7), Color(0xFF7C3AED)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: 16,
                                      borderColor: const Color(0xFFC084FC).withValues(alpha: 0.5),
                                      borderWidth: 1.0,
                                      shadowColor: const Color(0xFF581C87).withValues(alpha: 0.5),
                                      pressedOffset: 3.0,
                                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                                      child: const Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            FaIcon(FontAwesomeIcons.cat, color: Colors.white, size: 17),
                                            SizedBox(height: 4),
                                            Text(
                                              'Lộ trình',
                                              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                                  child: Builder(
                                    builder: (actionCtx) => PressableCardContainerV2(
                                      onTap: () async {
                                        Slidable.of(actionCtx)?.close();
                                        final result = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => AddScoreScreen(existingScore: score),
                                          ),
                                        );
                                        if (result == true && mounted) {
                                          _showAimHitOverlay();
                                        }
                                      },
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: 16,
                                      borderColor: const Color(0xFF93C5FD).withValues(alpha: 0.5),
                                      borderWidth: 1.0,
                                      shadowColor: const Color(0xFF1E3A8A).withValues(alpha: 0.5),
                                      pressedOffset: 3.0,
                                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                                      child: const Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.edit_rounded, color: Colors.white, size: 19),
                                            SizedBox(height: 4),
                                            Text(
                                              'Sửa',
                                              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                                  child: Builder(
                                    builder: (actionCtx) => PressableCardContainerV2(
                                      onTap: () {
                                        Slidable.of(actionCtx)?.close();
                                        provider.deleteScore(score.id);
                                        DynamicIslandNotification.show(
                                          context,
                                          title: 'Đã xóa',
                                          message:
                                              'Đã xóa điểm thi ngày ${DateFormat('dd/MM/yyyy').format(score.date)}',
                                          type: NotificationType.warning,
                                        );
                                      },
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFFEF4444), Color(0xFFB91C1C)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: 16,
                                      borderColor: const Color(0xFFFCA5A5).withValues(alpha: 0.5),
                                      borderWidth: 1.0,
                                      shadowColor: const Color(0xFF7F1D1D).withValues(alpha: 0.5),
                                      pressedOffset: 3.0,
                                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                                      child: const Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.delete_outline_rounded, color: Colors.white, size: 19),
                                            SizedBox(height: 4),
                                            Text(
                                              'Xóa',
                                              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          child: PressableCardContainerV2(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            borderRadius: 18,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            color: isSelected
                                ? const Color(0xFF1E2640)
                                : const Color(0xFF111827),
                            borderColor: isSelected
                                ? LiquidGlassTheme.primaryAccent.withValues(alpha: 0.6)
                                : Colors.white.withValues(alpha: 0.08),
                            borderWidth: 1.0,
                            shadowColor: Colors.black.withValues(alpha: 0.35),
                            onTap: () {
                              MunAIRoadmapModal.show(context, score: score, user: currentUser);
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        LiquidGlassTheme.scoreTotal.withValues(alpha: 0.3),
                                        LiquidGlassTheme.scoreTotal.withValues(alpha: 0.1),
                                      ],
                                    ),
                                    border: Border.all(
                                      color: LiquidGlassTheme.scoreTotal.withValues(alpha: 0.4),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$total',
                                      style: const TextStyle(
                                        color: LiquidGlassTheme.scoreTotal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateFormat('dd/MM/yyyy').format(score.date),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        currentUser.isFourSkills
                                            ? 'L: ${score.listeningScore} | R: ${score.readingScore} | S: ${score.speakingScore ?? 0} | W: ${score.writingScore ?? 0}'
                                            : 'Nghe: ${score.listeningScore} | Đọc: ${score.readingScore}',
                                        style: TextStyle(
                                          color: Colors.white.withValues(alpha: 0.55),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    MunAIRoadmapModal.show(context, score: score, user: currentUser);
                                  },
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFA855F7).withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: const Color(0xFFA855F7).withValues(alpha: 0.4),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FaIcon(FontAwesomeIcons.cat, size: 11, color: Color(0xFFC084FC)),
                                        SizedBox(width: 5),
                                        Text(
                                          'Lộ trình AI',
                                          style: TextStyle(
                                            color: Color(0xFFC084FC),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: 18,
                                  color: Colors.white.withValues(alpha: 0.35),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    },
  );
  }

  Widget _buildExamSelector(BuildContext context) {
    final exams = ExamService().getAvailableExams();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF06B6D4).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.assignment_rounded, color: Color(0xFF06B6D4), size: 16),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'CHỌN BÀI THI TOEIC',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1,
                      color: Color(0xFF38BDF8),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
                ),
                child: const Text(
                  'ETS 2026 • 10 Đề',
                  style: TextStyle(fontSize: 11, color: Colors.white70, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 195,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollStartNotification) {
                if (notification.dragDetails != null) {
                  _onUserExamInteractionStart();
                }
              } else if (notification is ScrollEndNotification) {
                _onUserExamInteractionEnd();
              } else if (notification is UserScrollNotification) {
                if (notification.direction != ScrollDirection.idle) {
                  _onUserExamInteractionStart();
                } else {
                  _onUserExamInteractionEnd();
                }
              }
              return false;
            },
            child: Listener(
              onPointerDown: (_) => _onUserExamInteractionStart(),
              onPointerUp: (_) => _onUserExamInteractionEnd(),
              onPointerCancel: (_) => _onUserExamInteractionEnd(),
              child: ListView.builder(
                controller: _examScrollController,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: exams.length,
                itemBuilder: (context, index) {
                  final exam = exams[index];
                  return _buildExamCard(context, exam, index);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExamCard(BuildContext context, ToeicExam exam, int index) {
    return Container(
      width: 275,
      margin: const EdgeInsets.only(right: 12, bottom: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            index == 0 ? const Color(0xFF1E1B4B) : const Color(0xFF161F33),
            const Color(0xFF0F172A),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: index == 0
              ? const Color(0xFF818CF8).withValues(alpha: 0.45)
              : Colors.white.withValues(alpha: 0.12),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: index == 0
                ? const Color(0xFF4F46E5).withValues(alpha: 0.25)
                : Colors.black.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'ETS 2026',
                  style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.schedule_rounded, size: 12, color: Colors.white70),
                    SizedBox(width: 4),
                    Text(
                      '200 câu • 120p',
                      style: TextStyle(color: Colors.white70, fontSize: 10.5, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            exam.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            exam.description ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11.5,
              color: Colors.white.withValues(alpha: 0.65),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.headphones_rounded, size: 14, color: Colors.white.withValues(alpha: 0.6)),
                  const SizedBox(width: 4),
                  Text('Audio', style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.6))),
                  const SizedBox(width: 8),
                  Icon(Icons.image_rounded, size: 14, color: Colors.white.withValues(alpha: 0.6)),
                  const SizedBox(width: 4),
                  Text('Ảnh', style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.6))),
                ],
              ),
              const Spacer(),
              GlassButtonV2(
                title: 'Làm bài',
                icon: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 16),
                color: const Color(0xFF4F46E5),
                borderColor: const Color(0xFF818CF8).withValues(alpha: 0.5),
                textColor: Colors.white,
                shadowColor: const Color(0xFF4F46E5).withValues(alpha: 0.35),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                borderRadius: 14,
                onTap: () async {
                  final isExamMode = await ExamModeModal.show(context, exam: exam);
                  if (isExamMode == null || !context.mounted) return;

                  DynamicIslandNotification.show(
                    context,
                    title: isExamMode ? 'Chế độ Thi Thử' : 'Chế độ Ôn Luyện',
                    message: 'Đang tải ${exam.title}...',
                    type: NotificationType.info,
                  );
                  final loaded = await ExamService().loadExam(exam.id);
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExamSessionScreen(exam: loaded, isExamMode: isExamMode),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarFallback(String name) {
    return Center(
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '?',
        style: const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLatestScoreHeroCard(
    BuildContext context,
    ToeicScore displayedScore,
    bool isFourSkills,
  ) {
    final bool isViewingPast = _viewedScore != null;
    final total = displayedScore.calculateTotal(isFourSkills);

    return LiquidGlassContainer(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      borderRadius: 24,
      padding: const EdgeInsets.all(20),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF1E1B4B),
          Color(0xFF0F172A),
        ],
      ),
      borderColor: const Color(0xFF6366F1).withValues(alpha: 0.3),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isViewingPast
                        ? 'ĐIỂM NGÀY ${DateFormat('dd/MM/yyyy').format(displayedScore.date)}'
                        : 'KẾT QUẢ GẦN NHẤT',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.white, Color(0xFFC7D2FE)],
                ).createShader(bounds),
                child: Text(
                  '$total',
                  style: const TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1.5,
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Skill badges: 2 skills chia làm 2 cột 1 dòng, 4 skills chia làm 2 cột 2 dòng
              if (!isFourSkills)
                Row(
                  children: [
                    Expanded(
                      child: LiquidGlassChip(
                        icon: Icons.headphones_rounded,
                        label: 'Nghe',
                        value: '${displayedScore.listeningScore}',
                        accentColor: LiquidGlassTheme.scoreListening,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: LiquidGlassChip(
                        icon: Icons.menu_book_rounded,
                        label: 'Đọc',
                        value: '${displayedScore.readingScore}',
                        accentColor: LiquidGlassTheme.scoreReading,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: LiquidGlassChip(
                            icon: Icons.headphones_rounded,
                            label: 'Nghe',
                            value: '${displayedScore.listeningScore}',
                            accentColor: LiquidGlassTheme.scoreListening,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: LiquidGlassChip(
                            icon: Icons.menu_book_rounded,
                            label: 'Đọc',
                            value: '${displayedScore.readingScore}',
                            accentColor: LiquidGlassTheme.scoreReading,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: LiquidGlassChip(
                            icon: Icons.mic_rounded,
                            label: 'Nói',
                            value: '${displayedScore.speakingScore ?? 0}',
                            accentColor: LiquidGlassTheme.scoreSpeaking,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: LiquidGlassChip(
                            icon: Icons.edit_note_rounded,
                            label: 'Viết',
                            value: '${displayedScore.writingScore ?? 0}',
                            accentColor: LiquidGlassTheme.scoreWriting,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              const SizedBox(height: 16),

              // CTA Action buttons
              Row(
                children: [
                  Expanded(
                    child: GlassButtonV2(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      title: 'Lộ trình',
                      icon: const Icon(Icons.auto_awesome_rounded, size: 16, color: Color(0xFFA5B4FC)),
                      color: const Color(0xFF23234D),
                      borderColor: const Color(0xFF6366F1).withValues(alpha: 0.5),
                      borderWidth: 1.0,
                      textColor: Colors.white,
                      shadowColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LearningPathScreen(targetScore: displayedScore),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GlassButtonV2(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      title: 'Thi thử',
                      icon: const Icon(Icons.assignment_turned_in_rounded, size: 16, color: Color(0xFF7DD3FC)),
                      color: const Color(0xFF152A3D),
                      borderColor: const Color(0xFF0284C7).withValues(alpha: 0.5),
                      borderWidth: 1.0,
                      textColor: Colors.white,
                      shadowColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ExamListScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
            ],
          ),
          if (isViewingPast)
            Positioned(
              top: -6,
              left: -6,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_rounded, color: Colors.white70, size: 20),
                onPressed: () {
                  setState(() {
                    _viewedScore = null;
                  });
                },
                tooltip: 'Trở về điểm gần nhất',
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSupportContactCard() {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('config').doc('system').snapshots(),
      builder: (context, configSnapshot) {
        String zalo = '';
        if (configSnapshot.hasData && configSnapshot.data!.exists) {
          zalo = (configSnapshot.data!.data() as Map<String, dynamic>)['supportZalo'] ?? '';
        }
        if (zalo.isEmpty) return const SizedBox(height: 80);

        return LiquidGlassContainer(
          margin: const EdgeInsets.symmetric(vertical: 16),
          padding: const EdgeInsets.all(16),
          borderRadius: 20,
          child: Column(
            children: [
              const Icon(Icons.support_agent_rounded, color: LiquidGlassTheme.secondaryAccent, size: 28),
              const SizedBox(height: 6),
              Text(
                'Hỗ trợ & giải đáp thắc mắc qua Zalo:',
                style: TextStyle(color: Colors.white.withValues(alpha: 0.65), fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                zalo,
                style: const TextStyle(
                  color: LiquidGlassTheme.secondaryAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AimHitOverlay extends StatefulWidget {
  final ConfettiController confettiController;
  final VoidCallback onDismiss;

  const _AimHitOverlay({
    required this.confettiController,
    required this.onDismiss,
  });

  @override
  State<_AimHitOverlay> createState() => _AimHitOverlayState();
}

class _AimHitOverlayState extends State<_AimHitOverlay> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _startFadeOutTimer();
  }

  void _startFadeOutTimer() async {
    await Future.delayed(const Duration(seconds: 8));
    if (mounted) {
      setState(() => _opacity = 0.0);
    }
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      widget.onDismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => _opacity = 0.0);
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) widget.onDismiss();
        });
      },
      child: Material(
        color: Colors.black.withValues(alpha: 0.6),
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 500),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: ConfettiWidget(
                  confettiController: widget.confettiController,
                  blastDirection: -3.14 / 4,
                  emissionFrequency: 0.3,
                  numberOfParticles: 20,
                  maxBlastForce: 100,
                  minBlastForce: 60,
                  gravity: 0.2,
                  colors: const [Colors.red, Colors.yellow, Colors.pink, Colors.orange],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ConfettiWidget(
                  confettiController: widget.confettiController,
                  blastDirection: -3 * 3.14 / 4,
                  emissionFrequency: 0.3,
                  numberOfParticles: 20,
                  maxBlastForce: 100,
                  minBlastForce: 60,
                  gravity: 0.2,
                  colors: const [Colors.blue, Colors.green, Colors.purple, Colors.cyan],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ConfettiWidget(
                  confettiController: widget.confettiController,
                  blastDirection: -3.14 / 2,
                  blastDirectionality: BlastDirectionality.explosive,
                  maxBlastForce: 150,
                  minBlastForce: 80,
                  emissionFrequency: 0.4,
                  numberOfParticles: 40,
                  gravity: 0.1,
                  colors: const [
                    Colors.red,
                    Colors.blue,
                    Colors.green,
                    Colors.yellow,
                    Colors.pink,
                    Colors.purple,
                    Colors.orange,
                    Colors.white,
                  ],
                ),
              ),
              Center(
                child: LiquidGlassContainer(
                  margin: const EdgeInsets.symmetric(horizontal: 28),
                  padding: const EdgeInsets.all(28),
                  borderRadius: 24,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.stars_rounded, size: 48, color: Color(0xFFFFD700)),
                      const SizedBox(height: 12),
                      const Text(
                        'Chúc mừng bạn đã đạt mức Aim!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Sự nỗ lực không ngừng của bạn đã được đền đáp xứng đáng 🎉',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withValues(alpha: 0.75),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

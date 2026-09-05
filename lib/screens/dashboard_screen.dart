import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:confetti/confetti.dart';
import 'package:intl/intl.dart';
import 'package:may_uikit/may_uikit.dart';
import '../providers/user_provider.dart';
import 'add_score_screen.dart';
import 'learning_path_screen.dart';
import '../models/toeic_score.dart';
import '../widgets/dynamic_island_notification.dart';
import 'exam_list_screen.dart';
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
  }

  @override
  void dispose() {
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
                if (displayScore != null)
                  _buildLatestScoreHeroCard(context, displayScore, currentUser.isFourSkills),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
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
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 120),
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
                            children: [
                              SlidableAction(
                                onPressed: (_) async {
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
                                backgroundColor: const Color(0xFF3B82F6),
                                foregroundColor: Colors.white,
                                icon: Icons.edit_rounded,
                                label: 'Sửa',
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                              ),
                              SlidableAction(
                                onPressed: (_) {
                                  provider.deleteScore(score.id);
                                  DynamicIslandNotification.show(
                                    context,
                                    title: 'Đã xóa',
                                    message:
                                        'Đã xóa điểm thi ngày ${DateFormat('dd/MM/yyyy').format(score.date)}',
                                    type: NotificationType.warning,
                                  );
                                },
                                backgroundColor: const Color(0xFFEF4444),
                                foregroundColor: Colors.white,
                                icon: Icons.delete_outline_rounded,
                                label: 'Xóa',
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
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
                              setState(() {
                                _viewedScore = score;
                              });
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
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: 20,
                                  color: Colors.white.withValues(alpha: 0.4),
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

              // Skill badges
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: [
                  LiquidGlassChip(
                    icon: Icons.headphones_rounded,
                    label: 'Nghe',
                    value: '${displayedScore.listeningScore}',
                    accentColor: LiquidGlassTheme.scoreListening,
                  ),
                  LiquidGlassChip(
                    icon: Icons.menu_book_rounded,
                    label: 'Đọc',
                    value: '${displayedScore.readingScore}',
                    accentColor: LiquidGlassTheme.scoreReading,
                  ),
                  if (isFourSkills) ...[
                    LiquidGlassChip(
                      icon: Icons.mic_rounded,
                      label: 'Nói',
                      value: '${displayedScore.speakingScore ?? 0}',
                      accentColor: LiquidGlassTheme.scoreSpeaking,
                    ),
                    LiquidGlassChip(
                      icon: Icons.edit_note_rounded,
                      label: 'Viết',
                      value: '${displayedScore.writingScore ?? 0}',
                      accentColor: LiquidGlassTheme.scoreWriting,
                    ),
                  ],
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
                      borderColor: const Color(0xFF6366F1).withValues(alpha: 0.35),
                      textColor: Colors.white,
                      shadowColor: Colors.black.withValues(alpha: 0.35),
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
                      borderColor: const Color(0xFF0284C7).withValues(alpha: 0.35),
                      textColor: Colors.white,
                      shadowColor: Colors.black.withValues(alpha: 0.35),
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

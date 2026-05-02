import 'package:flutter/rendering.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:confetti/confetti.dart';
import '../providers/user_provider.dart';
import 'package:intl/intl.dart';
import 'add_score_screen.dart';
import 'learning_path_screen.dart';
import '../models/toeic_score.dart';

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
          return const Center(
            child: Text('Vui lòng chọn hoặc tạo hồ sơ ở tab Hồ Sơ'),
          );
        }

        // If _viewedScore is selected but gets deleted, we should clear it
        if (_viewedScore != null &&
            !currentUser.scores.any((s) => s.id == _viewedScore!.id)) {
          _viewedScore = null;
        }

        final displayScore = _viewedScore ?? provider.latestScore;

        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: currentUser.avatarUrl != null
                      ? NetworkImage(currentUser.avatarUrl!)
                      : null,
                  child: currentUser.avatarUrl == null
                      ? Text(
                          currentUser.name[0],
                          style: const TextStyle(fontSize: 12),
                        )
                      : null,
                ),
                const SizedBox(width: 8),
                Text(
                  currentUser.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.route),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          LearningPathScreen(targetScore: displayScore),
                    ),
                  );
                },
                tooltip: 'Lộ trình học',
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (displayScore != null)
                _buildLatestScoreCard(context, displayScore, currentUser.isFourSkills),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Lịch sử thi (Nhấn để xem)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              if (currentUser.scores.isEmpty)
                const Expanded(
                  child: Center(
                    child: Text(
                      'Chưa có dữ liệu điểm.\nHãy thêm điểm mới!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: currentUser.scores.length,
                    itemBuilder: (context, index) {
                      final score = currentUser.scores[index];
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
                                    builder: (_) =>
                                        AddScoreScreen(existingScore: score),
                                  ),
                                );
                                if (result == true && mounted) {
                                  _showAimHitOverlay();
                                }
                              },
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Sửa',
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            SlidableAction(
                              onPressed: (_) {
                                provider.deleteScore(score.id);
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Xóa',
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _viewedScore = score;
                            });
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6,
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primary.withAlpha(51),
                                child: Text(
                                  '${score.totalScore}',
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              title: Text(
                                DateFormat('dd/MM/yyyy').format(score.date),
                              ),
                              subtitle: Text(
                                currentUser.isFourSkills 
                                    ? 'L: ${score.listeningScore} | R: ${score.readingScore} | S: ${score.speakingScore ?? 0} | W: ${score.writingScore ?? 0}'
                                    : 'Listening: ${score.listeningScore} | Reading: ${score.readingScore}',
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
          floatingActionButton: AnimatedSlide(
            offset: _isFabVisible ? Offset.zero : const Offset(0, 2),
            duration: const Duration(milliseconds: 300),
            child: AnimatedOpacity(
              opacity: _isFabVisible ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: FloatingActionButton.extended(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddScoreScreen()),
                  );
                  if (result == true && mounted) {
                    _showAimHitOverlay();
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text('Nhập điểm'),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLatestScoreCard(
    BuildContext context,
    ToeicScore displayedScore,
    bool isFourSkills,
  ) {
    bool isViewingPast = _viewedScore != null;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withAlpha(204),
            const Color(0xFF3949AB),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withAlpha(51),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Text(
                isViewingPast
                    ? 'ĐIỂM NGÀY ${DateFormat('dd/MM/yyyy').format(displayedScore.date)}'
                    : 'ĐIỂM GẦN NHẤT',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${displayedScore.totalScore}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.headphones, color: Colors.white),
                      const SizedBox(height: 4),
                      Text(
                        '${displayedScore.listeningScore}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Container(width: 1, height: 40, color: Colors.white30),
                  Column(
                    children: [
                      const Icon(Icons.menu_book, color: Colors.white),
                      const SizedBox(height: 4),
                      Text(
                        '${displayedScore.readingScore}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  if (isFourSkills) ...[
                    Container(width: 1, height: 40, color: Colors.white30),
                    Column(
                      children: [
                        const Icon(Icons.mic, color: Colors.white),
                        const SizedBox(height: 4),
                        Text(
                          '${displayedScore.speakingScore ?? 0}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Container(width: 1, height: 40, color: Colors.white30),
                    Column(
                      children: [
                        const Icon(Icons.edit_document, color: Colors.white),
                        const SizedBox(height: 4),
                        Text(
                          '${displayedScore.writingScore ?? 0}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            LearningPathScreen(targetScore: displayedScore),
                      ),
                    );
                  },
                  icon: const Icon(Icons.auto_awesome),
                  label: const Text(
                    'Xem Lộ Trình Đề Xuất',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF3949AB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isViewingPast)
            Positioned(
              top: -10,
              left: -10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _viewedScore = null;
                  });
                },
                tooltip: 'Trở về điểm hiện tại',
              ),
            ),
        ],
      ),
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
        color: Colors.black.withOpacity(0.4),
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 500),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: ConfettiWidget(
                  confettiController: widget.confettiController,
                  blastDirection: -3.14 / 2, // UP
                  maxBlastForce: 120, // Tăng lực bắn
                  minBlastForce: 50,
                  emissionFrequency: 0.2, // Tần suất bắn dày đặc
                  numberOfParticles: 80, // Nhiều pháo hoa hơn
                  gravity: 0.15,
                  colors: const [
                    Colors.red,
                    Colors.blue,
                    Colors.green,
                    Colors.yellow,
                    Colors.pink,
                    Colors.purple,
                    Colors.orange,
                  ],
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Sự cố gắng cuối cùng cũng được đền đáp rồi! Chúc mừng bạn đã đạt được mức Aim <3',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xFFFF3366),
                          shadows: [
                            Shadow(
                              color: Colors.pinkAccent.withOpacity(0.4),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
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

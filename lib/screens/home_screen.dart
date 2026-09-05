import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:may_uikit/may_uikit.dart';
import '../providers/user_provider.dart';
import '../providers/auth_provider.dart';
import '../models/user_model.dart';
import '../models/toeic_score.dart';
import 'login_screen.dart';
import '../widgets/notification_bell.dart';
import '../widgets/liquid_glass_app_bar.dart';
import '../theme/liquid_glass_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (!authProvider.isAuthenticated) {
      return LiquidGlassScaffoldWrapper(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: LiquidGlassContainer(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            LiquidGlassTheme.primaryAccent.withValues(alpha: 0.3),
                            LiquidGlassTheme.secondaryAccent.withValues(alpha: 0.1),
                          ],
                        ),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.25),
                          width: 1.5,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.school_rounded,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Chào mừng bạn đến với\nTOEIC Tracker!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Vui lòng đăng nhập để lưu trữ hồ sơ học tập, đồng bộ dữ liệu và sử dụng trợ lý Mun AI.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white.withValues(alpha: 0.65),
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    GlassButtonV2(
                      title: 'Đăng nhập ngay',
                      icon: const Icon(Icons.login_rounded, size: 20, color: Colors.white),
                      color: const Color(0xFF4F46E5),
                      borderColor: const Color(0xFF818CF8).withValues(alpha: 0.4),
                      textColor: Colors.white,
                      shadowColor: const Color(0xFF4F46E5).withValues(alpha: 0.35),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return LiquidGlassScaffoldWrapper(
      appBar: const LiquidGlassAppBar(
        title: 'Tổng Quan Học Tập',
        actions: [
          NotificationBell(),
        ],
      ),
      child: Consumer<UserProvider>(
        builder: (context, provider, child) {
          final currentUser = provider.currentUser;
          final localUsers = provider.users;
          final groupMembers = provider.groupMembers;
          final isInGroup = currentUser?.groupId != null && currentUser!.groupId!.isNotEmpty;

          if (localUsers.isEmpty) {
            return Center(
              child: LiquidGlassContainer(
                margin: const EdgeInsets.all(24),
                child: Text(
                  'Chưa có hồ sơ nào. Hãy tạo một hồ sơ mới ở mục "Hồ sơ".',
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          List<UserModel> displayList = List.from(localUsers);
          if (isInGroup) {
            final otherMembers = groupMembers.where((m) => !localUsers.any((lu) => lu.id == m.id)).toList();
            displayList.addAll(otherMembers);
          }

          final scrollController = ScrollController();
          final topPadding = LiquidGlassTheme.getAppBarContentTop(context, 12);

          return CommonScrollbarWithIosStatusBarTapDetectorV2(
            controller: scrollController,
            child: ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.fromLTRB(16, topPadding, 16, 120),
              itemCount: displayList.length,
              itemBuilder: (context, index) {
                final user = displayList[index];
                final isLocal = localUsers.any((lu) => lu.id == user.id);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index == 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 4, bottom: 10),
                        child: Text(
                          'HỒ SƠ CỦA BẠN',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            letterSpacing: 1.1,
                            color: Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    if (isInGroup && index == localUsers.length)
                      Padding(
                        padding: const EdgeInsets.only(left: 4, top: 16, bottom: 10),
                        child: Text(
                          'THÀNH VIÊN TRONG NHÓM',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            letterSpacing: 1.1,
                            color: Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    _LiquidUserCard(user: user, isLocal: isLocal),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _LiquidUserCard extends StatefulWidget {
  final UserModel user;
  final bool isLocal;

  const _LiquidUserCard({required this.user, required this.isLocal});

  @override
  State<_LiquidUserCard> createState() => _LiquidUserCardState();
}

class _LiquidUserCardState extends State<_LiquidUserCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    final isLocal = widget.isLocal;
    final scores = List<ToeicScore>.from(user.scores);
    scores.sort((a, b) => b.date.compareTo(a.date));

    final displayScores = _isExpanded ? scores : scores.take(3).toList();

    return PressableCardContainerV2(
      margin: const EdgeInsets.only(bottom: 16),
      borderRadius: 24,
      padding: const EdgeInsets.all(18),
      color: const Color(0xFF111827),
      borderColor: Colors.white.withValues(alpha: 0.1),
      borderWidth: 1.0,
      shadowColor: Colors.black.withValues(alpha: 0.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Avatar, Name, Streak & Group tags
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      LiquidGlassTheme.primaryAccent.withValues(alpha: 0.6),
                      LiquidGlassTheme.secondaryAccent.withValues(alpha: 0.4),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 2.0,
                  ),
                ),
                child: ClipOval(
                  child: user.avatarUrl != null
                      ? Image.network(
                          user.avatarUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => _buildAvatarFallback(user),
                        )
                      : _buildAvatarFallback(user),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: -0.3,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (!isLocal)
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: LiquidGlassTheme.secondaryAccent.withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: LiquidGlassTheme.secondaryAccent.withValues(alpha: 0.4),
                                width: 0.8,
                              ),
                            ),
                            child: const Text(
                              'NHÓM',
                              style: TextStyle(
                                fontSize: 10,
                                color: LiquidGlassTheme.secondaryAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        if (user.currentStreak >= 3)
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: LiquidGlassTheme.streakFire.withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: LiquidGlassTheme.streakFire.withValues(alpha: 0.45),
                                width: 0.8,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.local_fire_department_rounded,
                                  color: LiquidGlassTheme.streakFire,
                                  size: 14,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  '${user.currentStreak}',
                                  style: const TextStyle(
                                    color: LiquidGlassTheme.streakFire,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Ngày sinh: ${DateFormat('dd/MM/yyyy').format(user.dateOfBirth)}',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.55),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Divider
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(
              height: 1,
              color: Colors.white.withValues(alpha: 0.08),
            ),
          ),

          // Scores section
          if (displayScores.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Điểm thi gần nhất',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${scores.length} bài thi',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...displayScores.map((score) => _buildScoreSession(score, user.isFourSkills)),
            if (scores.length > 3)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: GlassButtonV2(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    title: _isExpanded ? 'Thu gọn' : 'Xem tất cả (${scores.length})',
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  ),
                ),
              ),
          ] else ...[
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Text(
                  'Chưa có dữ liệu điểm thi.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatarFallback(UserModel user) {
    return Center(
      child: Text(
        user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildScoreSession(ToeicScore score, bool isFourSkills) {
    final total = score.calculateTotal(isFourSkills);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
          width: 0.8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('dd/MM/yyyy').format(score.date),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: LiquidGlassTheme.scoreTotal.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: LiquidGlassTheme.scoreTotal.withValues(alpha: 0.4),
                    width: 0.8,
                  ),
                ),
                child: Text(
                  'Tổng: $total',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: LiquidGlassTheme.scoreTotal,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              LiquidGlassChip(
                label: 'Nghe',
                value: '${score.listeningScore}',
                accentColor: LiquidGlassTheme.scoreListening,
              ),
              LiquidGlassChip(
                label: 'Đọc',
                value: '${score.readingScore}',
                accentColor: LiquidGlassTheme.scoreReading,
              ),
              if (isFourSkills) ...[
                LiquidGlassChip(
                  label: 'Nói',
                  value: '${score.speakingScore ?? 0}',
                  accentColor: LiquidGlassTheme.scoreSpeaking,
                ),
                LiquidGlassChip(
                  label: 'Viết',
                  value: '${score.writingScore ?? 0}',
                  accentColor: LiquidGlassTheme.scoreWriting,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:may_uikit/may_uikit.dart';
import '../providers/user_provider.dart';
import '../models/user_model.dart';
import '../widgets/group_dialog.dart';
import '../theme/liquid_glass_theme.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  bool _showGroupMode = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();
    final currentUser = provider.currentUser;
    final isInGroup = currentUser?.groupId != null && currentUser!.groupId!.isNotEmpty;
    final effectiveMode = isInGroup ? _showGroupMode : false;
    final users = effectiveMode ? provider.groupMembers : provider.users;

    List<Map<String, dynamic>> rankings = [];
    for (var user in users) {
      for (var score in user.scores) {
        rankings.add({'user': user, 'score': score});
      }
    }

    rankings.sort(
      (a, b) => (b['score'].calculateTotal((b['user'] as UserModel).isFourSkills) as int).compareTo(
        (a['score'].calculateTotal((a['user'] as UserModel).isFourSkills) as int),
      ),
    );

    return LiquidGlassScaffoldWrapper(
      appBar: AppBar(
        title: Text(effectiveMode ? 'Bảng Vàng Nhóm' : 'Bảng Vàng Cá Nhân'),
        actions: [
          IconButton(
            icon: Icon(isInGroup ? Icons.group_rounded : Icons.group_add_rounded, color: Colors.white),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => const GroupDialog(),
            ),
            tooltip: 'Quản lý nhóm',
          ),
          const SizedBox(width: 8),
        ],
      ),
      child: Column(
        children: [
          if (isInGroup)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: LiquidGlassContainer(
                borderRadius: 16,
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _showGroupMode = false),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: !_showGroupMode ? LiquidGlassTheme.primaryButtonGradient : null,
                            color: !_showGroupMode ? null : Colors.transparent,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Cá Nhân',
                            style: TextStyle(
                              color: !_showGroupMode ? Colors.white : Colors.white60,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _showGroupMode = true),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: _showGroupMode ? LiquidGlassTheme.primaryButtonGradient : null,
                            color: _showGroupMode ? null : Colors.transparent,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Nhóm',
                            style: TextStyle(
                              color: _showGroupMode ? Colors.white : Colors.white60,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: rankings.isEmpty
                ? Center(
                    child: LiquidGlassContainer(
                      margin: const EdgeInsets.all(24),
                      child: Text(
                        'Chưa có dữ liệu điểm nào để xếp hạng.',
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
                      ),
                    ),
                  )
                : CommonScrollbarWithIosStatusBarTapDetectorV2(
                    controller: _scrollController,
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 120),
                      itemCount: rankings.length,
                      itemBuilder: (context, index) {
                        final userMap = rankings[index];
                        final UserModel user = userMap['user'];
                        final scoreObj = userMap['score'];
                        final int score = scoreObj.calculateTotal(user.isFourSkills);
                        final DateTime date = scoreObj.date;

                        Color? medalColor;
                        IconData? medalIcon;
                        Color borderColor = Colors.white.withValues(alpha: 0.1);

                        if (index == 0) {
                          medalColor = const Color(0xFFFFD700);
                          medalIcon = Icons.military_tech_rounded;
                          borderColor = const Color(0xFFFFD700).withValues(alpha: 0.4);
                        } else if (index == 1) {
                          medalColor = const Color(0xFFC0C0C0);
                          medalIcon = Icons.military_tech_rounded;
                          borderColor = const Color(0xFFC0C0C0).withValues(alpha: 0.4);
                        } else if (index == 2) {
                          medalColor = const Color(0xFFCD7F32);
                          medalIcon = Icons.military_tech_rounded;
                          borderColor = const Color(0xFFCD7F32).withValues(alpha: 0.4);
                        }

                        return PressableCardContainerV2(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          borderRadius: 20,
                          padding: const EdgeInsets.all(14),
                          color: index < 3
                              ? medalColor!.withValues(alpha: 0.08)
                              : Colors.white.withValues(alpha: 0.06),
                          borderColor: borderColor,
                          borderWidth: 1.0,
                          child: Row(
                            children: [
                              // Rank number or Medal
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index < 3
                                      ? medalColor!.withValues(alpha: 0.2)
                                      : Colors.white.withValues(alpha: 0.08),
                                  border: Border.all(
                                    color: index < 3
                                        ? medalColor!.withValues(alpha: 0.5)
                                        : Colors.white.withValues(alpha: 0.15),
                                    width: 1.0,
                                  ),
                                ),
                                child: Center(
                                  child: medalIcon != null
                                      ? Icon(medalIcon, color: medalColor, size: 20)
                                      : Text(
                                          '${index + 1}',
                                          style: TextStyle(
                                            color: Colors.white.withValues(alpha: 0.8),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(width: 12),

                              // Avatar
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: index < 3
                                        ? medalColor!.withValues(alpha: 0.4)
                                        : Colors.white.withValues(alpha: 0.2),
                                    width: 1.5,
                                  ),
                                ),
                                child: ClipOval(
                                  child: user.avatarUrl != null
                                      ? Image.network(
                                          user.avatarUrl!,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => _buildAvatarFallback(user.name),
                                        )
                                      : _buildAvatarFallback(user.name),
                                ),
                              ),
                              const SizedBox(width: 12),

                              // User Info
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
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        if (effectiveMode &&
                                            (user.groupRole == 'leader' || user.groupRole == 'co-leader'))
                                          Container(
                                            margin: const EdgeInsets.only(left: 6),
                                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: user.groupRole == 'leader'
                                                  ? Colors.red.withValues(alpha: 0.18)
                                                  : Colors.orange.withValues(alpha: 0.18),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: user.groupRole == 'leader'
                                                    ? Colors.red
                                                    : Colors.orange,
                                                width: 0.8,
                                              ),
                                            ),
                                            child: Text(
                                              user.groupRole == 'leader' ? 'Trưởng nhóm' : 'Phó nhóm',
                                              style: TextStyle(
                                                fontSize: 9,
                                                color: user.groupRole == 'leader'
                                                    ? Colors.redAccent
                                                    : Colors.orangeAccent,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        if (effectiveMode && user.currentStreak >= 3)
                                          Container(
                                            margin: const EdgeInsets.only(left: 6),
                                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: LiquidGlassTheme.streakFire.withValues(alpha: 0.18),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: LiquidGlassTheme.streakFire.withValues(alpha: 0.5),
                                                width: 0.8,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(Icons.local_fire_department_rounded,
                                                    color: LiquidGlassTheme.streakFire, size: 10),
                                                const SizedBox(width: 2),
                                                Text(
                                                  '${user.currentStreak}',
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: LiquidGlassTheme.streakFire,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      'Ngày thi: ${DateFormat('dd/MM/yyyy').format(date)}',
                                      style: TextStyle(
                                        color: Colors.white.withValues(alpha: 0.5),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Score
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: index == 0
                                      ? const Color(0xFFFFD700).withValues(alpha: 0.18)
                                      : LiquidGlassTheme.primaryAccent.withValues(alpha: 0.18),
                                  border: Border.all(
                                    color: index == 0
                                        ? const Color(0xFFFFD700).withValues(alpha: 0.5)
                                        : LiquidGlassTheme.primaryAccent.withValues(alpha: 0.4),
                                    width: 1.0,
                                  ),
                                ),
                                child: Text(
                                  '$score',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: index == 0
                                        ? const Color(0xFFFFD700)
                                        : LiquidGlassTheme.scoreTotal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarFallback(String name) {
    return Center(
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '?',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

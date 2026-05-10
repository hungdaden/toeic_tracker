import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../models/user_model.dart';
import 'package:intl/intl.dart';
import '../widgets/group_dialog.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  bool _showGroupMode = true;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();
    final currentUser = provider.currentUser;
    final isInGroup = currentUser?.groupId != null && currentUser!.groupId!.isNotEmpty;

    // Nếu không ở trong nhóm thì ép về chế độ cá nhân
    final effectiveMode = isInGroup ? _showGroupMode : false;

    final users = effectiveMode ? provider.groupMembers : provider.users;

    // Add all scores from all users to rankings
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

    return Scaffold(
      appBar: AppBar(
        title: Text(effectiveMode ? 'Bảng Vàng Nhóm' : 'Bảng Vàng Cá Nhân'),
        actions: [
          IconButton(
            icon: Icon(isInGroup ? Icons.group_rounded : Icons.group_add_rounded),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => const GroupDialog(),
            ),
            tooltip: 'Quản lý nhóm',
          ),
        ],
      ),
      body: Column(
        children: [
          if (isInGroup)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _showGroupMode = false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: !_showGroupMode ? Theme.of(context).colorScheme.primary : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Cá Nhân',
                            style: TextStyle(
                              color: !_showGroupMode ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _showGroupMode = true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: _showGroupMode ? Theme.of(context).colorScheme.primary : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Nhóm',
                            style: TextStyle(
                              color: _showGroupMode ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.bold,
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
                ? const Center(
                    child: Text(
                      'Chưa có dữ liệu điểm nào để xếp hạng.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: rankings.length,
                    itemBuilder: (context, index) {
                      final userMap = rankings[index];
                      final UserModel user = userMap['user'];
                      final scoreObj = userMap['score'];
                      final int score = scoreObj.calculateTotal(user.isFourSkills);
                      final DateTime date = scoreObj.date;

                      // Colors for top 3
                      Color? cardColor;
                      IconData? medalIcon;
                      Color? medalColor;
                      if (index == 0) {
                        cardColor = Colors.amber.withAlpha(20);
                        medalIcon = Icons.military_tech;
                        medalColor = Colors.amber;
                      } else if (index == 1) {
                        cardColor = Colors.grey.shade400.withAlpha(20);
                        medalIcon = Icons.military_tech;
                        medalColor = Colors.grey.shade400;
                      } else if (index == 2) {
                        cardColor = Colors.brown.shade300.withAlpha(20);
                        medalIcon = Icons.military_tech;
                        medalColor = Colors.brown.shade300;
                      }

                      return Card(
                        color: cardColor,
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: user.avatarUrl != null
                                ? NetworkImage(user.avatarUrl!)
                                : null,
                            child: user.avatarUrl == null
                                ? Text(user.name[0].toUpperCase())
                                : null,
                          ),
                          title: Row(
                            children: [
                              Text(
                                user.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              if (effectiveMode && (user.groupRole == 'leader' || user.groupRole == 'co-leader'))
                                Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: user.groupRole == 'leader' ? Colors.red.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: user.groupRole == 'leader' ? Colors.red : Colors.orange, width: 0.5),
                                  ),
                                  child: Text(
                                    user.groupRole == 'leader' ? 'Trưởng nhóm' : 'Phó nhóm',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: user.groupRole == 'leader' ? Colors.red : Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              if (effectiveMode && user.currentStreak >= 3)
                                Container(
                                  margin: const EdgeInsets.only(left: 4),
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.orange, width: 0.5),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.local_fire_department, color: Colors.orange, size: 12),
                                      const SizedBox(width: 2),
                                      Text(
                                        '${user.currentStreak}',
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (medalIcon != null) ...[
                                const SizedBox(width: 8),
                                Icon(medalIcon, color: medalColor),
                              ],
                            ],
                          ),
                          subtitle: Text(
                            'Ngày thi: ${DateFormat('dd/MM/yyyy').format(date)}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                          trailing: Text(
                            '$score',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

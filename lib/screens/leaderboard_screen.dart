import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../models/user_model.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();
    final users = provider.users;
    
    // Sort users by highest total score
    List<Map<String, dynamic>> rankings = [];
    for (var user in users) {
      if (user.scores.isNotEmpty) {
        final maxScore = user.scores.fold(0, (max, score) => score.totalScore > max ? score.totalScore : max);
        rankings.add({'user': user, 'maxScore': maxScore});
      }
    }

    rankings.sort((a, b) => (b['maxScore'] as int).compareTo((a['maxScore'] as int)));

    return Scaffold(
      appBar: AppBar(title: const Text('Bảng Vàng TOEIC')),
      body: rankings.isEmpty 
          ? const Center(child: Text('Chưa có dữ liệu điểm nào để xếp hạng.', style: TextStyle(color: Colors.grey)))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: rankings.length,
              itemBuilder: (context, index) {
                final userMap = rankings[index];
                final UserModel user = userMap['user'];
                final int score = userMap['maxScore'];
                
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
                      backgroundImage: user.avatarPath != null ? FileImage(File(user.avatarPath!)) : null,
                      child: user.avatarPath == null ? Text(user.name[0].toUpperCase()) : null,
                    ),
                    title: Row(
                      children: [
                        Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        if (medalIcon != null) ...[
                          const SizedBox(width: 8),
                          Icon(medalIcon, color: medalColor)
                        ]
                      ],
                    ),
                    trailing: Text('$score', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                  ),
                );
              },
            ),
    );
  }
}

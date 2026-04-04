import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../models/user_model.dart';
import 'package:intl/intl.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();
    final users = provider.users;
    
    // Add all scores from all users to rankings
    List<Map<String, dynamic>> rankings = [];
    for (var user in users) {
      for (var score in user.scores) {
        rankings.add({'user': user, 'score': score});
      }
    }

    rankings.sort((a, b) => (b['score'].totalScore as int).compareTo((a['score'].totalScore as int)));

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
                final scoreObj = userMap['score'];
                final int score = scoreObj.totalScore;
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
                    subtitle: Text('Ngày thi: ${DateFormat('dd/MM/yyyy').format(date)}', style: const TextStyle(color: Colors.grey)),
                    trailing: Text('$score', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                  ),
                );
              },
            ),
    );
  }
}

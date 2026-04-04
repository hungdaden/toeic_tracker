import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tổng Quan Học Tập'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          final users = provider.users;
          
          if (users.isEmpty) {
            return const Center(child: Text('Chưa có hồ sơ nào.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final scores = user.scores;
              
              // Get up to 3 latest scores
              scores.sort((a, b) => b.date.compareTo(a.date));
              final recentScores = scores.take(3).toList();

              return Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: user.avatarPath != null ? FileImage(File(user.avatarPath!)) : null,
                            child: user.avatarPath == null 
                                ? Text(user.name.isNotEmpty ? user.name[0].toUpperCase() : '?', style: const TextStyle(fontSize: 24)) 
                                : null,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                Text('Ngày sinh: ${DateFormat('dd/MM/yyyy').format(user.dateOfBirth)}', style: const TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 32),
                      if (recentScores.isNotEmpty) ...[
                        const Text('Các điểm thi gần nhất:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 8),
                        ...recentScores.map((score) => Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.withOpacity(0.2)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text('Ngày thi: ${DateFormat('dd/MM/yyyy').format(score.date)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    _buildScoreCard('Listening', score.listeningScore, Colors.blue),
                                    _buildScoreCard('Reading', score.readingScore, Colors.orange),
                                    _buildScoreCard('Tổng điểm', score.totalScore, Colors.green),
                                  ],
                                ),
                            ]
                          )
                        )).toList(),
                      ] else ...[
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text('Chưa có dữ liệu điểm thi.', style: TextStyle(fontStyle: FontStyle.italic)),
                          ),
                        )
                      ],
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildScoreCard(String title, int score, Color color) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color.withOpacity(0.5)),
          ),
          child: Text(
            score.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
          ),
        ),
      ],
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/user_provider.dart';
import '../models/user_model.dart';
import '../models/toeic_score.dart';

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
              return _UserCard(user: users[index]);
            },
          );
        },
      ),
    );
  }
}

class _UserCard extends StatefulWidget {
  final UserModel user;

  const _UserCard({super.key, required this.user});

  @override
  State<_UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<_UserCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    final scores = List<ToeicScore>.from(user.scores);
    scores.sort((a, b) => b.date.compareTo(a.date));

    final displayScores = _isExpanded ? scores : scores.take(3).toList();

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
            if (displayScores.isNotEmpty) ...[
              const Text('Các điểm thi gần nhất:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              ...displayScores.map((score) => Container(
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
              if (scores.length > 3)
                Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Text(_isExpanded ? 'Thu gọn' : 'Xem tất cả (${scores.length})'),
                  ),
                ),
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
  }

  Widget _buildScoreCard(String title, int score, Color defaultColor) {
    // If it's not total score and is less than 300, make it red.
    final color = (title != 'Tổng điểm' && score < 300) ? Colors.red : defaultColor;

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

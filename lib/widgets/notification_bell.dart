import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/notification_history_screen.dart';

class NotificationBell extends StatefulWidget {
  const NotificationBell({super.key});

  @override
  State<NotificationBell> createState() => _NotificationBellState();
}

class _NotificationBellState extends State<NotificationBell> with SingleTickerProviderStateMixin {
  late AnimationController _shakeController;
  int _lastReadTimestamp = 0;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _loadLastRead();
  }

  Future<void> _loadLastRead() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastReadTimestamp = prefs.getInt('last_read_timestamp') ?? 0;
    });
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('notifications')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();

        final docs = snapshot.data!.docs;
        int unreadCount = 0;

        for (var doc in docs) {
          final data = doc.data() as Map<String, dynamic>;
          final sentAt = (data['sentAt'] as Timestamp?)?.millisecondsSinceEpoch ?? 0;
          if (sentAt > _lastReadTimestamp) {
            unreadCount++;
          }
        }

        // Kích hoạt hoặc dừng hiệu ứng rung
        if (unreadCount > 0) {
          _shakeController.repeat(reverse: true);
        } else {
          _shakeController.stop();
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _shakeController,
              builder: (context, child) {
                // Tạo hiệu ứng lắc góc nhẹ
                final angle = sin(_shakeController.value * pi * 4) * 0.15;
                return Transform.rotate(
                  angle: unreadCount > 0 ? angle : 0,
                  child: IconButton(
                    icon: Icon(
                      unreadCount > 0 ? Icons.notifications_active_rounded : Icons.notifications_rounded,
                      color: unreadCount > 0 ? Colors.amber : Colors.white70,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const NotificationHistoryScreen()),
                      );
                      // Load lại timestamp sau khi người dùng quay về
                      _loadLastRead();
                    },
                  ),
                );
              },
            ),
            if (unreadCount > 0)
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFF1E1E1E), width: 1),
                  ),
                  constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
                  child: Text(
                    unreadCount > 9 ? '9+' : '$unreadCount',
                    style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

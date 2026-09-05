import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:may_uikit/may_uikit.dart';
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

        return SizedBox(
          width: 38,
          height: 38,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _shakeController,
                builder: (context, child) {
                  final angle = sin(_shakeController.value * pi * 4) * 0.15;
                  return Transform.rotate(
                    angle: unreadCount > 0 ? angle : 0,
                    child: PressableCardContainerV2(
                      borderRadius: AppRadiusV2.full,
                      padding: EdgeInsets.zero,
                      color: Colors.white.withValues(alpha: 0.08),
                      borderColor: unreadCount > 0
                          ? Colors.amber.withValues(alpha: 0.4)
                          : Colors.white.withValues(alpha: 0.16),
                      borderWidth: 0.8,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const NotificationHistoryScreen(),
                          ),
                        );
                        _loadLastRead();
                      },
                      child: SizedBox(
                        width: 38,
                        height: 38,
                        child: Center(
                          child: Icon(
                            unreadCount > 0
                                ? Icons.notifications_active_rounded
                                : Icons.notifications_rounded,
                            size: 19,
                            color: unreadCount > 0 ? Colors.amber : Colors.white.withValues(alpha: 0.85),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              if (unreadCount > 0)
                Positioned(
                  right: -2,
                  top: -2,
                  child: IgnorePointer(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFEF4444), Color(0xFFDC2626)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withValues(alpha: 0.5),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                      child: Text(
                        unreadCount > 9 ? '9+' : '$unreadCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

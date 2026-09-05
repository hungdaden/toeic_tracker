import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/liquid_glass_app_bar.dart';
import '../theme/liquid_glass_theme.dart';

class NotificationHistoryScreen extends StatefulWidget {
  const NotificationHistoryScreen({super.key});

  @override
  State<NotificationHistoryScreen> createState() => _NotificationHistoryScreenState();
}

class _NotificationHistoryScreenState extends State<NotificationHistoryScreen> {
  int _clearUntilTimestamp = 0;

  @override
  void initState() {
    super.initState();
    _loadClearTimestamp();
  }

  Future<void> _loadClearTimestamp() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _clearUntilTimestamp = prefs.getInt('clear_notifications_timestamp') ?? 0;
    });
    await prefs.setInt('last_read_timestamp', DateTime.now().millisecondsSinceEpoch);
  }

  Future<void> _clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now().millisecondsSinceEpoch;
    await prefs.setInt('clear_notifications_timestamp', now);
    setState(() {
      _clearUntilTimestamp = now;
    });
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = LiquidGlassTheme.getAppBarContentTop(context, 8);

    return LiquidGlassScaffoldWrapper(
      appBar: LiquidGlassAppBar(
        title: 'Lịch sử thông báo',
        actions: [
          LiquidGlassAppBarAction(
            size: 38,
            icon: const Icon(Icons.delete_sweep_rounded, color: Colors.redAccent, size: 20),
            tooltip: 'Xóa tất cả',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xFF1E293B),
                  title: const Text('Xóa lịch sử?', style: TextStyle(color: Colors.white)),
                  content: const Text('Tất cả thông báo hiện tại sẽ bị ẩn đi.', style: TextStyle(color: Colors.white70)),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('HỦY', style: TextStyle(color: Colors.white70))),
                    TextButton(
                      onPressed: () {
                        _clearHistory();
                        Navigator.pop(context);
                      },
                      child: const Text('XÓA', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('notifications')
            .orderBy('sentAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}', style: const TextStyle(color: Colors.redAccent)));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          }

          final allDocs = snapshot.data?.docs ?? [];
          final docs = allDocs.where((doc) {
            final data = doc.data() as Map<String, dynamic>;
            final sentAt = (data['sentAt'] as Timestamp?)?.millisecondsSinceEpoch ?? 0;
            return sentAt > _clearUntilTimestamp;
          }).toList();

          if (docs.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_off_rounded, size: 72, color: Colors.white24),
                  SizedBox(height: 16),
                  Text('Chưa có thông báo nào', style: TextStyle(color: Colors.white54, fontSize: 15)),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.fromLTRB(16, topPadding, 16, 40),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              final title = data['title'] ?? 'Thông báo';
              final body = data['body'] ?? '';
              final sentAt = (data['sentAt'] as Timestamp?)?.toDate() ?? DateTime.now();

              return LiquidGlassContainer(
                margin: const EdgeInsets.only(bottom: 12),
                borderRadius: 20,
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: LiquidGlassTheme.primaryAccent.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.notifications_active_rounded, color: LiquidGlassTheme.primaryAccent, size: 22),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  title,
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                              ),
                              Text(
                                DateFormat('HH:mm - dd/MM').format(sentAt),
                                style: TextStyle(color: Colors.white.withValues(alpha: 0.45), fontSize: 11),
                              ),
                            ],
                          ),
                          if (body.isNotEmpty) ...[
                            const SizedBox(height: 6),
                            Text(
                              body,
                              style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 13, height: 1.4),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

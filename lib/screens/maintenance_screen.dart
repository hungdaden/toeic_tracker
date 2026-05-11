import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('config').doc('system').snapshots(),
        builder: (context, snapshot) {
          String zalo = '...';
          if (snapshot.hasData && snapshot.data!.exists) {
            zalo = (snapshot.data!.data() as Map<String, dynamic>)['supportZalo'] ?? 'đang cập nhật';
          }

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.settings_suggest_rounded, size: 100, color: Colors.orangeAccent),
                  const SizedBox(height: 32),
                  const Text(
                    'HỆ THỐNG ĐANG BẢO TRÌ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Chúng tôi đang nâng cấp hệ thống để mang lại trải nghiệm tốt hơn. Vui lòng quay lại sau ít phút.',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        const Text('Cần hỗ trợ gấp? Liên hệ Zalo quản trị viên:', style: TextStyle(color: Colors.white54, fontSize: 12)),
                        const SizedBox(height: 8),
                        Text(zalo, style: const TextStyle(color: Colors.orangeAccent, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

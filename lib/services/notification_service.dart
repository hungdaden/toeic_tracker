import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/dynamic_island_notification.dart';
import '../main.dart'; // Để lấy navigatorKey

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> init() async {
    try {
      // 1. Xin quyền thông báo (Dành cho iOS/Android)
      final settings = await _fcm.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print('Thông báo: Đã được cấp quyền!');
        
        // 2. Tự động subscribe vào topic chung
        await _fcm.subscribeToTopic('all_users');
        print('Thông báo: Đã đăng ký topic all_users');
      }
    } catch (e) {
      print('Lỗi khởi tạo thông báo: $e');
    }

    // 3. Xử lý khi app đang mở và nhận tin (Foreground từ FCM)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        _showDynamicNotification(
          message.notification!.title ?? 'Thông báo',
          message.notification!.body ?? '',
        );
      }
    });

    // 4. LẮNG NGHE THÔNG BÁO TỪ FIRESTORE (DO ADMIN GỬI)
    _listenToFirestoreNotifications();
  }

  bool _isInitialLoad = true;

  void _listenToFirestoreNotifications() {
    print('Thông báo: Bắt đầu lắng nghe Firestore...');
    
    FirebaseFirestore.instance
        .collection('notifications')
        .orderBy('sentAt', descending: true)
        .limit(5) // Chỉ lấy 5 tin gần nhất để tiết kiệm dữ liệu
        .snapshots()
        .listen((snapshot) {
      
      // Nếu là lần đầu tiên nạp dữ liệu, chúng ta đánh dấu là "tin cũ" và bỏ qua
      if (_isInitialLoad) {
        print('Thông báo: Đã nạp danh sách tin cũ, đang chờ tin mới...');
        _isInitialLoad = false;
        return;
      }

      for (var change in snapshot.docChanges) {
        // Chỉ hiện thông báo nếu đó là một tài liệu MỚI được thêm vào
        if (change.type == DocumentChangeType.added) {
          final data = change.doc.data();
          if (data != null) {
            print('Thông báo: Nhận được tin mới từ Admin: ${data['title']}');
            _showDynamicNotification(
              data['title'] ?? 'Thông báo từ Admin',
              data['body'] ?? '',
            );
          }
        }
      }
    }, onError: (error) {
      print('Lỗi lắng nghe Firestore: $error');
    });
  }

  void _showDynamicNotification(String title, String message) {
    if (navigatorKey.currentContext != null) {
      DynamicIslandNotification.show(
        navigatorKey.currentContext!,
        title: title,
        message: message,
        type: NotificationType.info,
      );
    }
  }

  // Hàm để subscribe/unsubscribe dựa trên trạng thái học tập
  Future<void> updateStreakStatus(int streak) async {
    try {
      if (streak == 0) {
        await _fcm.subscribeToTopic('inactive_users');
      } else {
        await _fcm.unsubscribeFromTopic('inactive_users');
      }
    } catch (e) {
      print('FCM Topic error: $e');
    }
  }
}

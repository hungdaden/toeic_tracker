import 'package:firebase_messaging/firebase_messaging.dart';
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

    // 3. Xử lý khi app đang mở và nhận tin (Foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Nhận thông báo Foreground: ${message.notification?.title}');
      
      // HIỂN THỊ DYNAMIC ISLAND NGAY LẬP TỨC
      if (message.notification != null && navigatorKey.currentContext != null) {
        DynamicIslandNotification.show(
          navigatorKey.currentContext!,
          title: message.notification!.title ?? 'Thông báo mới',
          message: message.notification!.body ?? '',
          type: NotificationType.info,
        );
      }
    });
  }

  // Hàm để subscribe/unsubscribe dựa trên trạng thái học tập
  Future<void> updateStreakStatus(int streak) async {
    if (streak == 0) {
      await _fcm.subscribeToTopic('inactive_users');
      print('Subscribed to inactive_users topic');
    } else {
      await _fcm.unsubscribeFromTopic('inactive_users');
      print('Unsubscribed from inactive_users topic');
    }
  }
}

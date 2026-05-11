import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/dynamic_island_notification.dart';
import '../main.dart'; // Để lấy navigatorKey

class NotificationService {
  // Singleton pattern
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  bool _isInitialLoad = true;
  StreamSubscription<QuerySnapshot>? _notificationSubscription;

  Future<void> init() async {
    print('NotificationService: Đang khởi tạo với tài khoản mới...');
    
    // 1. Dọn dẹp listener cũ nếu có
    await _notificationSubscription?.cancel();
    _isInitialLoad = true; 

    // 2. Lắng nghe Firestore
    _listenToFirestoreNotifications();

    // 3. Xin quyền FCM sau (Nếu lỗi hoặc kẹt cũng không ảnh hưởng đến Firestore)
    try {
      final settings = await _fcm.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      ).timeout(const Duration(seconds: 5));
      print('NotificationService: Quyền thông báo = ${settings.authorizationStatus}');
    } catch (e) {
      print('NotificationService: Lỗi FCM permission (Bỏ qua): $e');
    }
  }

  void _listenToFirestoreNotifications() {
    print('NotificationService: Bắt đầu lắng nghe Firestore...');
    
    _notificationSubscription = FirebaseFirestore.instance
        .collection('notifications')
        .orderBy('sentAt', descending: true)
        .limit(1)
        .snapshots()
        .listen((snapshot) {
      
      if (_isInitialLoad) {
        print('NotificationService: Đã bỏ qua tin cũ, đang đợi tin mới...');
        _isInitialLoad = false;
        return;
      }

      for (var change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.added) {
          final data = change.doc.data();
          if (data != null) {
            print('NotificationService: NHẬN TIN MỚI -> ${data['title']}');
            _showDynamicNotification(
              data['title'] ?? 'Thông báo',
              data['body'] ?? '',
            );
          }
        }
      }
    }, onError: (error) {
      print('NotificationService: LỖI FIRESTORE -> $error');
    });
  }

  void _showDynamicNotification(String title, String message) {
    final state = navigatorKey.currentState;
    if (state != null && state.overlay != null) {
      DynamicIslandNotification.show(
        state.context, // Vẫn truyền context nhưng sẽ dùng overlayState làm ưu tiên
        title: title,
        message: message,
        type: NotificationType.info,
        overlayState: state.overlay, // Truyền trực tiếp OverlayState
      );
    } else {
      print('NotificationService: LỖI -> Không tìm thấy OverlayState của Navigator');
    }
  }

  Future<void> updateStreakStatus(int streak) async {
    try {
      if (streak == 0) {
        await _fcm.subscribeToTopic('inactive_users');
      } else {
        await _fcm.unsubscribeFromTopic('inactive_users');
      }
    } catch (e) {
      print('NotificationService: Lỗi FCM Topic -> $e');
    }
  }
}

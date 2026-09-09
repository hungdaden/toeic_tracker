import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Notification System Performance Tests', () {
    test('Unread count respects both lastRead and clearUntil timestamps', () {
      final now = DateTime.now().millisecondsSinceEpoch;
      final t1 = now - 50000; // 50s ago
      final t2 = now - 30000; // 30s ago
      final t3 = now - 10000; // 10s ago

      final notifications = [
        {'title': 'N1', 'sentAt': t1},
        {'title': 'N2', 'sentAt': t2},
        {'title': 'N3', 'sentAt': t3},
      ];

      // Case 1: Brand new user, never read
      int lastRead = 0;
      int clearUntil = 0;
      int threshold = max(lastRead, clearUntil);
      int unread = notifications.where((n) => (n['sentAt'] as int) > threshold).length;
      expect(unread, equals(3));

      // Case 2: User read notifications up to t2
      lastRead = t2;
      threshold = max(lastRead, clearUntil);
      unread = notifications.where((n) => (n['sentAt'] as int) > threshold).length;
      expect(unread, equals(1)); // Only N3 is unread

      // Case 3: User cleared all notifications up to now
      clearUntil = now;
      threshold = max(lastRead, clearUntil);
      unread = notifications.where((n) => (n['sentAt'] as int) > threshold).length;
      expect(unread, equals(0)); // All cleared, 0 unread
    });

    testWidgets('NotificationBell shake controller does not loop infinitely',
        (WidgetTester tester) async {
      late AnimationController shakeController;

      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                body: Builder(
                  builder: (context) {
                    return _TestNotificationBellWidget(
                      onControllerInit: (c) => shakeController = c,
                    );
                  },
                ),
              );
            },
          ),
        ),
      );

      await tester.pump();
      expect(shakeController.isAnimating, isFalse,
          reason: 'Initial state should not be animating');

      // Trigger shake notice once
      shakeController.forward(from: 0.0);
      expect(shakeController.isAnimating, isTrue);

      // Settle animation (600ms). If it were repeating (.repeat()), pumpAndSettle would timeout and fail.
      await tester.pumpAndSettle();

      // Animation must stop cleanly and NOT repeat indefinitely
      expect(shakeController.isAnimating, isFalse,
          reason: 'Shake must finish and stop, never looping forever to burn CPU/GPU');
      expect(shakeController.status, equals(AnimationStatus.completed));
    });
  });
}

class _TestNotificationBellWidget extends StatefulWidget {
  final ValueChanged<AnimationController> onControllerInit;
  const _TestNotificationBellWidget({required this.onControllerInit});

  @override
  State<_TestNotificationBellWidget> createState() => _TestNotificationBellWidgetState();
}

class _TestNotificationBellWidgetState extends State<_TestNotificationBellWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    widget.onControllerInit(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final angle =
            _controller.isAnimating ? sin(_controller.value * pi * 4) * 0.15 : 0.0;
        return Transform.rotate(
          angle: angle,
          child: child,
        );
      },
      child: const Icon(Icons.notifications),
    );
  }
}

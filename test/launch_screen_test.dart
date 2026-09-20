import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:toeic_tracker/screens/launch_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Mun AI Launch Screen & UIKit Shimmer Tests', () {
    testWidgets('LaunchScreen renders Mun AI logo, title, and UI Kit shimmer loading',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LaunchScreen(
            duration: Duration(milliseconds: 2700),
          ),
        ),
      );

      // 1. Kiểm tra biểu tượng và thương hiệu Mun AI
      expect(find.byType(FaIcon), findsOneWidget);
      expect(find.text('Mun AI'), findsOneWidget);
      expect(find.text('PRO'), findsOneWidget);
      expect(find.text('Trợ lý học tập TOEIC thông minh'), findsOneWidget);

      // 2. Kiểm tra Shimmer Loading từ UI Kit (may_uikit)
      expect(find.byType(ShimmerLoadingV2), findsOneWidget);
      expect(find.byType(RoundedRectangleShimmerV2), findsWidgets);

      // 3. Kiểm tra thông điệp loading bước 1
      expect(find.text('Đang khởi tạo trợ lý Mun AI...'), findsOneWidget);

      // 4. Bơm thời gian (pump 900ms) để kiểm tra thông điệp bước 2
      await tester.pump(const Duration(milliseconds: 950));
      expect(find.text('Đồng bộ hóa dữ liệu học tập'), findsOneWidget);

      // 5. Bơm thời gian (pump tiếp 900ms) để kiểm tra thông điệp bước 3
      await tester.pump(const Duration(milliseconds: 950));
      expect(find.text('Sẵn sàng bứt phá mục tiêu điểm số!'), findsOneWidget);

      // Bơm qua hết thời lượng 2700ms
      await tester.pump(const Duration(milliseconds: 900));
    });

    testWidgets('LaunchScreen triggers onFinish callback after specified duration',
        (WidgetTester tester) async {
      bool finished = false;

      await tester.pumpWidget(
        MaterialApp(
          home: LaunchScreen(
            duration: const Duration(milliseconds: 1500),
            onFinish: () {
              finished = true;
            },
          ),
        ),
      );

      expect(finished, isFalse);

      // Bơm qua thời gian kết thúc 1500ms
      await tester.pump(const Duration(milliseconds: 1600));

      expect(finished, isTrue);
    });

    testWidgets('LaunchScreen finishes immediately when duration is Duration.zero',
        (WidgetTester tester) async {
      bool finished = false;

      await tester.pumpWidget(
        MaterialApp(
          home: LaunchScreen(
            duration: Duration.zero,
            onFinish: () {
              finished = true;
            },
          ),
        ),
      );

      await tester.pump();
      expect(finished, isTrue);

      // Bơm hoàn tất animation
      await tester.pump(const Duration(milliseconds: 1000));
    });
  });
}

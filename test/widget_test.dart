import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:may_uikit/may_uikit.dart';

void main() {
  testWidgets('FloatingBottomBarV2 Liquid Glass smoke test', (WidgetTester tester) async {
    int currentIndex = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: FloatingBottomBarV2(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
            },
            items: const [
              FloatingBottomBarItemV2(
                title: 'Home',
                activeIcon: Icon(Icons.home),
                inactiveIcon: Icon(Icons.home_outlined),
              ),
              FloatingBottomBarItemV2(
                title: 'Stats',
                activeIcon: Icon(Icons.bar_chart),
                inactiveIcon: Icon(Icons.bar_chart_outlined),
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(FloatingBottomBarV2), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Stats'), findsOneWidget);
  });

  testWidgets('FloatingBottomBarV2 renders crystal liquid glass without murky background curtain',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: FloatingBottomBarV2(
            currentIndex: 0,
            onTap: (_) {},
            showBackgroundCurtain: false,
            blurSigma: 18.0,
            borderColor: const Color(0x47FFFFFF),
            backgroundGradient: const LinearGradient(
              colors: [Color(0x33FFFFFF), Color(0x1438BDF8), Color(0x2E0F172A)],
            ),
            items: const [
              FloatingBottomBarItemV2(
                title: 'Trang chủ',
                activeIcon: Icon(Icons.home),
                inactiveIcon: Icon(Icons.home_outlined),
              ),
              FloatingBottomBarItemV2(
                title: 'Bài thi',
                activeIcon: Icon(Icons.assignment),
                inactiveIcon: Icon(Icons.assignment_outlined),
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(FloatingBottomBarV2), findsOneWidget);
    expect(find.text('Trang chủ'), findsOneWidget);
    expect(find.text('Bài thi'), findsOneWidget);

    // Verify BackdropFilter is applied for crystal glass refraction
    expect(find.byType(BackdropFilter), findsOneWidget);
  });
}

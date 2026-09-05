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
}

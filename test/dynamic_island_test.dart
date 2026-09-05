import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toeic_tracker/widgets/dynamic_island_notification.dart';

void main() {
  testWidgets('DynamicIslandNotification renders Liquid Glass over iPhone 12 notch',
      (WidgetTester tester) async {
    // Simulate iPhone 12 screen: 390 x 844, devicePixelRatio 3.0, top notch inset 47.0
    tester.view.physicalSize = const Size(390 * 3, 844 * 3);
    tester.view.devicePixelRatio = 3.0;
    tester.view.padding = FakeViewPadding(top: 47 * 3, bottom: 34 * 3);
    tester.view.viewPadding = FakeViewPadding(top: 47 * 3, bottom: 34 * 3);

    final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: navKey,
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    DynamicIslandNotification.show(
                      context,
                      title: 'Thành công',
                      message: 'Đã lưu điểm thi mới vào hệ thống',
                      type: NotificationType.success,
                    );
                  },
                  child: const Text('Show'),
                ),
              );
            },
          ),
        ),
      ),
    );

    // Tap to show Dynamic Island
    await tester.tap(find.text('Show'));
    await tester.pump(); // Start animation
    await tester.pump(const Duration(milliseconds: 700)); // Complete expand animation

    // Verify title and message are rendered
    expect(find.text('Thành công'), findsOneWidget);
    expect(find.text('Đã lưu điểm thi mới vào hệ thống'), findsOneWidget);

    // Verify BackdropFilter with glass blur is present
    expect(find.byType(BackdropFilter), findsOneWidget);

    // Verify Positioned widget is anchored at top 0.0 (covering notch)
    final positionedFinder = find.ancestor(
      of: find.byType(BackdropFilter),
      matching: find.byType(Positioned),
    );
    expect(positionedFinder, findsOneWidget);
    final Positioned positioned = tester.widget(positionedFinder);
    expect(positioned.top, equals(0.0));

    // Verify top corners are flat (Radius.zero) and bottom corners are rounded (30.0)
    final clipRRectFinder = find.ancestor(
      of: find.byType(BackdropFilter),
      matching: find.byType(ClipRRect),
    );
    expect(clipRRectFinder, findsOneWidget);
    final ClipRRect clipRRect = tester.widget(clipRRectFinder);
    final BorderRadius borderRadius = clipRRect.borderRadius as BorderRadius;
    expect(borderRadius.topLeft, equals(Radius.zero));
    expect(borderRadius.topRight, equals(Radius.zero));
    expect(borderRadius.bottomLeft, equals(const Radius.circular(30.0)));
    expect(borderRadius.bottomRight, equals(const Radius.circular(30.0)));

    // Verify Container width is expanded by ~30% (~320px)
    final containerFinder = find.ancestor(
      of: clipRRectFinder,
      matching: find.byType(Container),
    );
    expect(containerFinder, findsOneWidget);
    final Container container = tester.widget(containerFinder);
    expect(container.constraints?.minWidth ?? 0, greaterThanOrEqualTo(0));
    final RenderBox containerBox = tester.renderObject(containerFinder);
    expect(containerBox.size.width, greaterThan(310.0));

    // Verify content text is positioned safely below the notch (Y > 47.0)
    final RenderBox textRenderBox = tester.renderObject(find.text('Thành công'));
    final Offset textPosition = textRenderBox.localToGlobal(Offset.zero);
    expect(textPosition.dy, greaterThan(47.0),
        reason: 'Notification content must be placed safely below the physical notch');

    // Tap to dismiss
    await tester.tap(find.text('Thành công'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pumpAndSettle();

    // Verify notification was removed from overlay
    expect(find.text('Thành công'), findsNothing);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toeic_tracker/widgets/dynamic_island_notification.dart';

void main() {
  testWidgets('DynamicIslandNotification renders compact Liquid Glass over iPhone 12 notch',
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

    // Verify Positioned widget is anchored at top 0.0 (covering notch seamlessly)
    final positionedFinder = find.ancestor(
      of: find.byType(BackdropFilter),
      matching: find.byType(Positioned),
    );
    expect(positionedFinder, findsOneWidget);
    final Positioned positioned = tester.widget(positionedFinder);
    expect(positioned.top, equals(0.0));

    // Verify top corners are flat (Radius.zero) and bottom corners are rounded (16.0)
    final clipRRectFinder = find.ancestor(
      of: find.byType(BackdropFilter),
      matching: find.byType(ClipRRect),
    );
    expect(clipRRectFinder, findsOneWidget);
    final ClipRRect clipRRect = tester.widget(clipRRectFinder);
    final BorderRadius borderRadius = clipRRect.borderRadius as BorderRadius;
    expect(borderRadius.topLeft, equals(Radius.zero));
    expect(borderRadius.topRight, equals(Radius.zero));
    expect(borderRadius.bottomLeft, equals(const Radius.circular(16.0)));
    expect(borderRadius.bottomRight, equals(const Radius.circular(16.0)));

    // Verify Container width is expanded (~320px)
    final containerFinder = find.ancestor(
      of: clipRRectFinder,
      matching: find.byType(Container),
    );
    expect(containerFinder, findsOneWidget);
    final Container container = tester.widget(containerFinder);
    expect(container.constraints?.minWidth ?? 0, greaterThanOrEqualTo(0));
    final RenderBox containerBox = tester.renderObject(containerFinder);
    expect(containerBox.size.width, greaterThan(310.0));

    // Verify height is compact: 47.0 (notch) + 26.0 (pop-down) = 73.0px (reduced by 50% from 52px)
    expect(containerBox.size.height, equals(73.0));

    // Verify Title text is centered
    final Text titleWidget = tester.widget(find.text('Thành công'));
    expect(titleWidget.textAlign, equals(TextAlign.center));

    // Verify content text is positioned safely below the physical notch (~34.0px)
    final RenderBox textRenderBox = tester.renderObject(find.text('Thành công'));
    final Offset textPosition = textRenderBox.localToGlobal(Offset.zero);
    expect(textPosition.dy, greaterThan(36.0),
        reason: 'Notification content must be placed safely below the physical notch');

    // Verify vertical balance: content is elevated with breathing room from bottom border (clearance >= 3.0px)
    final RenderBox messageRenderBox = tester.renderObject(find.text('Đã lưu điểm thi mới vào hệ thống'));
    final Offset messagePosition = messageRenderBox.localToGlobal(Offset.zero);
    final double contentBottomY = messagePosition.dy + messageRenderBox.size.height;
    final double containerBottomY = containerBox.localToGlobal(Offset.zero).dy + containerBox.size.height;
    final double bottomClearance = containerBottomY - contentBottomY;
    expect(bottomClearance, greaterThanOrEqualTo(5.0),
        reason: 'Content must have adequate breathing room from bottom border');

    // Tap to dismiss
    await tester.tap(find.text('Thành công'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pumpAndSettle();

    // Verify notification was removed from overlay
    expect(find.text('Thành công'), findsNothing);
  });

  testWidgets('DynamicIslandNotification renders floating capsule pill for iPhone 14 Pro+ Dynamic Island',
      (WidgetTester tester) async {
    // Simulate iPhone 14 Pro screen: 393 x 852, devicePixelRatio 3.0, top Dynamic Island inset 59.0
    tester.view.physicalSize = const Size(393 * 3, 852 * 3);
    tester.view.devicePixelRatio = 3.0;
    tester.view.padding = FakeViewPadding(top: 59 * 3, bottom: 34 * 3);
    tester.view.viewPadding = FakeViewPadding(top: 59 * 3, bottom: 34 * 3);

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
                      message: 'Đã sao chép mã nhóm vào bộ nhớ tạm',
                      type: NotificationType.success,
                    );
                  },
                  child: const Text('Show 14 Pro'),
                ),
              );
            },
          ),
        ),
      ),
    );

    // Tap to show Dynamic Island
    await tester.tap(find.text('Show 14 Pro'));
    await tester.pump(); // Start animation
    await tester.pump(const Duration(milliseconds: 700)); // Complete expand animation

    // Verify title and message are rendered
    expect(find.text('Thành công'), findsOneWidget);
    expect(find.text('Đã sao chép mã nhóm vào bộ nhớ tạm'), findsOneWidget);

    // Verify Positioned widget is FLOATING at top: 11.0 (not anchored at 0.0)
    final positionedFinder = find.ancestor(
      of: find.byType(BackdropFilter),
      matching: find.byType(Positioned),
    );
    expect(positionedFinder, findsOneWidget);
    final Positioned positioned = tester.widget(positionedFinder);
    expect(positioned.top, equals(11.0)); // (59.0 - 37.0) / 2 = 11.0

    // Verify all 4 corners are rounded (Radius.circular(24.0)) - full capsule / stadium pill
    final clipRRectFinder = find.ancestor(
      of: find.byType(BackdropFilter),
      matching: find.byType(ClipRRect),
    );
    expect(clipRRectFinder, findsOneWidget);
    final ClipRRect clipRRect = tester.widget(clipRRectFinder);
    final BorderRadius borderRadius = clipRRect.borderRadius as BorderRadius;
    expect(borderRadius.topLeft, equals(const Radius.circular(24.0)));
    expect(borderRadius.topRight, equals(const Radius.circular(24.0)));
    expect(borderRadius.bottomLeft, equals(const Radius.circular(24.0)));
    expect(borderRadius.bottomRight, equals(const Radius.circular(24.0)));

    // Verify Container size: height is 72.0px (37px pill + 35px text area)
    final containerFinder = find.ancestor(
      of: clipRRectFinder,
      matching: find.byType(Container),
    );
    final RenderBox containerBox = tester.renderObject(containerFinder);
    expect(containerBox.size.height, equals(72.0));
    expect(containerBox.size.width, greaterThan(310.0));

    // Bottom edge is at 11 + 72 = 83px (much lower than old 111px)
    final double bottomEdgeY = (positioned.top ?? 0) + containerBox.size.height;
    expect(bottomEdgeY, lessThanOrEqualTo(85.0));

    // CRITICAL: Verify content text is positioned SAFELY BELOW the physical pill (Y >= 48.0)
    // Physical pill on iPhone 14 Pro sits from Y = 11.0 to Y = 48.0 (11 + 37 = 48.0).
    // Text must start at Y >= 48.0 so it is NEVER obscured by the hardware camera/sensor pill!
    final RenderBox textRenderBox = tester.renderObject(find.text('Thành công'));
    final Offset textPosition = textRenderBox.localToGlobal(Offset.zero);
    expect(textPosition.dy, greaterThanOrEqualTo(48.0),
        reason: 'Notification content on iPhone 14 Pro+ must be located below the physical pill cutout');

    // Tap to dismiss
    await tester.tap(find.text('Thành công'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pumpAndSettle();

    // Verify notification was removed from overlay
    expect(find.text('Thành công'), findsNothing);
  });
}

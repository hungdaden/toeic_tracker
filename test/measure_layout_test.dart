import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:toeic_tracker/theme/liquid_glass_theme.dart';

void main() {
  Future<void> runScenario(
    WidgetTester tester, {
    required String name,
    required TargetPlatform platform,
    required double bottomInset,
  }) async {
    tester.view.physicalSize = const Size(393 * 3, 852 * 3);
    tester.view.devicePixelRatio = 3.0;
    tester.view.padding = FakeViewPadding(bottom: bottomInset * 3, top: 24 * 3);
    tester.view.viewPadding = FakeViewPadding(bottom: bottomInset * 3, top: 24 * 3);

    debugDefaultTargetPlatformOverride = platform;

    final GlobalKey fabKey = GlobalKey();
    final GlobalKey barKey = GlobalKey();
    final GlobalKey buttonKey = GlobalKey();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          extendBody: true,
          body: Builder(
            builder: (context) {
              return CommonScaffoldV2(
                floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
                floatingActionButton: Builder(
                  builder: (fabContext) {
                    final pad = LiquidGlassTheme.getFloatingButtonBottomPadding(fabContext);
                    return Padding(
                      key: fabKey,
                      padding: EdgeInsets.only(
                        bottom: pad,
                      ),
                      child: SizedBox(
                        key: buttonKey,
                        width: 120,
                        height: 48,
                        child: const Text('FAB'),
                      ),
                    );
                  },
                ),
                body: const Center(child: Text('Content')),
              );
            },
          ),
          bottomNavigationBar: FloatingBottomBarV2(
            key: barKey,
            currentIndex: 0,
            onTap: (_) {},
            items: [
              FloatingBottomBarItemV2(
                title: 'Trang chủ',
                activeIcon: const Icon(Icons.home),
                inactiveIcon: const Icon(Icons.home_outlined),
              ),
              FloatingBottomBarItemV2(
                title: 'Thống kê',
                activeIcon: const Icon(Icons.bar_chart),
                inactiveIcon: const Icon(Icons.bar_chart_outlined),
              ),
              FloatingBottomBarItemV2(
                title: 'Mun AI',
                activeIcon: const Icon(Icons.pets),
                inactiveIcon: const Icon(Icons.pets_outlined),
              ),
              FloatingBottomBarItemV2(
                title: 'Bảng vàng',
                activeIcon: const Icon(Icons.military_tech),
                inactiveIcon: const Icon(Icons.military_tech_outlined),
              ),
              FloatingBottomBarItemV2(
                title: 'Hồ sơ',
                activeIcon: const Icon(Icons.person),
                inactiveIcon: const Icon(Icons.person_outlined),
              ),
            ],
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    final RenderBox buttonBox = buttonKey.currentContext!.findRenderObject() as RenderBox;
    final Offset buttonGlobalPos = buttonBox.localToGlobal(Offset.zero);
    final double buttonBottom = buttonGlobalPos.dy + buttonBox.size.height;

    final RenderBox barBox = barKey.currentContext!.findRenderObject() as RenderBox;
    final Offset barGlobalPos = barBox.localToGlobal(Offset.zero);
    final double barTop = barGlobalPos.dy;

    // Find DecoratedBox for the capsule pill (DecoratedBox[1])
    final decoratedBoxes = find.descendant(
      of: find.byKey(barKey),
      matching: find.byType(DecoratedBox),
    );
    final RenderBox capsuleBox = tester.renderObject(decoratedBoxes.at(1));
    final double capsuleTop = capsuleBox.localToGlobal(Offset.zero).dy;

    final double clearanceAboveBar = barTop - buttonBottom;
    final double clearanceAboveCapsule = capsuleTop - buttonBottom;

    print('[$name]');
    print('  Button bottom: $buttonBottom, Bar top: $barTop, Capsule top: $capsuleTop');
    print('  Clearance above bar: ${clearanceAboveBar}px, above capsule: ${clearanceAboveCapsule}px');

    // Assert the button is strictly ABOVE the floating bottom bar and its capsule
    expect(buttonBottom, lessThan(barTop), reason: 'Button bottom must be above the bar top in $name');
    expect(buttonBottom, lessThan(capsuleTop), reason: 'Button bottom must be above the capsule in $name');
    expect(clearanceAboveCapsule, greaterThanOrEqualTo(20.0), reason: 'Comfortable clearance in $name');
  }

  testWidgets('Measure FAB and BottomBar positions accurately across platforms', (tester) async {
    await runScenario(
      tester,
      name: 'Android 3-Button Nav (inset 48)',
      platform: TargetPlatform.android,
      bottomInset: 48.0,
    );

    await runScenario(
      tester,
      name: 'Android Gesture Nav (inset 24)',
      platform: TargetPlatform.android,
      bottomInset: 24.0,
    );

    await runScenario(
      tester,
      name: 'Android No Inset (inset 0)',
      platform: TargetPlatform.android,
      bottomInset: 0.0,
    );

    await runScenario(
      tester,
      name: 'iOS Home Indicator (inset 34)',
      platform: TargetPlatform.iOS,
      bottomInset: 34.0,
    );

    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('Score card has equal-sized cells in 2-skills and 4-skills modes', (tester) async {
    Widget buildScoreCard({required bool isFourSkills}) {
      final total = isFourSkills ? 1100 : 850;
      final listening = 450;
      final reading = 400;
      final speaking = 130;
      final writing = 120;

      return Container(
        width: 360,
        padding: const EdgeInsets.all(12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            const gap = 8.0;

            final totalChip = LiquidGlassChip(
              key: const Key('chip_total'),
              label: 'Tổng',
              value: '$total',
              accentColor: LiquidGlassTheme.scoreTotal,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            );

            final listeningChip = LiquidGlassChip(
              key: const Key('chip_listening'),
              label: 'Nghe',
              value: '$listening',
              accentColor: LiquidGlassTheme.scoreListening,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            );

            final readingChip = LiquidGlassChip(
              key: const Key('chip_reading'),
              label: 'Đọc',
              value: '$reading',
              accentColor: LiquidGlassTheme.scoreReading,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            );

            if (!isFourSkills) {
              return Row(
                children: [
                  Expanded(child: listeningChip),
                  const SizedBox(width: gap),
                  Expanded(child: readingChip),
                  const SizedBox(width: gap),
                  Expanded(child: totalChip),
                ],
              );
            }

            final speakingChip = LiquidGlassChip(
              key: const Key('chip_speaking'),
              label: 'Nói',
              value: '$speaking',
              accentColor: LiquidGlassTheme.scoreSpeaking,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            );

            final writingChip = LiquidGlassChip(
              key: const Key('chip_writing'),
              label: 'Viết',
              value: '$writing',
              accentColor: LiquidGlassTheme.scoreWriting,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            );

            final itemWidth = (constraints.maxWidth - gap) / 2;

            return Column(
              children: [
                Row(
                  children: [
                    Expanded(child: listeningChip),
                    const SizedBox(width: gap),
                    Expanded(child: readingChip),
                  ],
                ),
                const SizedBox(height: gap),
                Row(
                  children: [
                    Expanded(child: speakingChip),
                    const SizedBox(width: gap),
                    Expanded(child: writingChip),
                  ],
                ),
                const SizedBox(height: gap),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: itemWidth,
                      child: totalChip,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
    }

    // 1. Test 2-skills mode
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: buildScoreCard(isFourSkills: false),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final totalRect2 = tester.getRect(find.byKey(const Key('chip_total')));
    final listeningRect2 = tester.getRect(find.byKey(const Key('chip_listening')));
    final readingRect2 = tester.getRect(find.byKey(const Key('chip_reading')));

    // Equal widths & heights
    expect(totalRect2.width, equals(listeningRect2.width));
    expect(totalRect2.width, equals(readingRect2.width));
    expect(totalRect2.height, equals(listeningRect2.height));

    // Order: listening < reading < total
    expect(listeningRect2.left, lessThan(readingRect2.left));
    expect(readingRect2.left, lessThan(totalRect2.left));

    // 2. Test 4-skills mode
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: buildScoreCard(isFourSkills: true),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final totalRect4 = tester.getRect(find.byKey(const Key('chip_total')));
    final listeningRect4 = tester.getRect(find.byKey(const Key('chip_listening')));
    final readingRect4 = tester.getRect(find.byKey(const Key('chip_reading')));
    final speakingRect4 = tester.getRect(find.byKey(const Key('chip_speaking')));
    final writingRect4 = tester.getRect(find.byKey(const Key('chip_writing')));

    // All 5 items have the exact same width!
    expect(totalRect4.width, equals(listeningRect4.width));
    expect(totalRect4.width, equals(readingRect4.width));
    expect(totalRect4.width, equals(speakingRect4.width));
    expect(totalRect4.width, equals(writingRect4.width));

    // Vertical ordering: Row 1 (listening, reading) < Row 2 (speaking, writing) < Row 3 (total)
    expect(listeningRect4.top, equals(readingRect4.top));
    expect(speakingRect4.top, equals(writingRect4.top));
    expect(listeningRect4.bottom, lessThan(speakingRect4.top));
    expect(speakingRect4.bottom, lessThan(totalRect4.top));

    // Total chip is horizontally centered
    final totalCenter = (totalRect4.left + totalRect4.right) / 2;
    final row1Center = (listeningRect4.left + readingRect4.right) / 2;
    expect((totalCenter - row1Center).abs(), lessThan(1.0));
  });

  testWidgets('Dashboard score card displays 2 columns on 1 row in 2-skills mode, and 2 columns on 2 rows in 4-skills mode', (tester) async {
    Widget buildDashboardSkillsBadges({required bool isFourSkills}) {
      const listeningChip = LiquidGlassChip(
        key: Key('dash_listening'),
        icon: Icons.headphones_rounded,
        label: 'Nghe',
        value: '450',
        accentColor: LiquidGlassTheme.scoreListening,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      );

      const readingChip = LiquidGlassChip(
        key: Key('dash_reading'),
        icon: Icons.menu_book_rounded,
        label: 'Đọc',
        value: '400',
        accentColor: LiquidGlassTheme.scoreReading,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      );

      const speakingChip = LiquidGlassChip(
        key: Key('dash_speaking'),
        icon: Icons.mic_rounded,
        label: 'Nói',
        value: '130',
        accentColor: LiquidGlassTheme.scoreSpeaking,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      );

      const writingChip = LiquidGlassChip(
        key: Key('dash_writing'),
        icon: Icons.edit_note_rounded,
        label: 'Viết',
        value: '120',
        accentColor: LiquidGlassTheme.scoreWriting,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      );

      if (!isFourSkills) {
        return Container(
          width: 360,
          padding: const EdgeInsets.all(16),
          child: const Row(
            children: [
              Expanded(child: listeningChip),
              SizedBox(width: 10),
              Expanded(child: readingChip),
            ],
          ),
        );
      }

      return Container(
        width: 360,
        padding: const EdgeInsets.all(16),
        child: const Column(
          children: [
            Row(
              children: [
                Expanded(child: listeningChip),
                SizedBox(width: 10),
                Expanded(child: readingChip),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: speakingChip),
                SizedBox(width: 10),
                Expanded(child: writingChip),
              ],
            ),
          ],
        ),
      );
    }

    // 1. Test 2-skills mode: 2 columns on 1 row
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: buildDashboardSkillsBadges(isFourSkills: false),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final listeningRect2 = tester.getRect(find.byKey(const Key('dash_listening')));
    final readingRect2 = tester.getRect(find.byKey(const Key('dash_reading')));

    // 2 columns on 1 row: same top, same height, same width, listening < reading
    expect(listeningRect2.top, equals(readingRect2.top));
    expect(listeningRect2.height, equals(readingRect2.height));
    expect(listeningRect2.width, equals(readingRect2.width));
    expect(listeningRect2.right, lessThan(readingRect2.left));

    // 2. Test 4-skills mode: 2 columns on 2 rows
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: buildDashboardSkillsBadges(isFourSkills: true),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final listeningRect4 = tester.getRect(find.byKey(const Key('dash_listening')));
    final readingRect4 = tester.getRect(find.byKey(const Key('dash_reading')));
    final speakingRect4 = tester.getRect(find.byKey(const Key('dash_speaking')));
    final writingRect4 = tester.getRect(find.byKey(const Key('dash_writing')));

    // Row 1: listening and reading
    expect(listeningRect4.top, equals(readingRect4.top));
    expect(listeningRect4.width, equals(readingRect4.width));
    expect(listeningRect4.right, lessThan(readingRect4.left));

    // Row 2: speaking and writing
    expect(speakingRect4.top, equals(writingRect4.top));
    expect(speakingRect4.width, equals(writingRect4.width));
    expect(speakingRect4.right, lessThan(writingRect4.left));

    // Vertical spacing: Row 1 above Row 2
    expect(listeningRect4.bottom, lessThan(speakingRect4.top));

    // Column alignment: Col 1 (listening, speaking) aligned, Col 2 (reading, writing) aligned
    expect(listeningRect4.left, equals(speakingRect4.left));
    expect(readingRect4.left, equals(writingRect4.left));
    expect(listeningRect4.width, equals(speakingRect4.width));
    expect(readingRect4.width, equals(writingRect4.width));
  });
}

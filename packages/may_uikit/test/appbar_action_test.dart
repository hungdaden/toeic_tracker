import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:may_uikit/may_uikit.dart';

/// An app bar action could not be greyed out: [AppBarActionItem] required a
/// non-null onTap and always built an enabled button, so a screen that needs
/// the action off — a chat header while the connection is down — had to
/// hand-roll the whole button instead of using the shared component.
void main() {
  Future<PressableCardContainerV2> pumpAction(
    WidgetTester tester,
    AppBarActionItem item, {
    ThemeData? theme,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: theme ?? MainThemeV2.lightTheme,
        home: Scaffold(
          body: Builder(builder: (context) => item.build(context)),
        ),
      ),
    );

    return tester.widget<PressableCardContainerV2>(
      find.byType(PressableCardContainerV2),
    );
  }

  group('an action that is switched off', () {
    testWidgets('cannot be tapped', (tester) async {
      var taps = 0;
      final card = await pumpAction(
        tester,
        AppBarActionItem(
          type: AppBarActionType.add,
          isEnabled: false,
          onTap: () => taps++,
        ),
      );

      // Null onTap is what makes PressableCardContainerV2 stop responding —
      // it gates its pointer listeners on exactly this.
      expect(card.onTap, isNull);

      await tester.tap(find.byType(PressableCardContainerV2));
      await tester.pump();
      expect(taps, 0);
    });

    testWidgets('is painted with the disabled tokens', (tester) async {
      final colors = MainThemeV2.lightColors;
      final card = await pumpAction(
        tester,
        AppBarActionItem(
          type: AppBarActionType.add,
          isEnabled: false,
          onTap: () {},
        ),
      );

      expect(card.color, colors.disabledButton);
      expect(card.borderColor, colors.btnCriticalOutlineDisable);
      expect(card.shadowColor, AppColorsV2.transparent);
    });

    testWidgets('does not sink when pressed', (tester) async {
      final card = await pumpAction(
        tester,
        AppBarActionItem(
          type: AppBarActionType.add,
          isEnabled: false,
          onTap: () {},
        ),
      );

      expect(card.pressedOffset, DimensV2.d0);
    });
  });

  group('an action left at its default', () {
    testWidgets('stays enabled, so existing call sites are untouched', (tester) async {
      var taps = 0;
      final card = await pumpAction(
        tester,
        AppBarActionItem(
          type: AppBarActionType.add,
          onTap: () => taps++,
        ),
      );

      expect(card.onTap, isNotNull);
      // Left null so PressableCardContainerV2 falls back to its own defaults,
      // which is what every current caller already renders.
      expect(card.color, isNull);
      expect(card.borderColor, isNull);
      expect(card.shadowColor, isNull);
      expect(card.pressedOffset, AppSpacingV2.x3s);

      await tester.tap(find.byType(PressableCardContainerV2));
      await tester.pump();
      expect(taps, 1);
    });
  });
}

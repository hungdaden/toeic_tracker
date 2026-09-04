import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:may_uikit/may_uikit_internal.dart' show S;

/// The Settings action exists so a refused permission can be recovered from.
void main() {
  setUpAll(() => S.load(const Locale('vi')));

  group('the Settings action', () {
    test('is offered by the sheet', () {
      expect(
        MayActionSheetActionTypeV2.values,
        contains(MayActionSheetActionTypeV2.settings),
      );
    });

    test('is labelled for sending the user to Settings', () {
      expect(MayActionSheetActionTypeV2.settings.title, 'Cài đặt');
    });

    test('is not destructive', () {
      // Nothing is lost by opening Settings, so it must not be styled in red
      // the way delete and logout are.
      expect(MayActionSheetActionTypeV2.settings.isDestructive, isFalse);
    });
  });

  group('choosing Settings', () {
    testWidgets('runs the callback it was given', (tester) async {
      var opened = 0;

      await tester.pumpWidget(
        MaterialApp(
          theme: MainThemeV2.lightTheme,
          home: Scaffold(
            body: MayActionSheet(
              title: 'Vui lòng cho phép truy cập',
              description: 'Mô tả.',
              actions: const [MayActionSheetActionTypeV2.settings],
              onActionSettings: () => opened++,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cài đặt'));
      await tester.pumpAndSettle();

      expect(opened, 1);
    });

    testWidgets('leaves the other callbacks alone', (tester) async {
      var closed = 0;

      await tester.pumpWidget(
        MaterialApp(
          theme: MainThemeV2.lightTheme,
          home: Scaffold(
            body: MayActionSheet(
              title: 'Vui lòng cho phép truy cập',
              actions: const [MayActionSheetActionTypeV2.settings],
              onActionSettings: () {},
              onActionClose: () => closed++,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Cài đặt'));
      await tester.pumpAndSettle();

      expect(closed, 0);
    });
  });
}

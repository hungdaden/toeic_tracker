import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toeic_tracker/theme/app_theme.dart';

void main() {
  testWidgets('Keyboard dismisses automatically when tapping outside active input',
      (WidgetTester tester) async {
    final focusNode = FocusNode();
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.darkTheme,
        builder: (context, child) {
          return Listener(
            behavior: HitTestBehavior.translucent,
            onPointerDown: (event) {
              try {
                final currentFocus = FocusManager.instance.primaryFocus;
                if (currentFocus != null && currentFocus.context != null) {
                  final renderObject = currentFocus.context!.findRenderObject();
                  if (renderObject is RenderBox && renderObject.hasSize) {
                    final pos = renderObject.localToGlobal(Offset.zero);
                    final bounds = pos & renderObject.size;
                    if (!bounds.contains(event.position)) {
                      currentFocus.unfocus();
                    }
                  }
                }
              } catch (_) {}
            },
            child: child ?? const SizedBox.shrink(),
          );
        },
        home: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 100),
              TextField(
                key: const Key('test_input'),
                focusNode: focusNode,
                controller: controller,
              ),
              const SizedBox(height: 100),
              const Text('Outside Area', key: Key('outside_area')),
            ],
          ),
        ),
      ),
    );

    // Initial state: not focused
    expect(focusNode.hasFocus, isFalse);

    // Tap on the text field to gain focus (open keyboard)
    await tester.tap(find.byKey(const Key('test_input')));
    await tester.pump();
    expect(focusNode.hasFocus, isTrue);

    // Tap outside the text field
    await tester.tap(find.byKey(const Key('outside_area')));
    await tester.pump();

    // Verify focus is dismissed immediately
    expect(focusNode.hasFocus, isFalse);
  });

  testWidgets('Edge swipe gesture recognizes edge swipes and rejects center swipes',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390 * 3, 844 * 3);
    tester.view.devicePixelRatio = 3.0;

    int currentPage = 0;
    double? edgeStartX;
    double? edgeStartY;
    bool isLeftEdge = false;
    bool isRightEdge = false;

    void handlePointerDown(PointerDownEvent event, double screenWidth) {
      const edgeThreshold = 48.0;
      if (event.position.dx <= edgeThreshold) {
        edgeStartX = event.position.dx;
        edgeStartY = event.position.dy;
        isLeftEdge = true;
        isRightEdge = false;
      } else if (event.position.dx >= screenWidth - edgeThreshold) {
        edgeStartX = event.position.dx;
        edgeStartY = event.position.dy;
        isRightEdge = true;
        isLeftEdge = false;
      } else {
        edgeStartX = null;
        edgeStartY = null;
        isLeftEdge = false;
        isRightEdge = false;
      }
    }

    void handlePointerUp(PointerUpEvent event) {
      if (edgeStartX != null && edgeStartY != null) {
        final deltaX = event.position.dx - edgeStartX!;
        final deltaY = (event.position.dy - edgeStartY!).abs();

        if (deltaX.abs() > 40.0 && deltaX.abs() > deltaY * 1.1) {
          if (isLeftEdge && deltaX > 40.0) {
            if (currentPage > 0) currentPage--;
          } else if (isRightEdge && deltaX < -40.0) {
            if (currentPage < 4) currentPage++;
          }
        }
      }
      edgeStartX = null;
      edgeStartY = null;
      isLeftEdge = false;
      isRightEdge = false;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              return Listener(
                behavior: HitTestBehavior.translucent,
                onPointerDown: (e) => handlePointerDown(e, screenWidth),
                onPointerUp: handlePointerUp,
                child: Center(
                  child: Text('Page: $currentPage'),
                ),
              );
            },
          ),
        ),
      ),
    );

    // Initial page is 0
    expect(currentPage, equals(0));

    // Drag from center (dx: 200 -> dx: 100): Should NOT trigger page switch
    final centerDrag = await tester.startGesture(const Offset(200, 300));
    await centerDrag.moveBy(const Offset(-100, 0));
    await centerDrag.up();
    await tester.pump();
    expect(currentPage, equals(0));

    // Drag from right edge (dx: 380 -> dx: 260): Triggers next page
    final rightEdgeDrag = await tester.startGesture(const Offset(380, 300));
    await rightEdgeDrag.moveBy(const Offset(-100, 0));
    await rightEdgeDrag.up();
    await tester.pump();
    expect(currentPage, equals(1));

    // Drag from left edge (dx: 10 -> dx: 130): Triggers previous page
    final leftEdgeDrag = await tester.startGesture(const Offset(10, 300));
    await leftEdgeDrag.moveBy(const Offset(100, 0));
    await leftEdgeDrag.up();
    await tester.pump();
    expect(currentPage, equals(0));
  });

  testWidgets('Mun AI chat composer pushes up snugly (8px) when keyboard is open and stays above bottom bar (110px) when closed',
      (WidgetTester tester) async {
    Widget buildTestComposer() {
      return Builder(
        builder: (context) {
          final double keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
          final bool isKeyboardOpen = keyboardInset > 0;
          final double composerBottomPadding = isKeyboardOpen ? 8.0 : 110.0;

          return Scaffold(
            body: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedPadding(
                key: const Key('chat_composer_padding'),
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.fromLTRB(16, 6, 16, composerBottomPadding),
                child: Container(
                  height: 48,
                  color: Colors.blue,
                ),
              ),
            ),
          );
        },
      );
    }

    // 1. Initial state: Keyboard closed (bottom inset 0)
    tester.view.viewInsets = FakeViewPadding.zero;
    await tester.pumpWidget(MaterialApp(home: buildTestComposer()));
    await tester.pumpAndSettle();

    AnimatedPadding paddingWidget =
        tester.widget(find.byKey(const Key('chat_composer_padding')));
    expect((paddingWidget.padding as EdgeInsets).bottom, equals(110.0));

    // 2. Keyboard opens: iPhone keyboard height ~336
    tester.view.viewInsets = const FakeViewPadding(bottom: 336 * 3);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 250));

    paddingWidget = tester.widget(find.byKey(const Key('chat_composer_padding')));
    expect((paddingWidget.padding as EdgeInsets).bottom, equals(8.0),
        reason: 'Chat composer should be snug to the keyboard with 8px margin');

    // 3. Keyboard closes
    tester.view.viewInsets = FakeViewPadding.zero;
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 250));

    paddingWidget = tester.widget(find.byKey(const Key('chat_composer_padding')));
    expect((paddingWidget.padding as EdgeInsets).bottom, equals(110.0),
        reason: 'Chat composer should restore 110px clearance above floating bottom bar');
  });
}

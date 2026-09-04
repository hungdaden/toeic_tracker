import 'package:flutter/material.dart';

import '../../may_uikit.dart';

/// Shared scaffold wrapper used across UIKit screens.
class CommonScaffoldV2 extends StatelessWidget {
  const CommonScaffoldV2({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.drawer,
    this.background,
    this.backgroundColor,
    this.hideKeyboardWhenTouchOutside = true,
    this.resizeToAvoidBottomInset = true,
    this.scaffoldKey,
    this.bottomNavigationBar,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButtonLocation,
    super.key,
    this.bottomOfAppBar,
    this.allowAutoBottomPaddingKeyboard = false,
    this.keyboardVisibilityBuilder,
    this.extendBody = false,
  });

  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Widget? background;
  final Color? backgroundColor;
  final bool hideKeyboardWhenTouchOutside;
  final bool resizeToAvoidBottomInset;
  final Widget? bottomNavigationBar;
  final bool extendBodyBehindAppBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomOfAppBar;
  final bool allowAutoBottomPaddingKeyboard;
  final Widget Function(BuildContext, bool isKeyboardVisible)? keyboardVisibilityBuilder;
  final bool extendBody;

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = background == null
        ? backgroundColor ?? AppColorsV2.appBarBackground
        : AppColorsV2.transparent;

    Widget scaffold = Scaffold(
      key: scaffoldKey,
      backgroundColor: effectiveBackgroundColor,
      body: bottomOfAppBar != null
          ? Column(
              children: [
                bottomOfAppBar!,
                Expanded(
                  child: body,
                ),
              ],
            )
          : body,
      appBar: appBar,
      drawer: drawer,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: floatingActionButton,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      extendBody: extendBody,
      bottomNavigationBar:
          (bottomNavigationBar != null || AppDimenV2.of(context).keyboardHeight > 0)
              ? Padding(
                  padding: EdgeInsets.only(bottom: AppDimenV2.of(context).keyboardHeight),
                  child: bottomNavigationBar)
              : null,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );

    if (background != null) {
      scaffold = Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(child: background!),
          scaffold,
        ],
      );
    }

    if (hideKeyboardWhenTouchOutside) {
      scaffold = GestureDetector(
        onTap: () {
          final currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        behavior: HitTestBehavior.translucent,
        child: scaffold,
      );
    }

    if (allowAutoBottomPaddingKeyboard || keyboardVisibilityBuilder != null) {
      final child = scaffold;
      scaffold = KeyboardVisibilityBuilderV2(
        builder: (context, _, visible) {
          if (keyboardVisibilityBuilder != null) {
            return keyboardVisibilityBuilder!(context, visible);
          }
          return child;
        },
      );
    }

    return scaffold;
  }
}

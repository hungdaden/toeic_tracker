import 'package:flutter/material.dart';

/// Rebuilds its child when the keyboard visibility changes.
class KeyboardVisibilityBuilderV2 extends StatefulWidget {
  const KeyboardVisibilityBuilderV2({
    required this.builder,
    this.child,
    super.key,
  });

  final Widget? child;
  final Widget Function(BuildContext context, Widget? child, bool isKeyboardVisible) builder;

  @override
  /// Creates the keyboard visibility listener state.
  State<KeyboardVisibilityBuilderV2> createState() => _KeyboardVisibilityBuilderState();
}

class _KeyboardVisibilityBuilderState extends State<KeyboardVisibilityBuilderV2>
    with WidgetsBindingObserver {
  final _isKeyboardVisible = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _isKeyboardVisible.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.platformDispatcher.views.first.viewInsets.bottom;
    _isKeyboardVisible.value = bottomInset > 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isKeyboardVisible,
      builder: (_, isKeyboardVisible, child) => widget.builder(_, child, isKeyboardVisible),
      child: widget.child,
    );
  }
}

import 'package:flutter/material.dart';

import '../may_uikit.dart';

class HoverPressWidgetV2 extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const HoverPressWidgetV2({
    required this.child,
    required this.onTap,
    super.key,
  });

  @override
  State<HoverPressWidgetV2> createState() => _HoverPressWidgetState();
}

class _HoverPressWidgetState extends State<HoverPressWidgetV2> {
  static const double _dragThreshold = DimensV2.d8;

  bool _pressed = false;
  bool _isDragging = false;

  Offset? _downPosition;

  void _setPressed(bool value) {
    if (_pressed != value) {
      setState(() => _pressed = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) {
        _downPosition = event.position;
        _isDragging = false;
        _setPressed(true);
      },
      onPointerMove: (event) {
        if (_downPosition == null || _isDragging) return;
        final distance = (event.position - _downPosition!).distance;
        if (distance > _dragThreshold) {
          _isDragging = true;
        }
      },
      onPointerUp: (_) {
        final shouldTap = !_isDragging;
        _downPosition = null;
        _isDragging = false;
        _setPressed(false);
        if (shouldTap) {
          widget.onTap();
        }
      },
      onPointerCancel: (_) {
        _downPosition = null;
        _isDragging = false;
        _setPressed(false);
      },
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DimensV2.d20),
            boxShadow: _pressed
                ? [
                    BoxShadow(
                      color: AppColorsV2.genericBlack.withValues(alpha: 0.05),
                      blurRadius: DimensV2.d24,
                      offset: const Offset(0, 12),
                    ),
                  ]
                : [],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../may_uikit.dart';

/// Card container that moves down and hides shadow while pressed.
class PressableCardContainerV2 extends StatefulWidget {
  /// Creates a pressable card with [child] content and optional visual styling.
  const PressableCardContainerV2({
    super.key,
    required this.child,
    this.color,
    this.gradient,
    this.borderColor,
    this.borderWidth = DimensV2.d_05,
    this.shadowColor,
    this.padding,
    this.margin,
    this.borderRadius = DimensV2.d20,
    this.pressedOffset = 4.0,
    this.enableHaptic = true,
    this.onTap,
    this.height,
    this.width,
  });

  final Widget child;
  final Color? color;
  final Gradient? gradient;
  final Color? borderColor;
  final double borderWidth;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final double pressedOffset;
  final bool enableHaptic;
  final GestureTapCallback? onTap;
  final double? height;
  final double? width;

  /// Creates state that tracks pointer press feedback for this card.
  @override
  State<PressableCardContainerV2> createState() => _PressableCardContainerState();
}

class _PressableCardContainerState extends State<PressableCardContainerV2> {
  static const _duration = Duration(milliseconds: 80);

  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed == value) return;
    setState(() => _pressed = value);
  }

  void _handleTap() {
    if (widget.enableHaptic) {
      HapticUtil.lightImpact();
    }
    widget.onTap?.call();
  }

  /// Builds animated card container and press gesture area.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final radius = BorderRadius.circular(widget.borderRadius);
    final borderColor = widget.borderColor ?? colors.bdDefault;
    final shadowColor = widget.shadowColor ?? colors.sdDefault;
    final enabled = widget.onTap != null;

    return NotificationListener<CardTapNotification>(
      onNotification: (notification) {
        if (enabled) {
          _handleTap();
        }
        return true;
      },
      child: Listener(
        onPointerDown: enabled ? (_) => _setPressed(true) : null,
        onPointerUp: enabled ? (_) => _setPressed(false) : null,
        onPointerCancel: enabled ? (_) => _setPressed(false) : null,
        child: AnimatedContainer(
          duration: _duration,
          curve: Curves.easeOutCubic,
          margin: widget.margin,
          height: widget.height,
          width: widget.width,
          transform: Matrix4.translationValues(0, _pressed ? widget.pressedOffset : 0, 0),
          decoration: BoxDecoration(
            gradient: widget.gradient,
            color: widget.gradient != null ? null : (widget.color ?? colors.bgCard),
            borderRadius: radius,
            boxShadow: _pressed
                ? const []
                : [
                    BoxShadow(
                      color: shadowColor,
                      offset: Offset(0, widget.pressedOffset),
                      blurRadius: 0,
                    ),
                  ],
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(color: borderColor, width: widget.borderWidth),
          ),
          clipBehavior: Clip.none,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: enabled ? _handleTap : null,
            child: ClipRRect(
              borderRadius: radius,
              child: Padding(
                padding: widget.padding ?? EdgeInsets.zero,
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../may_uikit.dart';

class GestureContainerV2 extends StatefulWidget {
  const GestureContainerV2({
    super.key,
    this.alignment,
    this.padding,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.inkWell = true,
    this.splashColor,
    this.highlightColor,
    this.splashFactory,
    this.enableAnimation = false,
    this.enableHaptic = true,
    this.behavior,
    this.onVerticalDragDown,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onVerticalDragCancel,
  });

  final Widget? child;
  final bool inkWell;
  final bool enableAnimation;
  final bool enableHaptic;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;

  final Alignment? alignment;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final Alignment? transformAlignment;
  final Clip? clipBehavior;
  final Color? splashColor;
  final Color? highlightColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final HitTestBehavior? behavior;
  final GestureDragDownCallback? onVerticalDragDown;
  final GestureDragStartCallback? onVerticalDragStart;
  final GestureDragUpdateCallback? onVerticalDragUpdate;
  final GestureDragEndCallback? onVerticalDragEnd;
  final GestureDragCancelCallback? onVerticalDragCancel;

  @override
  State<GestureContainerV2> createState() => _GestureContainerState();
}

class _GestureContainerState extends State<GestureContainerV2> {
  bool _pressed = false;
  int _pressToken = 0;

  void _setPressed(bool value) {
    if (_pressed != value) {
      setState(() => _pressed = value);
    }
  }

  void _handlePointerDown(PointerDownEvent event) {
    _pressToken++;
    _setPressed(true);
  }

  void _handlePointerRelease() {
    final currentToken = _pressToken;
    Future.delayed(const Duration(milliseconds: 50), () {
      if (!mounted || currentToken != _pressToken) return;
      _setPressed(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final effectiveHighlightColor = widget.highlightColor ??
        (widget.enableAnimation
            ? AppColorsV2.transparent
            : context.mayColors.txContentPrimaryDefault.withValues(alpha: 0.05));

    material([Widget? child]) => Material(
          color: AppColorsV2.transparent,
          borderRadius: widget.decoration?.borderRadius,
          child: Listener(
            behavior: HitTestBehavior.translucent,
            onPointerDown: _handlePointerDown,
            onPointerUp: (_) => _handlePointerRelease(),
            onPointerCancel: (_) => _handlePointerRelease(),
            child: InkWell(
              onTap: widget.onTap != null
                  ? () {
                      if (widget.enableHaptic) {
                        HapticUtil.lightImpact();
                      }
                      widget.onTap?.call();
                    }
                  : null,
              splashFactory: widget.splashFactory ?? NoSplash.splashFactory,
              highlightColor: AppColorsV2.transparent,
              overlayColor: WidgetStateProperty.all(AppColorsV2.transparent),
              onDoubleTap: widget.onDoubleTap,
              onLongPress: widget.onLongPress,
              borderRadius: widget.decoration?.borderRadius as BorderRadius?,
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  child ?? const SizedBox.shrink(),
                  Positioned.fill(
                    child: IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: _pressed ? effectiveHighlightColor : AppColorsV2.transparent,
                          borderRadius: widget.decoration?.borderRadius,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
    geomeotryContainer([Widget? child]) => Container(
          alignment: widget.alignment,
          padding: widget.padding,
          foregroundDecoration: widget.foregroundDecoration,
          width: widget.width,
          height: widget.height,
          constraints: widget.constraints,
          transform: widget.transform,
          transformAlignment: widget.transformAlignment,
          clipBehavior: widget.clipBehavior ?? Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColorsV2.transparent,
            borderRadius: widget.decoration?.borderRadius,
          ),
          child: Ink(
            color: AppColorsV2.transparent,
            child: child,
          ),
        );

    final content = geomeotryContainer(widget.child);

    Widget result;

    if (widget.inkWell) {
      result = Container(
        decoration: widget.decoration,
        margin: widget.margin,
        child: material(content),
      );
    } else {
      result = Container(
        decoration: widget.decoration,
        margin: widget.margin,
        child: GestureDetector(
          onTap: widget.onTap != null
              ? () {
                  if (widget.enableHaptic) {
                    HapticUtil.lightImpact();
                  }
                  widget.onTap?.call();
                }
              : null,
          onDoubleTap: widget.onDoubleTap,
          onLongPress: widget.onLongPress,
          behavior: widget.behavior ?? HitTestBehavior.translucent,
          onVerticalDragDown: widget.onVerticalDragDown,
          onVerticalDragStart: widget.onVerticalDragStart,
          onVerticalDragUpdate: widget.onVerticalDragUpdate,
          onVerticalDragEnd: widget.onVerticalDragEnd,
          onVerticalDragCancel: widget.onVerticalDragCancel,
          child: content,
        ),
      );
    }

    if (widget.enableAnimation) {
      return HoverPressWidgetV2(
        onTap: () {},
        child: result,
      );
    }

    return result;
  }
}

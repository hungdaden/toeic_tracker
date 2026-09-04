import 'package:flutter/material.dart';

import '../../may_uikit.dart';

/// Pressable stacked card list that simulates physical switch-like pressing.
class ActionListV2 extends StatefulWidget {
  static const double _defaultPressedOffset = AppSpacingV2.x2s;
  static const double _pressedFadeExtraHeight = AppSpacingV2.x2s;
  static const double _shadowFadeOpacity = 0.16;

  /// Creates a pressable stack list from [children].
  const ActionListV2({
    super.key,
    required this.children,
    this.onTap,
    this.color,
    this.borderColor,
    this.shadowColor,
    this.padding = const EdgeInsets.all(AppSpacingV2.cardLg),
    this.margin,
    this.borderRadius = AppRadiusV2.xl,
    this.pressedOffset = _defaultPressedOffset,
    this.ignorePaddingForFirstChild = false,
    this.ignorePressForFirstChild = false,
    this.outerPadding,
  });

  final List<Widget> children;
  final ValueChanged<int>? onTap;

  final Color? color;
  final Color? borderColor;
  final Color? shadowColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? outerPadding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final double pressedOffset;
  final bool ignorePaddingForFirstChild;
  final bool ignorePressForFirstChild;

  /// Creates state for [ActionListV2].
  @override
  State<ActionListV2> createState() => _ActionListV2State();
}

class _ActionListV2State extends State<ActionListV2> {
  static const _duration = Duration(milliseconds: 80);

  int? _pressedIndex;

  void _setPressedIndex(int? index) {
    if (_pressedIndex == index) return;
    setState(() => _pressedIndex = index);
  }

  void _handleTap(int index) {
    HapticUtil.lightImpact();
    widget.onTap?.call(index);
  }

  BorderRadius _itemRadius({
    required int index,
    required int lastIndex,
  }) {
    final radius = Radius.circular(widget.borderRadius);

    return BorderRadius.only(
      topLeft: index == 0 ? radius : Radius.zero,
      topRight: index == 0 ? radius : Radius.zero,
      bottomLeft: index == lastIndex ? radius : Radius.zero,
      bottomRight: index == lastIndex ? radius : Radius.zero,
    );
  }

  /// Builds interactive stacked cards with press animation.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final cardColor = widget.color ?? colors.bgCard;
    final shadowColor = widget.shadowColor ?? colors.sdDefault;
    final enabled = widget.onTap != null;
    final lastIndex = widget.children.length - 1;
    final textDirection = Directionality.of(context);

    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.children.length, (index) {
          final isPressed = _pressedIndex == index;
          final isFirst = index == 0;
          final isLast = index == lastIndex;
          final isEdgeItem = isFirst || isLast;
          final isBelowPressed = _pressedIndex != null && index == _pressedIndex! + 1;

          final radius = _itemRadius(
            index: index,
            lastIndex: lastIndex,
          );

          final basePadding = widget.padding.resolve(textDirection);
          final resolvedOuterPadding =
              (widget.outerPadding ?? widget.padding).resolve(textDirection);

          final bool ignoreFirst = isFirst && widget.ignorePaddingForFirstChild;

          final double left = ignoreFirst ? 0.0 : resolvedOuterPadding.left;
          final double right = ignoreFirst ? 0.0 : resolvedOuterPadding.right;
          final double top =
              ignoreFirst ? 0.0 : (isFirst ? resolvedOuterPadding.top : basePadding.top);
          final double bottom =
              ignoreFirst ? 0.0 : (isLast ? resolvedOuterPadding.bottom : basePadding.bottom);

          final resolvedPadding = EdgeInsets.only(
            left: left,
            right: right,
            top: top,
            bottom: bottom,
          );

          final animatedPadding = resolvedPadding.copyWith(
            bottom: isPressed && !isLast
                ? (resolvedPadding.bottom - widget.pressedOffset).clamp(
                    0.0,
                    double.infinity,
                  )
                : resolvedPadding.bottom,
          );

          final showUpperPhysicalShadow =
              _pressedIndex != null && index == _pressedIndex! - 1 && index != lastIndex;

          final showBottomPhysicalShadow = isLast && !isPressed;
          final showPressedBottomFade = isPressed && !isLast;

          final content = Stack(
            children: [
              AnimatedPadding(
                duration: _duration,
                curve: Curves.easeOutCubic,
                padding: animatedPadding,
                child: widget.children[index],
              ),
              if (showPressedBottomFade)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: widget.pressedOffset + ActionListV2._pressedFadeExtraHeight,
                  child: IgnorePointer(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            shadowColor.withValues(
                              alpha: ActionListV2._shadowFadeOpacity,
                            ),
                            shadowColor.withValues(alpha: 0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );

          final isInteractive = enabled && !(isFirst && widget.ignorePressForFirstChild);

          return Listener(
            onPointerDown: isInteractive ? (_) => _setPressedIndex(index) : null,
            onPointerUp: isInteractive ? (_) => _setPressedIndex(null) : null,
            onPointerCancel: isInteractive ? (_) => _setPressedIndex(null) : null,
            child: AnimatedContainer(
              duration: _duration,
              curve: Curves.easeOutCubic,
              margin: EdgeInsets.only(
                top: isBelowPressed ? widget.pressedOffset : 0,
                bottom: isLast ? widget.pressedOffset : 0,
              ),
              transform: Matrix4.translationValues(
                0,
                isPressed ? widget.pressedOffset : 0,
                0,
              ),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: isEdgeItem ? radius : null,
                boxShadow: [
                  if (showUpperPhysicalShadow)
                    BoxShadow(
                      color: shadowColor.withValues(alpha: shadowColor.a * 0.5),
                      offset: Offset(0, widget.pressedOffset),
                      blurRadius: 0.5,
                    ),
                  if (showBottomPhysicalShadow)
                    BoxShadow(
                      color: shadowColor,
                      offset: Offset(0, widget.pressedOffset),
                      blurRadius: 0.5,
                    ),
                ],
              ),
              clipBehavior: Clip.none,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: isInteractive ? () => _handleTap(index) : null,
                child: isEdgeItem
                    ? ClipRRect(
                        borderRadius: radius,
                        clipBehavior: Clip.hardEdge,
                        child: content,
                      )
                    : content,
              ),
            ),
          );
        }),
      ),
    );
  }
}

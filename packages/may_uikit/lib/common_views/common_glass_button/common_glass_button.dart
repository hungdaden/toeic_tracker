import 'package:flutter/material.dart';

import '../../may_uikit.dart';

/// Pressable glassmorphism button used across the UIKit.
class GlassButtonV2 extends StatelessWidget {
  const GlassButtonV2({
    super.key,
    this.child,
    this.title,
    this.icon,
    this.onTap,
    this.padding,
    this.borderRadius = DimensV2.d28,
    this.isCircle = false,
  });

  final Widget? child;
  final String? title;
  final Widget? icon;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  /// Only used when [isCircle] is false.
  final double borderRadius;

  /// When true, renders as a circle.
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final defaultPadding = padding ??
        (isCircle
            ? const EdgeInsets.all(DimensV2.d12)
            : const EdgeInsets.symmetric(
                horizontal: DimensV2.d16,
                vertical: DimensV2.d12,
              ));

    Widget buttonContent;
    if (child != null) {
      buttonContent = child!;
    } else {
      final children = <Widget>[
        if (icon != null) icon!,
        if (icon != null && title != null) const SizedBox(width: DimensV2.d8),
        if (title != null)
          Text(
            title!,
            style: AppTextStylesV2.text16Semibold.copyWith(
              color: colors.txContentPrimaryDefault,
            ),
          ),
      ];

      buttonContent = isCircle
          ? Center(child: icon ?? const SizedBox.shrink())
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            );
    }

    return PressableCardContainerV2(
      onTap: onTap,
      borderRadius: isCircle ? DimensV2.d100 : borderRadius,
      padding: defaultPadding,
      pressedOffset: DimensV2.d4,
      child: buttonContent,
    );
  }
}

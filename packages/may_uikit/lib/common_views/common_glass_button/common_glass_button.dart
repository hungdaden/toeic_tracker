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
    this.color,
    this.gradient,
    this.borderColor,
    this.shadowColor,
    this.textColor,
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

  /// Card surface color.
  final Color? color;

  /// Optional gradient.
  final Gradient? gradient;

  /// Border color.
  final Color? borderColor;

  /// Shadow color.
  final Color? shadowColor;

  /// Text color.
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final defaultPadding = padding ??
        (isCircle
            ? const EdgeInsets.all(DimensV2.d12)
            : const EdgeInsets.symmetric(
                horizontal: DimensV2.d16,
                vertical: DimensV2.d12,
              ));

    final effectiveColor = (color == null && gradient == null)
        ? const Color(0xFF1E293B)
        : color;
    final effectiveBorderColor = borderColor ?? Colors.white.withValues(alpha: 0.16);
    final effectiveShadowColor = shadowColor ?? Colors.black.withValues(alpha: 0.35);
    final effectiveTextColor = textColor ?? Colors.white;

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
              color: effectiveTextColor,
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
      color: effectiveColor,
      gradient: gradient,
      borderColor: effectiveBorderColor,
      shadowColor: effectiveShadowColor,
      pressedOffset: DimensV2.d4,
      child: buttonContent,
    );
  }
}


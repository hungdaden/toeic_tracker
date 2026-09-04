import 'package:flutter/material.dart';

import '../../../may_uikit_internal.dart';

/// A custom unread badge widget that displays a red circle with a label.
class AppUnreadBadgeV2 extends StatelessWidget {
  const AppUnreadBadgeV2({
    required this.label,
    super.key,
    this.padding = const EdgeInsets.symmetric(
      horizontal: DimensV2.d7,
      vertical: DimensV2.d2,
    ),
    this.backgroundColor = AppColorsV2.badgeRed600,
    this.borderRadius = DimensV2.d99,
    this.textStyle,
  });

  final String label;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final double borderRadius;
  final TextStyle? textStyle;

  /// Builds the [AppUnreadBadgeV2] widget.
  @override
  Widget build(BuildContext context) {
    if (label.isEmpty) return const SizedBox.shrink();

    return IgnorePointer(
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        constraints: const BoxConstraints(
          minWidth: DimensV2.d20,
          minHeight: DimensV2.d20,
        ),
        child: Text(
          label,
          style: textStyle ??
              AppTextStylesV2.text12Medium.copyWith(
                color: AppColorsV2.genericWhite,
                decoration: TextDecoration.none,
                decorationColor: AppColorsV2.transparent,
              ),
          maxLines: 1,
        ),
      ),
    );
  }
}

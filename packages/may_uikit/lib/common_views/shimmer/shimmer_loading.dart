import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as pk_shimmer;

import '../../may_uikit.dart';

/// Conditionally wraps content with a shimmer placeholder tree.
class ShimmerLoadingV2 extends StatelessWidget {
  const ShimmerLoadingV2({
    required this.isLoading,
    required this.child,
    this.loadingWidget,
    this.baseColor,
    this.highlightColor,
    super.key,
  });

  final Widget child;
  final Widget? loadingWidget;
  final bool isLoading;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child;
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    final effectiveBaseColor = baseColor ??
        (isDark ? AppColorsV2.neutral700 : AppColorsV2.neutral100);
    final effectiveHighlightColor = highlightColor ??
        (isDark ? AppColorsV2.neutral600 : AppColorsV2.neutral50);

    return pk_shimmer.Shimmer.fromColors(
      baseColor: effectiveBaseColor,
      highlightColor: effectiveHighlightColor,
      child: loadingWidget ?? child,
    );
  }
}

// ignore_for_file: missing_golden_test
// ignore_for_file: avoid_hard_coded_colors
import 'package:flutter/material.dart';

import '../../may_uikit.dart';

/// Rounded rectangle shimmer placeholder for card and block loading states.
class RoundedRectangleShimmerV2 extends StatelessWidget {
  const RoundedRectangleShimmerV2({
    this.width,
    this.height,
    this.radius,
    super.key,
  });

  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_common_widgets
    return Container(
      width: width,
      height: height ?? 16,
      decoration: BoxDecoration(
        color: AppColorsV2.genericBlack,
        borderRadius: BorderRadius.circular(radius ?? 8),
      ),
    );
  }
}

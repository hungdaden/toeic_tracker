// ignore_for_file: missing_golden_test
// ignore_for_file: avoid_hard_coded_colors
import 'package:flutter/material.dart';
import 'package:may_uikit/resources/styles/app_color.dart';

/// Circular shimmer placeholder used for avatar-like loading states.
class CircleShimmerV2 extends StatelessWidget {
  const CircleShimmerV2({
    this.diameter,
    super.key,
  });

  final double? diameter;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_common_widgets
    return Container(
      width: diameter ?? 32,
      height: diameter ?? 32,
      decoration: const BoxDecoration(
        color: AppColorsV2.genericBlack,
        shape: BoxShape.circle,
      ),
    );
  }
}

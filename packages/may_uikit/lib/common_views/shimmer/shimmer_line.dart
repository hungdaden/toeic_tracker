import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// Simple line-shaped shimmer placeholder.
class ShimmerLineV2 extends StatelessWidget {
  const ShimmerLineV2({
    super.key,
    required this.height,
    this.width,
    this.radius = DimensV2.d28,
  });

  final double height;
  final double? width;
  final double radius;

  @override
  /// Builds the shimmer line.
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width ?? double.infinity,
        height: height,
        color: AppColorsV2.genericWhite,
      ),
    );
  }
}

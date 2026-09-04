import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:shimmer/shimmer.dart';

/// Shimmer placeholder for tab bars.
class ShimmerTabV2 extends StatelessWidget {
  const ShimmerTabV2({
    super.key,
    this.padding,
    this.isShowBorder = true,
    this.borderColor = AppColorsV2.neutral200,
    this.borderWidth = DimensV2.d_05,
    this.isMultiLine = false,
  });

  final EdgeInsetsGeometry? padding;
  final bool isShowBorder;
  final Color borderColor;
  final double borderWidth;
  final bool isMultiLine;

  @override
  /// Builds the shimmer tab placeholder.
  Widget build(BuildContext context) {
    return PrimaryContainerV2(
      radius: isMultiLine ? DimensV2.d20 : DimensV2.d28,
      color: AppColorsV2.genericWhite,
      padding: padding ??
          (isMultiLine
              ? const EdgeInsets.symmetric(horizontal: DimensV2.d16, vertical: DimensV2.d12)
              : const EdgeInsets.all(DimensV2.d8)),
      border: isShowBorder
          ? Border.all(
              color: borderColor,
              width: borderWidth,
            )
          : null,
      child: Shimmer.fromColors(
        baseColor: AppColorsV2.neutral125,
        highlightColor: AppColorsV2.neutral200,
        child: Row(
          children: List.generate(3, (index) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: index == 2 ? DimensV2.d0 : DimensV2.d8,
                  top: DimensV2.d0,
                  bottom: DimensV2.d0,
                ),
                child: ShimmerLineV2(
                  height: isMultiLine ? DimensV2.d36 : DimensV2.d24,
                  radius: isMultiLine ? DimensV2.d12 : DimensV2.d32,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

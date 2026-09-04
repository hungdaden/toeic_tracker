import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

import '../common_text/common_text.dart';

/// Renders a circular avatar from the first character of [text].
class AvatarViewV2 extends StatelessWidget {
  const AvatarViewV2({
    required this.text,
    this.textStyle,
    this.isActive = false,
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
  });

  final String text;
  final double? width;
  final double? height;
  final bool isActive;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  @override
  /// Builds the avatar view.
  Widget build(BuildContext context) {
    final width = this.width ?? 60;
    final height = this.height ?? 60;
    final borderRadius = BorderRadius.circular(width / 2);
    const activeBorderRadius = BorderRadius.all(Radius.circular(7));

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColorsV2.genericBlack,
        borderRadius: borderRadius,
        border: Border.all(color: AppColorsV2.genericBlack),
      ),
      child: Stack(
        children: [
          Center(
            child: CommonTextV2(
              text.trim().firstOrNull?.toUpperCase(),
              style: textStyle ??
                  AppTextStylesV2.title1SemiBold.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColorsV2.genericWhite,
                  ),
            ),
          ),
          Visibility(
            visible: isActive,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: AppColorsV2.semanticGreen400,
                  borderRadius: activeBorderRadius,
                  border: Border.all(color: AppColorsV2.genericWhite),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

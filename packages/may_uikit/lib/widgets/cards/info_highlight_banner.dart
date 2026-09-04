// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../../may_uikit.dart';

/// Supported color variants for the [InfoHighlightBannerV2].
enum InfoHighlightBannerVariant {
  /// Purple highlight variant.
  DEFAULT,

  /// Red critical variant.
  CRITICAL,

  /// Light purple variant.
  SUCCESS,

  /// Blue info variant.
  WARNING,

  /// Attention variant.
  ATTENTION,

  /// Info variant.
  INFO,
}

/// Shortcut for [InfoHighlightBannerVariant.Critical].
const CRITICAL = InfoHighlightBannerVariant.CRITICAL;

/// Shortcut for [InfoHighlightBannerVariant.Default].
const DEFAULT = InfoHighlightBannerVariant.DEFAULT;

/// Shortcut for [InfoHighlightBannerVariant.Info].
const INFO = InfoHighlightBannerVariant.INFO;

/// Shortcut for [InfoHighlightBannerVariant.Success].
const SUCCESS = InfoHighlightBannerVariant.SUCCESS;

/// Shortcut for [InfoHighlightBannerVariant.Warning].
const WARNING = InfoHighlightBannerVariant.WARNING;

/// Shortcut for [InfoHighlightBannerVariant.Attention].
const ATTENTION = InfoHighlightBannerVariant.ATTENTION;

/// A card-like banner used to highlight important information with a solid/colored background.
class InfoHighlightBannerV2 extends StatelessWidget {
  /// Creates an [InfoHighlightBannerV2].
  const InfoHighlightBannerV2({
    super.key,
    required this.message,
    this.padding,
    this.borderRadius = AppRadiusV2.x3l,
    this.variant = DEFAULT,
    this.hasShadow = true,
    this.fillColor = false,
  });

  /// The text message displayed in the banner.
  final String message;

  /// Optional padding around the text inside the banner.
  final EdgeInsetsGeometry? padding;

  /// Corner radius of the banner.
  final double borderRadius;

  /// Color theme variant of the banner.
  final InfoHighlightBannerVariant variant;

  /// Whether the banner displays a shadow and its corresponding border.
  final bool hasShadow;

  /// Whether the banner is filled with solid primary color or uses a light tint background.
  final bool fillColor;

  /// Builds the info highlight banner.
  @override
  Widget build(BuildContext context) {
    final (:bgColor, :textColor, :shadowColor, :borderColor) = switch (variant) {
      InfoHighlightBannerVariant.DEFAULT => fillColor
          ? (
              bgColor: AppColorsV2.purpleIndigo500,
              textColor: AppColorsV2.genericWhite,
              shadowColor: AppColorsV2.purpleIndigo700,
              borderColor: AppColorsV2.transparent,
            )
          : (
              bgColor: AppColorsV2.purpleIndigo100,
              textColor: AppColorsV2.purpleIndigo700,
              shadowColor: AppColorsV2.purpleIndigo700,
              borderColor: AppColorsV2.purpleIndigo700,
            ),
      InfoHighlightBannerVariant.CRITICAL => fillColor
          ? (
              bgColor: AppColorsV2.semanticRed500,
              textColor: AppColorsV2.genericWhite,
              shadowColor: AppColorsV2.semanticCritical700,
              borderColor: AppColorsV2.transparent,
            )
          : (
              bgColor: AppColorsV2.semanticRed100,
              textColor: AppColorsV2.semanticRed700,
              shadowColor: AppColorsV2.semanticCritical700,
              borderColor: AppColorsV2.semanticCritical700,
            ),
      InfoHighlightBannerVariant.SUCCESS => fillColor
          ? (
              bgColor: AppColorsV2.semanticSuccess500,
              textColor: AppColorsV2.genericWhite,
              shadowColor: AppColorsV2.semanticSuccess700,
              borderColor: AppColorsV2.transparent,
            )
          : (
              bgColor: AppColorsV2.semanticSuccess100,
              textColor: AppColorsV2.semanticSuccess700,
              shadowColor: AppColorsV2.semanticSuccess700,
              borderColor: AppColorsV2.semanticSuccess700,
            ),
      InfoHighlightBannerVariant.WARNING => fillColor
          ? (
              bgColor: AppColorsV2.badgeOrange500,
              textColor: AppColorsV2.genericWhite,
              shadowColor: AppColorsV2.badgeOrange700,
              borderColor: AppColorsV2.transparent,
            )
          : (
              bgColor: AppColorsV2.badgeOrange100,
              textColor: AppColorsV2.badgeOrange700,
              shadowColor: AppColorsV2.badgeOrange700,
              borderColor: AppColorsV2.badgeOrange700,
            ),
      InfoHighlightBannerVariant.ATTENTION => fillColor
          ? (
              bgColor: AppColorsV2.semanticAttention500,
              textColor: AppColorsV2.genericWhite,
              shadowColor: AppColorsV2.semanticAttention700,
              borderColor: AppColorsV2.transparent,
            )
          : (
              bgColor: AppColorsV2.semanticAttention100,
              textColor: AppColorsV2.semanticAttention700,
              shadowColor: AppColorsV2.semanticAttention700,
              borderColor: AppColorsV2.semanticAttention700,
            ),
      InfoHighlightBannerVariant.INFO => fillColor
          ? (
              bgColor: AppColorsV2.semanticInfo500,
              textColor: AppColorsV2.genericWhite,
              shadowColor: AppColorsV2.semanticInfo700,
              borderColor: AppColorsV2.transparent,
            )
          : (
              bgColor: AppColorsV2.semanticInfo100,
              textColor: AppColorsV2.semanticInfo700,
              shadowColor: AppColorsV2.semanticInfo700,
              borderColor: AppColorsV2.semanticInfo700,
            ),
    };

    return PressableCardContainerV2(
      width: double.infinity,
      padding: padding ?? EdgeInsets.all(AppSpacingV2.lg),
      borderColor: hasShadow ? borderColor : bgColor,
      borderRadius: borderRadius,
      shadowColor: hasShadow ? shadowColor : AppColorsV2.transparent,
      color: bgColor,
      child: Text(message, style: AppTextStylesV2.text14Semibold.copyWith(color: textColor)),
    );
  }
}

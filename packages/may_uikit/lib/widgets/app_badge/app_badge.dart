import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart' hide AssetGenImage;

import '../../resources/generated/assets.gen.dart';

/// Backend-to-UIKit mapping codes for [AppBadgeStatus].
/// Backend-to-UIKit mapping codes for [AppBadgeStatus].
enum AppBadgeStatusCode {
  /// Unknown or unmapped status code.
  unknown(value: ''),

  /// Default badge status code.
  defaultStatus(value: 'DEFAULT'),

  /// Info badge status code.
  info(value: 'INFO'),

  /// Informational badge status code.
  informational(value: 'INFORMATIONAL'),

  /// Success badge status code.
  success(value: 'SUCCESS'),

  /// Attention badge status code.
  attention(value: 'ATTENTION'),

  /// Warning badge status code.
  warning(value: 'WARNING'),

  /// Critical badge status code.
  critical(value: 'CRITICAL'),

  /// Danger badge status code.
  danger(value: 'DANGER');

  /// Creates an [AppBadgeStatusCode] with the raw string [value].
  const AppBadgeStatusCode({required this.value});

  /// The raw string value sent by the backend.
  final String value;

  /// Parses a raw string [code] into an [AppBadgeStatusCode].
  static AppBadgeStatusCode fromCode(String? code) =>
      {
        for (final status in AppBadgeStatusCode.values) status.value.toLowerCase(): status
      }[code?.toLowerCase()] ??
      unknown;
}

/// Semantic badge variants supported by [AppBadgeV2].
enum AppBadgeStatus {
  /// Undefined status variant.
  undefined,

  /// Default status badge.
  defaultBadge,

  /// Success status badge.
  successBadge,

  /// Critical status badge.
  criticalBadge,

  /// Attention status badge.
  attentionBadge,

  /// Warning status badge.
  warningBadge,

  /// Info status badge.
  infoBadge,

  /// No-info status badge.
  noInfoBadge;

  /// Parses a raw string [code] into an [AppBadgeStatus].
  static AppBadgeStatus fromCode(String? code) => AppBadgeStatusCode.fromCode(code).appBadgeStatus;
}

/// Maps raw status codes into badge presentation variants.
extension AppBadgeStatusCodeExtension on AppBadgeStatusCode {
  /// Resolves the corresponding [AppBadgeStatus] for this status code.
  AppBadgeStatus get appBadgeStatus {
    switch (this) {
      case AppBadgeStatusCode.info:
      case AppBadgeStatusCode.informational:
        return AppBadgeStatus.infoBadge;
      case AppBadgeStatusCode.success:
        return AppBadgeStatus.successBadge;
      case AppBadgeStatusCode.attention:
        return AppBadgeStatus.attentionBadge;
      case AppBadgeStatusCode.warning:
        return AppBadgeStatus.warningBadge;
      case AppBadgeStatusCode.critical:
      case AppBadgeStatusCode.danger:
        return AppBadgeStatus.criticalBadge;
      case AppBadgeStatusCode.unknown:
      case AppBadgeStatusCode.defaultStatus:
        return AppBadgeStatus.defaultBadge;
    }
  }
}

/// Badge widget for semantic status display.
class AppBadgeV2 extends StatelessWidget {
  /// The badge status variant determining icon and colors.
  final AppBadgeStatus status;

  /// The text label displayed inside the badge.
  final String label;

  /// Optional custom icon widget overriding the default status icon.
  final Widget? iconCustom;

  /// Optional custom padding for the badge container.
  final EdgeInsetsGeometry? padding;

  /// Optional custom border radius for the badge container.
  final double? borderRadius;

  /// Optional custom text style for the badge label.
  final TextStyle? textStyle;

  /// Whether to render the leading status icon.
  final bool showIcon;

  /// Whether to display a filled background color behind the badge.
  final bool? isBgColor;

  /// Creates an [AppBadgeV2].
  const AppBadgeV2({
    super.key,
    required this.status,
    required this.label,
    this.iconCustom,
    this.padding,
    this.borderRadius,
    this.textStyle,
    this.showIcon = true,
    this.isBgColor = true,
  });

  @override

  /// Builds the badge widget.
  Widget build(BuildContext context) {
    final color = context.mayColors;
    String icon;
    Color textColor;
    Color bgColor;

    if (status == AppBadgeStatus.undefined) {
      return Text(
        label,
        style: textStyle ??
            AppTextStylesV2.badgeLabelSemiBold.copyWith(
              color: AppColorsV2.badgeNeutral700,
            ),
      );
    }

    switch (status) {
      case AppBadgeStatus.defaultBadge:
        icon = Assets.icons.iconInfoGreyBadge.path;
        textColor = AppColorsV2.neutral700;
        bgColor = AppColorsV2.neutral125;
        break;
      case AppBadgeStatus.successBadge:
        icon = Assets.icons.iconCheckBadge.path;
        textColor = color.bnTextSuccess;
        bgColor = color.bnBgSuccess;
        break;
      case AppBadgeStatus.criticalBadge:
        icon = Assets.icons.iconCloseBadge.path;
        textColor = color.bnTextCritical;
        bgColor = color.bnBgCritical;
        break;
      case AppBadgeStatus.attentionBadge:
        icon = Assets.icons.iconTimeBadge.path;
        textColor = color.bnTextAttention;
        bgColor = color.bnBgAttention;
        break;
      case AppBadgeStatus.warningBadge:
        icon = Assets.icons.iconWarningBadge.path;
        textColor = color.bnTextWarning;
        bgColor = color.bnBgWarning;
        break;
      case AppBadgeStatus.infoBadge:
        icon = Assets.icons.iconInfoBlueBadge.path;
        textColor = color.bnTextInfo;
        bgColor = color.bnBgInfo;
        break;
      case AppBadgeStatus.noInfoBadge:
        icon = Assets.icons.iconTime.path;
        textColor = color.secondaryText;
        bgColor = color.surface;
        break;
      case AppBadgeStatus.undefined:
        throw UnimplementedError();
    }

    return Container(
      padding: isBgColor == true
          ? padding ??
              const EdgeInsets.symmetric(
                horizontal: DimensV2.d8,
                vertical: DimensV2.d2,
              )
          : padding,
      decoration: BoxDecoration(
        color: isBgColor == true ? bgColor : AppColorsV2.transparent,
        borderRadius: BorderRadius.circular(borderRadius ?? AppRadiusV2.full),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...[
            isBgColor == true
                ? iconCustom ??
                    AssetGenImage(icon).image(
                      height: DimensV2.d12,
                      width: DimensV2.d12,
                    )
                : AssetGenImage(icon).image(
                    height: DimensV2.d16,
                    width: DimensV2.d16,
                  ),
            const SizedBox(width: DimensV2.d4),
          ],
          isBgColor == true
              ? Text(
                  label,
                  style: textStyle?.copyWith(color: textColor) ??
                      AppTextStylesV2.badgeLabelSemiBold.copyWith(
                        color: textColor,
                      ),
                )
              : Text(label,
                  style: textStyle?.copyWith(color: AppColorsV2.neutral800) ??
                      AppTextStylesV2.badgeLabelRegular.copyWith(color: AppColorsV2.neutral800)),
        ],
      ),
    );
  }
}

/// Multi-badge types for multi-badge display rows.
enum AppMultiBadgeType {
  /// Info type badge.
  info,

  /// Critical type badge.
  critical,

  /// Default fallback badge.
  defaultBadge;

  /// Parses a raw string [code] into an [AppMultiBadgeType].
  static AppMultiBadgeType fromCode(String? code) {
    final type = (code ?? '').toUpperCase();
    if (type.contains('INFO')) {
      return AppMultiBadgeType.info;
    }
    if (type.contains('CRITICAL') ||
        type.contains('WARNING') ||
        type.contains('ATTENTION') ||
        type.contains('DANGER')) {
      return AppMultiBadgeType.critical;
    }
    return AppMultiBadgeType.defaultBadge;
  }
}

/// Pill badge component for multi-badge lists.
class AppMultiBadgeV2 extends StatelessWidget {
  /// Creates an [AppMultiBadgeV2].
  const AppMultiBadgeV2({
    super.key,
    required this.label,
    this.badgeType,
    this.padding,
    this.borderRadius,
    this.textStyle,
  });

  /// The text label displayed inside the badge.
  final String label;

  /// Optional badge type string used to determine colors.
  final String? badgeType;

  /// Optional custom padding for the badge container.
  final EdgeInsetsGeometry? padding;

  /// Optional custom border radius for the badge container.
  final double? borderRadius;

  /// Optional custom text style for the badge label.
  final TextStyle? textStyle;

  @override

  /// Builds the multi-badge widget.
  Widget build(BuildContext context) {
    final type = AppMultiBadgeType.fromCode(badgeType);

    final Color bgColor;
    final Color textColor;

    switch (type) {
      case AppMultiBadgeType.info:
        bgColor = AppColorsV2.badgeBlue100;
        textColor = AppColorsV2.badgeBlue700;
        break;
      case AppMultiBadgeType.critical:
        bgColor = AppColorsV2.badgeOrange100;
        textColor = AppColorsV2.badgeOrange600;
        break;
      case AppMultiBadgeType.defaultBadge:
        bgColor = AppColorsV2.neutral125;
        textColor = AppColorsV2.neutral700;
        break;
    }

    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: DimensV2.d10,
            vertical: DimensV2.d4,
          ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius ?? AppRadiusV2.full),
      ),
      child: Text(
        label,
        style: textStyle?.copyWith(color: textColor) ??
            AppTextStylesV2.text13Semibold.copyWith(
              color: textColor,
            ),
      ),
    );
  }
}

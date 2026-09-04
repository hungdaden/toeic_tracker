import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

export 'common_button_enum.dart';
export 'common_icon_button.dart';

/// Mobile button component for the K12 design system.
class CommonButtonV2 extends StatelessWidget {
  /// Creates a K12 common button with [label] and optional [subtitle].
  const CommonButtonV2({
    super.key,
    required this.label,
    this.subtitle,
    this.variant = CommonButtonVariant.primary,
    CommonButtonSize? size,
    this.loading = false,
    this.isEnabled = true,
    this.onTap,
    this.width,
  }) : size = size ??
            (variant == CommonButtonVariant.criticalOutline
                ? CommonButtonSize.medium
                : CommonButtonSize.large);

  /// Main button text.
  final String label;

  /// Secondary text shown below [label].
  final String? subtitle;

  /// Visual treatment of the button.
  final CommonButtonVariant variant;

  /// Size preset used for height, typography, and loading indicator sizing.
  final CommonButtonSize size;

  /// Whether to show the loading indicator instead of text.
  final bool loading;

  /// Whether the button can be pressed.
  final bool isEnabled;

  /// Callback called when the enabled button is tapped.
  final VoidCallback? onTap;

  /// Optional fixed button width.
  final double? width;

  /// Builds the button using [PressableCardContainerV2] for press feedback.
  @override
  Widget build(BuildContext context) {
    final style = _CommonButtonStyle.resolve(
      colors: context.mayColors,
      variant: variant,
      enabled: isEnabled,
      loading: loading,
    );
    final active = isEnabled && !loading && onTap != null;

    return PressableCardContainerV2(
      color: style.backgroundColor,
      borderColor: style.borderColor,
      borderWidth: style.borderWidth,
      shadowColor: style.shadowColor,
      borderRadius: AppRadiusV2.full,
      pressedOffset: style.pressedOffset,
      padding: EdgeInsets.zero,
      onTap: active ? onTap : null,
      child: SizedBox(
        width: width,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: variant == CommonButtonVariant.textOnly ? DimensV2.d0 : DimensV2.d150,
            minHeight: _minHeight,
          ),
          child: Padding(
            padding: _padding,
            child: Center(
              child: DefaultTextStyle.merge(
                style: _labelStyle.copyWith(color: style.foregroundColor),
                child: IconTheme.merge(
                  data: IconThemeData(
                    color: style.foregroundColor,
                    size: DimensV2.d24,
                  ),
                  child: ClipRect(
                    child: loading
                        ? SizedBox.square(
                            dimension: _loadingIndicatorBoxSize,
                            child: Padding(
                              padding: const EdgeInsets.all(DimensV2.d2),
                              child: CircularProgressIndicator(
                                strokeWidth: DimensV2.d3,
                                color: style.foregroundColor,
                              ),
                            ),
                          )
                        : _CommonButtonContent(
                            label: label,
                            subtitle: subtitle,
                            fillWidth: variant != CommonButtonVariant.textOnly,
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double get _minHeight {
    switch (size) {
      case CommonButtonSize.large:
        return DimensV2.d56;
      case CommonButtonSize.medium:
        return DimensV2.d46;
    }
  }

  EdgeInsetsGeometry get _padding {
    if (variant == CommonButtonVariant.textOnly) return EdgeInsets.zero;
    return EdgeInsets.symmetric(
      horizontal: AppSpacingV2.xl,
      vertical: _verticalPadding,
    );
  }

  TextStyle get _labelStyle {
    if (_hasSubtitle) {
      return AppTextStylesV2.text16Semibold.copyWith(height: DimensV2.d24 / DimensV2.d16);
    }
    switch (size) {
      case CommonButtonSize.large:
        return AppTextStylesV2.text16Semibold;
      case CommonButtonSize.medium:
        return AppTextStylesV2.text14Semibold;
    }
  }

  bool get _hasSubtitle => subtitle != null && subtitle!.isNotEmpty;

  double get _verticalPadding {
    if (_hasSubtitle) {
      return ((_minHeight - _contentHeight) / 2).clamp(DimensV2.d0, double.infinity);
    }
    switch (size) {
      case CommonButtonSize.large:
        return AppSpacingV2.md;
      case CommonButtonSize.medium:
        return AppSpacingV2.sm;
    }
  }

  double get _contentHeight {
    if (_hasSubtitle) return DimensV2.d24 + AppSpacingV2.x3s + DimensV2.d20;
    switch (size) {
      case CommonButtonSize.large:
        return DimensV2.d24;
      case CommonButtonSize.medium:
        return DimensV2.d22;
    }
  }

  double get _loadingIndicatorBoxSize {
    switch (size) {
      case CommonButtonSize.large:
        return DimensV2.d22;
      case CommonButtonSize.medium:
        return DimensV2.d20;
    }
  }
}

class _CommonButtonContent extends StatelessWidget {
  const _CommonButtonContent({
    required this.label,
    this.subtitle,
    this.fillWidth = true,
  });

  final String label;
  final String? subtitle;
  final bool fillWidth;

  /// Builds centered label and optional subtitle content.
  @override
  Widget build(BuildContext context) {
    final textColor = DefaultTextStyle.of(context).style.color ?? AppColorsV2.genericWhite;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: fillWidth ? MainAxisSize.max : MainAxisSize.min,
      children: [
        Flexible(
          fit: fillWidth ? FlexFit.tight : FlexFit.loose,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: AppSpacingV2.x3s),
                Text(
                  subtitle!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTextStylesV2.text13Medium.copyWith(
                    color: textColor,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _CommonButtonStyle {
  const _CommonButtonStyle({
    required this.backgroundColor,
    required this.borderColor,
    required this.shadowColor,
    required this.foregroundColor,
    required this.pressedOffset,
    this.borderWidth = DimensV2.d1,
  });

  final Color backgroundColor;
  final Color borderColor;
  final Color shadowColor;
  final Color foregroundColor;
  final double pressedOffset;
  final double borderWidth;

  static _CommonButtonStyle resolve({
    required MayThemeColorsV2 colors,
    required CommonButtonVariant variant,
    required bool enabled,
    required bool loading,
  }) {
    if (loading) {
      return _loading(colors, variant);
    }
    if (!enabled) {
      return _disabled(colors, variant);
    }

    return switch (variant) {
      CommonButtonVariant.primary => _CommonButtonStyle(
          backgroundColor: colors.btnPrimaryDefault,
          borderColor: colors.btnPrimaryBorderDefault,
          shadowColor: colors.sdBtnDefault,
          foregroundColor: AppColorsV2.genericWhite,
          pressedOffset: DimensV2.d4,
        ),
      CommonButtonVariant.secondary => _CommonButtonStyle(
          backgroundColor: colors.btnSecondaryDefault,
          borderColor: colors.sdDefault,
          shadowColor: colors.sdDefault,
          foregroundColor: colors.txContentPrimaryDefault,
          pressedOffset: DimensV2.d4,
        ),
      CommonButtonVariant.outline => _CommonButtonStyle(
          backgroundColor: colors.bgBtnOutlineDefault,
          borderColor: colors.bdOutlineDefault,
          shadowColor: colors.sdBtnOutlineDefault,
          foregroundColor: colors.txContentPrimaryDefault,
          pressedOffset: DimensV2.d4,
          borderWidth: DimensV2.d_05,
        ),
      CommonButtonVariant.textOnly => _CommonButtonStyle(
          backgroundColor: AppColorsV2.transparent,
          borderColor: AppColorsV2.transparent,
          shadowColor: AppColorsV2.transparent,
          foregroundColor: colors.txContentPrimaryDefault,
          pressedOffset: DimensV2.d0,
        ),
      CommonButtonVariant.criticalPrimary => _CommonButtonStyle(
          backgroundColor: colors.btnCriticalPrimaryDefault,
          borderColor: AppColorsV2.semanticCritical900,
          shadowColor: AppColorsV2.semanticCritical900,
          foregroundColor: colors.txBtnCriticalDefault,
          pressedOffset: DimensV2.d4,
        ),
      CommonButtonVariant.criticalOutline => _CommonButtonStyle(
          backgroundColor: colors.btnBgCriticalOutlineDefault,
          borderColor: colors.btnCriticalOutlineDefault,
          shadowColor: colors.btnCriticalOutlineDefault,
          foregroundColor: colors.btnCriticalOutlineDefault,
          pressedOffset: DimensV2.d4,
          borderWidth: DimensV2.d_05,
        ),
      CommonButtonVariant.success => const _CommonButtonStyle(
          backgroundColor: AppColorsV2.greenTheme500,
          borderColor: AppColorsV2.greenTheme700,
          shadowColor: AppColorsV2.greenTheme700,
          foregroundColor: AppColorsV2.genericWhite,
          pressedOffset: DimensV2.d4,
        ),
    };
  }

  static _CommonButtonStyle _loading(MayThemeColorsV2 colors, CommonButtonVariant variant) {
    if (variant == CommonButtonVariant.criticalOutline) {
      return _CommonButtonStyle(
        backgroundColor: colors.btnBgCriticalOutlineDefault,
        borderColor: colors.btnCriticalOutlineDefault,
        shadowColor: colors.btnCriticalOutlineDefault,
        foregroundColor: colors.btnCriticalOutlineDefault,
        pressedOffset: DimensV2.d0,
        borderWidth: DimensV2.d_05,
      );
    }

    final filled = variant == CommonButtonVariant.primary ||
        variant == CommonButtonVariant.criticalPrimary ||
        variant == CommonButtonVariant.success;

    return _CommonButtonStyle(
      backgroundColor: filled ? AppColorsV2.neutral200 : AppColorsV2.neutral100,
      borderColor: filled ? AppColorsV2.transparent : AppColorsV2.neutral200,
      shadowColor: filled ? AppColorsV2.transparent : AppColorsV2.neutral200,
      foregroundColor: filled ? AppColorsV2.genericWhite : AppColorsV2.neutral500,
      pressedOffset: DimensV2.d0,
      borderWidth: filled ? 0.0 : DimensV2.d_05,
    );
  }

  static _CommonButtonStyle _disabled(MayThemeColorsV2 colors, CommonButtonVariant variant) {
    return switch (variant) {
      CommonButtonVariant.textOnly => _CommonButtonStyle(
          backgroundColor: AppColorsV2.transparent,
          borderColor: AppColorsV2.transparent,
          shadowColor: AppColorsV2.transparent,
          foregroundColor: colors.btnCriticalOutlineDisable,
          pressedOffset: DimensV2.d0,
        ),
      CommonButtonVariant.outline || CommonButtonVariant.criticalOutline => _CommonButtonStyle(
          backgroundColor: colors.btnBgCriticalOutlineDisable,
          borderColor: colors.bdDefault,
          shadowColor: colors.sdDefault,
          foregroundColor: colors.btnCriticalOutlineDisable,
          pressedOffset: DimensV2.d4,
          borderWidth: DimensV2.d_05,
        ),
      CommonButtonVariant.secondary => _CommonButtonStyle(
          backgroundColor: colors.btnBgDisableSecondary,
          borderColor: AppColorsV2.transparent,
          shadowColor: colors.sdBtnSecondaryDisable,
          foregroundColor: colors.txBtnSecondaryDisable,
          pressedOffset: DimensV2.d4,
        ),
      CommonButtonVariant.primary ||
      CommonButtonVariant.criticalPrimary ||
      CommonButtonVariant.success =>
        _CommonButtonStyle(
          backgroundColor: colors.btnBgDisablePrimary,
          borderColor: AppColorsV2.transparent,
          shadowColor: colors.sdBtnPrimaryDisable,
          foregroundColor: colors.txBtnPrimaryDisable,
          pressedOffset: DimensV2.d4,
        ),
    };
  }
}

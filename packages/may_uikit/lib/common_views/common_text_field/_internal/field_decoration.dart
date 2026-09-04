import 'package:flutter/material.dart';

import '../../../resources/dimens.dart';
import '../../../resources/radius.dart';
import '../../../resources/spacing.dart';
import '../../../resources/styles/app_color.dart';
import '../../../themes/main_theme.dart';
import '../common_text_field_enum.dart';

/// Internal helper that resolves every visual token required to render a
/// field at a given [MayFieldState].
///
/// We do not bake colors into the widgets directly — instead this class is the
/// single place where spec colors and theme tokens are reconciled. New themes
/// can be supported by extending this resolver.
@immutable
class FieldDecoration {
  const FieldDecoration({
    required this.backgroundColor,
    required this.borderColor,
    required this.borderWidth,
    required this.borderRadius,
    required this.labelColor,
    required this.valueColor,
    required this.placeholderColor,
    required this.hintColor,
    required this.errorColor,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.interiorGap,
    required this.leadingTrailingGap,
  });

  /// Container background.
  final Color backgroundColor;

  /// Container border color. `null` means "no border".
  final Color borderColor;

  /// Border stroke width in logical pixels.
  final double borderWidth;

  /// Container border radius.
  final BorderRadius borderRadius;

  /// Color for the floating / inline label.
  final Color labelColor;

  /// Color for the committed value text.
  final Color valueColor;

  /// Color for the placeholder text.
  final Color placeholderColor;

  /// Color for the hint message.
  final Color hintColor;

  /// Color for the error message (and the active error border accent).
  final Color errorColor;

  /// Container horizontal padding.
  final double horizontalPadding;

  /// Container vertical padding.
  final double verticalPadding;

  /// Gap between label and value/placeholder inside the container.
  final double interiorGap;

  /// Gap between content and the trailing icon.
  final double leadingTrailingGap;

  /// Convenience to obtain a [BoxDecoration] from the resolved tokens.
  BoxDecoration get boxDecoration {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: borderRadius,
      border: borderColor.a == 0 ? null : Border.all(color: borderColor, width: borderWidth),
    );
  }

  /// Creates a copy of this [FieldDecoration]
  FieldDecoration copyWith({
    double? horizontalPadding,
    double? verticalPadding,
  }) {
    return FieldDecoration(
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
      borderRadius: borderRadius,
      labelColor: labelColor,
      valueColor: valueColor,
      placeholderColor: placeholderColor,
      hintColor: hintColor,
      errorColor: errorColor,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      verticalPadding: verticalPadding ?? this.verticalPadding,
      interiorGap: interiorGap,
      leadingTrailingGap: leadingTrailingGap,
    );
  }

  /// Resolves a [FieldDecoration] for the given [state] inside a [theme].
  factory FieldDecoration.resolve({
    required MayFieldState state,
    required MayFieldShape shape,
    required MayThemeColorsV2 colors,
    required bool isActive,
    bool isSearch = false,
  }) {
    final borderRadius = shape == MayFieldShape.pill
        ? BorderRadius.circular(AppRadiusV2.full)
        : BorderRadius.circular(AppRadiusV2.x2l);

    switch (state) {
      case MayFieldState.unfilled:
        return FieldDecoration(
          backgroundColor:
              (isSearch && !isActive) ? colors.bgTextInputDefault : colors.bgTextInputDefault,
          borderColor: isSearch
              ? (isActive ? colors.themeAccent : colors.bdDefault)
              : colors.bdTextInputBorder,
          borderWidth: DimensV2.d_05,
          borderRadius: borderRadius,
          labelColor: colors.txContentSecondaryDefault,
          valueColor: colors.txContentPrimaryDefault,
          placeholderColor: colors.txTextInputPlaceholder,
          hintColor: colors.txHelptext,
          errorColor: AppColorsV2.transparent,
          horizontalPadding: AppSpacingV2.xl,
          verticalPadding: AppSpacingV2.xs,
          interiorGap: AppSpacingV2.x2s,
          leadingTrailingGap: AppSpacingV2.sm,
        );

      case MayFieldState.filled:
        return FieldDecoration(
          backgroundColor: colors.bgTextInputDefault,
          borderColor: isSearch
              ? (isActive ? colors.themeAccent : colors.bdDefault)
              : colors.bdTextInputBorder,
          borderWidth: DimensV2.d_05,
          borderRadius: borderRadius,
          labelColor: colors.txContentSecondaryDefault,
          valueColor: colors.txContentPrimaryDefault,
          placeholderColor: colors.txTextInputPlaceholder,
          hintColor: colors.txHelptext,
          errorColor: AppColorsV2.transparent,
          horizontalPadding: AppSpacingV2.xl,
          verticalPadding: AppSpacingV2.xs,
          interiorGap: AppSpacingV2.x2s,
          leadingTrailingGap: AppSpacingV2.sm,
        );

      case MayFieldState.errorUnfilled:
        return FieldDecoration(
          backgroundColor: colors.bgTextInputDefault,
          borderColor: colors.bdTextInputError,
          borderWidth: DimensV2.d_05,
          borderRadius: borderRadius,
          labelColor: colors.txContentSecondaryDefault,
          valueColor: colors.txContentPrimaryDefault,
          placeholderColor: colors.txTextInputPlaceholder,
          hintColor: colors.txHelptext,
          errorColor: colors.txCritical,
          horizontalPadding: AppSpacingV2.xl,
          verticalPadding: AppSpacingV2.xs,
          interiorGap: AppSpacingV2.x2s,
          leadingTrailingGap: AppSpacingV2.sm,
        );

      case MayFieldState.errorFilled:
        return FieldDecoration(
          backgroundColor: colors.bgTextInputDefault,
          borderColor: colors.bdTextInputError,
          borderWidth: DimensV2.d_05,
          borderRadius: borderRadius,
          labelColor: colors.txContentSecondaryDefault,
          valueColor: colors.txContentPrimaryDefault,
          placeholderColor: colors.txTextInputPlaceholder,
          hintColor: colors.txHelptext,
          errorColor: colors.txCritical,
          horizontalPadding: AppSpacingV2.xl,
          verticalPadding: AppSpacingV2.xs,
          interiorGap: AppSpacingV2.x2s,
          leadingTrailingGap: AppSpacingV2.sm,
        );

      case MayFieldState.readOnly:
        return FieldDecoration(
          backgroundColor: colors.bgFieldDisabled,
          borderColor: AppColorsV2.transparent,
          borderWidth: DimensV2.d0,
          borderRadius: borderRadius,
          labelColor: colors.txContentSecondaryDefault,
          valueColor: colors.txContentPrimaryDefault,
          placeholderColor: colors.txTextInputPlaceholder,
          hintColor: colors.txHelptext,
          errorColor: AppColorsV2.transparent,
          horizontalPadding: AppSpacingV2.xl,
          verticalPadding: AppSpacingV2.xs,
          interiorGap: AppSpacingV2.x2s,
          leadingTrailingGap: AppSpacingV2.sm,
        );

      case MayFieldState.disabled:
        return FieldDecoration(
          backgroundColor: colors.bgFieldDisabled,
          borderColor: AppColorsV2.transparent,
          borderWidth: DimensV2.d0,
          borderRadius: borderRadius,
          labelColor: colors.txHelptext,
          valueColor: colors.txContentSecondaryDefault,
          placeholderColor: colors.txTextInputPlaceholder,
          hintColor: colors.txHelptext,
          errorColor: AppColorsV2.transparent,
          horizontalPadding: AppSpacingV2.xl,
          verticalPadding: AppSpacingV2.xs,
          interiorGap: AppSpacingV2.x2s,
          leadingTrailingGap: AppSpacingV2.sm,
        );
    }
  }
}

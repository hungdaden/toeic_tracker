import 'package:flutter/material.dart';

import '../../../resources/styles/app_text_style.dart';

/// Internal text-style helpers shared by every field in the
/// `common_text_field` family.
///
/// All values delegate to the centralized design tokens in
/// [AppTextStylesV2] — field widgets should never hardcode font sizes,
/// weights, or line heights. Override [color] at the call site with
/// [TextStyle.copyWith] when a state-driven color is required.
class FieldTextStyles {
  const FieldTextStyles._();

  /// Field label — Inter Medium 13/20.
  static TextStyle get label => AppTextStylesV2.text13Medium;

  /// Input value / placeholder — Inter Semi Bold 14/20.
  static TextStyle get value => AppTextStylesV2.text14Semibold;

  /// Hint / error message — Inter Medium 12/16.
  static TextStyle get hint => AppTextStylesV2.subHeadRegular;
}

import 'package:flutter/material.dart';
import 'package:may_uikit/resources/dimens.dart';
import 'package:may_uikit/resources/styles/app_color.dart';

/// Centralized text styles used by the UIKit.
class AppTextStylesV2 {
  static String fontFamily = 'Inter';

  static final TextStyle _baseTextStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppColorsV2.primaryText900,
  );

  // Large
  static TextStyle largeTitleRegular = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d30,
    fontWeight: FontWeight.w500,
  ));

  static TextStyle largeTitleSemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d30,
    fontWeight: FontWeight.w600,
  ));

  // Title
  static TextStyle title1Regular = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d24,
    fontWeight: FontWeight.w500,
  ));
  static TextStyle title15Medium = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d15,
    fontWeight: FontWeight.w500,
    height: DimensV2.d22 / DimensV2.d15,
  ));
  static TextStyle title1SemiBold = _baseTextStyle.merge(const TextStyle(
      fontSize: DimensV2.d24, fontWeight: FontWeight.w600, height: DimensV2.d31 / DimensV2.d24));
  static TextStyle title15SemiBold = _baseTextStyle.merge(const TextStyle(
      fontSize: DimensV2.d15, fontWeight: FontWeight.w600, height: DimensV2.d24 / DimensV2.d15));
  static TextStyle title16SemiBold = _baseTextStyle.merge(const TextStyle(
      fontSize: DimensV2.d16, fontWeight: FontWeight.w600, height: DimensV2.d22 / DimensV2.d16));

  static TextStyle title2Regular = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d18,
    fontWeight: FontWeight.w500,
    height: DimensV2.d24 / DimensV2.d18,
  ));
  static TextStyle title2SemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d18,
    fontWeight: FontWeight.w600,
    height: DimensV2.d24 / DimensV2.d18,
  ));
  static TextStyle title24SemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d24,
    fontWeight: FontWeight.w600,
    height: DimensV2.d31 / DimensV2.d24,
  ));

  static TextStyle title3Regular = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d16,
    fontWeight: FontWeight.w500,
  ));
  static TextStyle title3SemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d16,
    fontWeight: FontWeight.w600,
  ));

  static TextStyle title4Regular = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d16,
    fontWeight: FontWeight.w500,
  ));

  /// This specific style does not conform to hierarchy of title style.
  /// It is used only for specific use case.
  static TextStyle title4SemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d16,
    fontWeight: FontWeight.w600,
  ));

  static TextStyle title5Regular = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d15,
    fontWeight: FontWeight.w500,
  ));
  static TextStyle title5SemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d15,
    fontWeight: FontWeight.w600,
  ));

  static TextStyle typography = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d20,
    fontWeight: FontWeight.w600,
  ));

  static TextStyle title20SemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d20,
    fontWeight: FontWeight.w600,
    height: DimensV2.d28 / DimensV2.d20,
  ));

  // Headline
  static TextStyle headLineRegular = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d14,
    fontWeight: FontWeight.w600,
  ));
  static TextStyle headLineSemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d14,
    fontWeight: FontWeight.w600,
  ));

  //Body
  static TextStyle bodyRegular = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d14,
    fontWeight: FontWeight.w500,
    height: DimensV2.d20 / DimensV2.d14,
  ));

  static TextStyle bodySemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d14,
    fontWeight: FontWeight.w600,
  ));

  // Label
  static TextStyle labelRegular = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d14,
    fontWeight: FontWeight.w500,
  ));
  static TextStyle labelMedium = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d14,
    fontWeight: FontWeight.w500,
  ));
  static TextStyle labelSemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d14,
    fontWeight: FontWeight.w600,
  ));

  // badge label style
  static TextStyle badgeLabelRegular = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d13,
    fontWeight: FontWeight.w500,
    height: DimensV2.d20 / DimensV2.d13,
  ));

  static TextStyle badgeLabelSemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d13,
    fontWeight: FontWeight.w600,
    height: DimensV2.d20 / DimensV2.d13,
  ));

  // Subhead
  static TextStyle subHeadRegular = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d12,
    fontWeight: FontWeight.w500,
    height: DimensV2.d16 / DimensV2.d12,
  ));
  static TextStyle subHeadSemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d12,
    fontWeight: FontWeight.w600,
  ));

  // Footnote
  static TextStyle footNoteRegular = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d12,
    fontWeight: FontWeight.w500,
  ));
  static TextStyle footNoteSemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d12,
    fontWeight: FontWeight.w600,
  ));

  // Hint
  static TextStyle hintRegular = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d11,
    fontWeight: FontWeight.w500,
  ));
  static TextStyle hintMedium = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d12,
    fontWeight: FontWeight.w500,
  ));
  static TextStyle hintSemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d11,
    fontWeight: FontWeight.w600,
  ));

  // Paragaraph
  static TextStyle paragraphRegular = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d14,
    fontWeight: FontWeight.w500,
    height: DimensV2.d22 / DimensV2.d14,
  ));

  // Paragaraph
  static TextStyle paragraphMedium = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d14,
    fontWeight: FontWeight.w500,
    height: DimensV2.d23 / DimensV2.d14,
  ));

  // Paragaraph
  static TextStyle paragraphSemibold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d14,
    fontWeight: FontWeight.w600,
    height: DimensV2.d22 / DimensV2.d14,
  ));

  //Text
  static TextStyle text11Medium = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d11,
    fontWeight: FontWeight.w500,
    height: DimensV2.d16 / DimensV2.d11,
  ));

  //Text
  static TextStyle text12Medium = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d12,
    fontWeight: FontWeight.w500,
    height: DimensV2.d16 / DimensV2.d12,
  ));

  //Text
  static TextStyle text13Medium = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d13,
    fontWeight: FontWeight.w500,
    height: DimensV2.d20 / DimensV2.d13,
  ));

  //Text
  static TextStyle text13Semibold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d13,
    fontWeight: FontWeight.w600,
    height: DimensV2.d20 / DimensV2.d13,
  ));

  //Text
  static TextStyle text14Medium = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d14,
    fontWeight: FontWeight.w500,
    height: DimensV2.d20 / DimensV2.d14,
  ));

  //Text
  static TextStyle text14Semibold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d14,
    fontWeight: FontWeight.w600,
    height: DimensV2.d20 / DimensV2.d14,
  ));

  //Text
  static TextStyle text15Semibold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d15,
    fontWeight: FontWeight.w600,
    height: DimensV2.d22 / DimensV2.d15,
  ));

  //Text
  static TextStyle text16Medium = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d16,
    fontWeight: FontWeight.w500,
    height: DimensV2.d22 / DimensV2.d16,
  ));

  //Text
  static TextStyle text16Semibold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d16,
    fontWeight: FontWeight.w600,
    height: DimensV2.d22 / DimensV2.d16,
  ));
  static TextStyle text18Semibold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d18,
    fontWeight: FontWeight.w600,
    height: DimensV2.d22 / DimensV2.d18,
  ));

  //Text
  static TextStyle text18Medium = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d18,
    fontWeight: FontWeight.w500,
    height: DimensV2.d22 / DimensV2.d18,
  ));

  //Text
  static TextStyle text20SemiBold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d20,
    fontWeight: FontWeight.w600,
    height: DimensV2.d28 / DimensV2.d20,
  ));

  //Text
  static TextStyle text24Medium = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d24,
    fontWeight: FontWeight.w500,
    height: DimensV2.d22 / DimensV2.d16,
  ));

  static TextStyle text24Semibold = _baseTextStyle.merge(const TextStyle(
    fontSize: DimensV2.d24,
    fontWeight: FontWeight.w600,
    height: DimensV2.d22 / DimensV2.d18,
  ));
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:may_uikit/resources/device_constants.dart';
import 'package:may_uikit/resources/dimens.dart';

/// Helper for reading responsive dimensions from the current [BuildContext].
class AppDimenV2 {
  AppDimenV2._({
    required this.media,
    required this.screenType,
  });

  static late AppDimenV2 current;

  final MediaQueryData media;
  final ScreenTypeV2 screenType;

  /// Returns the current dimension helper for [context].
  static AppDimenV2 of(BuildContext context) {
    final media = MediaQuery.of(context);

    final dimen = AppDimenV2._(
      media: media,
      screenType: _getScreenType(media.size.width),
    );

    current = dimen;
    return dimen;
  }

  double get screenWidth => media.size.width;

  double get screenHeight => media.size.height;

  double get devicePixelRatio => media.devicePixelRatio;

  double get paddingTop => media.padding.top;

  double get paddingBottom => media.padding.bottom;

  double get paddingLeft => media.padding.left;

  double get paddingRight => media.padding.right;

  double get keyboardHeight => media.viewInsets.bottom;

  double get glassBottomBarHeight => DimensV2.d100;

  double get bottomSafeWithGlassBar => paddingBottom + glassBottomBarHeight;

  /// Top offset for body content when [CommonAppBarV2] is used with
  /// `extendBodyBehindAppBar: true` (default). Use this as `top` padding
  /// inside scroll views so content starts right below the app bar.
  double get appBarContentTop => paddingTop + kToolbarHeight;

  bool get isKeyboardVisible => keyboardHeight > 0;

  Size get screenSize => media.size;

  double responsiveDimens({
    required double mobile,
    double? tablet,
    double? ultraTablet,
  }) {
    switch (screenType) {
      case ScreenTypeV2.mobile:
        return mobile.w;
      case ScreenTypeV2.tablet:
        return (tablet ?? mobile).w;
      case ScreenTypeV2.ultraTablet:
        return (ultraTablet ?? tablet ?? mobile).w;
    }
  }

  double responsiveValue({
    required double mobile,
    double? tablet,
    double? ultraTablet,
  }) {
    switch (screenType) {
      case ScreenTypeV2.mobile:
        return mobile;
      case ScreenTypeV2.tablet:
        return tablet ?? mobile;
      case ScreenTypeV2.ultraTablet:
        return ultraTablet ?? tablet ?? mobile;
    }
  }

  static ScreenTypeV2 _getScreenType(double width) {
    if (width <= DeviceConstantsV2.maxMobileWidth) {
      return ScreenTypeV2.mobile;
    } else if (width <= DeviceConstantsV2.maxTabletWidth) {
      return ScreenTypeV2.tablet;
    } else {
      return ScreenTypeV2.ultraTablet;
    }
  }
}

/// Adds responsive helpers to primitive double values.
extension ResponsiveDoubleExtension on double {
  double responsive({
    double? tablet,
    double? ultraTablet,
  }) {
    return AppDimenV2.current.responsiveDimens(
      mobile: this,
      tablet: tablet,
      ultraTablet: ultraTablet,
    );
  }
}

/// Screen size buckets used by [AppDimenV2].
enum ScreenTypeV2 {
  mobile,
  tablet,
  ultraTablet,
}

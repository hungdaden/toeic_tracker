import 'package:flutter/material.dart';

/// Device-wide constants used by responsive layout helpers.
class DeviceConstantsV2 {
  const DeviceConstantsV2._();

  static const designDeviceWidth = 375.0;
  static const designDeviceHeight = 667.0;

  static const maxMobileWidth = 450;
  static const maxTabletWidth = 900;

  static const maxMobileWidthForDeviceType = 550;

  static double statusBarHeight =
      WidgetsBinding.instance.platformDispatcher.views.first.viewInsets.top;
  static double devicePixelRatio =
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
  static const textScaleFactor = 1.0;
}

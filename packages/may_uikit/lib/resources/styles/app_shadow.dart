import 'package:flutter/material.dart';

/// Shared shadow helpers used by UIKit components.
class AppShadowsV2 {
  AppShadowsV2._();

  /// Returns the default shadow treatment tinted with [color].
  static List<BoxShadow> defaultShadow(Color color) {
    return [
      BoxShadow(
        color: color,
        blurRadius: 0,
        offset: const Offset(0, 4),
      ),
    ];
  }
}

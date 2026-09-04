import 'package:flutter/services.dart';

/// Utility class for triggering haptic feedback.
class HapticUtil {
  const HapticUtil._();

  /// Triggers light haptic feedback.
  static Future<void> lightImpact() => HapticFeedback.lightImpact();

  /// Triggers medium haptic feedback.
  static Future<void> mediumImpact() => HapticFeedback.mediumImpact();

  /// Triggers heavy haptic feedback.
  static Future<void> heavyImpact() => HapticFeedback.heavyImpact();

  /// Triggers selection click haptic feedback.
  static Future<void> selectionClick() => HapticFeedback.selectionClick();

  /// Triggers default device vibration.
  static Future<void> vibrate() => HapticFeedback.vibrate();
}

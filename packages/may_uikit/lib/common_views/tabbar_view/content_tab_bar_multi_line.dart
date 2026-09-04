import 'dart:ui';

/// Content model for a multi-line tab item.
class ContentTabBarMultiLine {
  final String title;
  final String? subtitle;
  final int? badgeCount;
  final int? count;
  final bool isToday;
  final Color? todayBgColor;
  final Color? todayBorderColor;

  const ContentTabBarMultiLine({
    required this.title,
    this.subtitle = '',
    this.badgeCount,
    this.count,
    this.isToday = false,
    this.todayBgColor,
    this.todayBorderColor,
  });
}

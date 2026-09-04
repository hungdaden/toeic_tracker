import 'package:flutter/material.dart';

import '../../../may_uikit.dart';

/// Content row model used by [CardListItemV2] dynamic layouts.
class CardDataV2 {
  final String label;
  final String content;
  final Widget? customContent;
  final bool isCustomContent;
  final String? iconSvgPath;
  final String? iconUrl;
  final AppBadgeStatus? badgeStatus;
  final bool isBadge;
  final bool isFullRow;

  const CardDataV2({
    this.label = '',
    this.content = '',
    this.customContent,
    this.isCustomContent = false,
    this.iconSvgPath,
    this.iconUrl,
    this.badgeStatus,
    this.isBadge = false,
    this.isFullRow = false,
  });
}

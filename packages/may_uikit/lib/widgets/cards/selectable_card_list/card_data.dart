import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit_internal.dart';

import '../../../resources/generated/assets.gen.dart';

/// Status types used for custom card contents.
enum ContentStatus {
  none(value: 'NONE'),
  info(value: 'INFO'),
  success(value: 'SUCCESS'),
  warning(value: 'WARNING'),
  attention(value: 'ATTENTION'),
  critical(value: 'CRITICAL');

  const ContentStatus({this.value = ''});

  final String value;
}

/// Data structure representing metadata and configuration for a card item.
class CardData {
  final String label;
  final String content;
  final String? contentColor;
  final Color? color;
  final bool? isImage;
  final bool? isJustify;
  final String? status;
  final bool? isBold;
  final bool? isBreakLine;
  final bool? shouldBreakContent;
  final bool isHelpLink;
  final bool isBadge;
  final Widget? customContent;
  final bool isCustomContent;
  final bool isShowDivider;
  final VoidCallback? onActionTap;
  final CardActionType actionType;
  final AppBadgeV2? rowBadge;

  CardData({
    this.label = '',
    this.content = '',
    this.isBadge = false,
    this.isHelpLink = false,
    this.isJustify = false,
    this.contentColor,
    this.color,
    this.isImage,
    this.status = '',
    this.isBold = false,
    this.isBreakLine,
    this.actionType = CardActionType.none,
    this.onActionTap,
    this.shouldBreakContent = false,
    this.customContent,
    this.isCustomContent = false,
    this.isShowDivider = false,
    this.rowBadge,
  });
}

/// Supported action types triggered by interacting with a card.
enum CardActionType {
  none,
  call;

  ///nhận isPhone = true

  String? get iconPath {
    switch (this) {
      case CardActionType.call:
        return Assets.icons.icPin.path;
      default:
        return null;
    }
  }
}

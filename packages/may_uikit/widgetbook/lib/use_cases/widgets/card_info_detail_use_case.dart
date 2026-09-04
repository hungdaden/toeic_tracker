import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Mock implementation of [CardInfoEntityV2] for Widgetbook.
class MockCardInfoDetailEntity implements CardInfoEntityV2<MockCardInfoDetailRow> {
  const MockCardInfoDetailEntity({
    this.title,
    this.subTitle,
    this.content,
    this.imageUrl,
    this.isNext,
    this.details,
    this.badge,
    this.bottomInfo,
    this.avatarName,
    this.avatarUrl,
    this.hasAvatar,
    this.showDivider,
  });

  @override
  final String? title;
  @override
  final String? subTitle;
  @override
  final String? content;
  @override
  final String? imageUrl;
  @override
  final bool? isNext;
  @override
  final List<MockCardInfoDetailRow>? details;
  @override
  final CardInfoBadgeEntityV2? badge;
  @override
  final CardInfoBottomInfoEntityV2? bottomInfo;
  @override
  final String? avatarName;
  @override
  final String? avatarUrl;
  @override
  final bool? hasAvatar;
  @override
  final bool? showDivider;
}

/// Mock implementation of [CardInfoDetailEntityV2] for Widgetbook.
class MockCardInfoDetailRow implements CardInfoDetailEntityV2 {
  const MockCardInfoDetailRow({
    this.title,
    this.content,
    this.showDivider,
    this.isBreakLine,
    this.isJustify,
    this.badgeType,
    this.isActionItem,
    this.icon,
    this.imageUrl,
    this.badge,
  });

  @override
  final String? title;
  @override
  final String? content;
  @override
  final bool? showDivider;
  @override
  final bool? isBreakLine;
  @override
  final bool? isJustify;
  @override
  final String? badgeType;
  @override
  final bool? isActionItem;
  @override
  final List<CardInfoDetailIconEntityV2>? icon;
  @override
  final String? imageUrl;
  @override
  final CardInfoBadgeEntityV2? badge;
}

/// Interactive playground for [CardInfoDetailV2].
@UseCase(name: 'Playground', type: CardInfoDetailV2)
Widget cardInfoDetailUseCase(BuildContext context) {
  final colors = context.mayColors;

  final title = context.knobs.string(
    label: 'Title',
    initialValue:
        "HS sử dụng các thiết bị điện tử sai giờ quy định hoặc vì những mục đích không phù hợp",
  );

  final subtitle = context.knobs.string(
    label: 'Subtitle',
    initialValue: "T4, 20/05/2026 10:59 - Tiết: Vật lý",
  );

  final r1i1Label = context.knobs.string(label: 'Item 1 Label', initialValue: "");
  final r1i1Value = context.knobs.string(label: 'Item 1 Value', initialValue: "-7 điểm");
  final hasBadge = context.knobs.boolean(label: 'Show Badge on Item 1', initialValue: true);
  final badgeType = context.knobs.string(
    label: 'Item 1 Badge Type Code (CRITICAL, SUCCESS, etc)',
    initialValue: 'CRITICAL',
  );

  final r1i2Label = context.knobs.string(label: 'Item 2 Label', initialValue: "Số lần vi phạm");
  final r1i2Value = context.knobs.string(label: 'Item 2 Value', initialValue: "Vi phạm lần 1");

  final r1i3Label =
      context.knobs.string(label: 'Item 3 Label', initialValue: "Giáo viên chấm điểm");
  final r1i3Value = context.knobs.string(label: 'Item 3 Value', initialValue: "Hoàng Thị Hường");

  final r1i4Label = context.knobs.string(label: 'Item 4 Label', initialValue: "Ghi chú");
  final r1i4Value = context.knobs.string(label: 'Item 4 Value', initialValue: "lôm côm");

  final isShowArrow = context.knobs.boolean(label: 'Show Arrow (isNext)', initialValue: false);

  final mockEntity = MockCardInfoDetailEntity(
    title: title,
    subTitle: subtitle,
    isNext: isShowArrow,
    details: [
      MockCardInfoDetailRow(
        title: r1i1Label,
        content: r1i1Value,
        isBreakLine: true,
        badgeType: hasBadge ? badgeType : null,
      ),
      MockCardInfoDetailRow(
        title: r1i2Label,
        content: r1i2Value,
        isBreakLine: true,
      ),
      MockCardInfoDetailRow(
        title: r1i3Label,
        content: r1i3Value,
        isBreakLine: false,
      ),
      MockCardInfoDetailRow(
        title: r1i4Label,
        content: r1i4Value,
        isBreakLine: true,
      ),
    ],
  );

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.md),
        child: SizedBox(
          width: 359,
          child: CardInfoDetailV2(
            entity: mockEntity,
          ),
        ),
      ),
    ),
  );
}

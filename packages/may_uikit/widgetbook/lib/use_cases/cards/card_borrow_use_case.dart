import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

// Mock implementations of CardInfoEntityV2 interfaces for the Widgetbook

/// Mock implementation of [CardInfoBadgeEntityV2] for Widgetbook.
class MockCardInfoBadge implements CardInfoBadgeEntityV2 {
  const MockCardInfoBadge({this.title, this.content, this.badgeType});
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? badgeType;
}

/// Mock implementation of [CardInfoBottomInfoEntityV2] for Widgetbook.
class MockCardInfoBottomInfo implements CardInfoBottomInfoEntityV2 {
  const MockCardInfoBottomInfo({
    this.title,
    this.subTitle,
    this.avatarUrl,
    this.isContact,
    this.showDivider,
    this.icon,
  });
  @override
  final String? title;
  @override
  final String? subTitle;
  @override
  final String? avatarUrl;
  @override
  final bool? isContact;
  @override
  final bool? showDivider;
  @override
  final List<CardInfoDetailIconEntityV2>? icon;
}

/// Mock implementation of [CardInfoDetailIconEntityV2] for Widgetbook.
class MockCardInfoDetailIcon implements CardInfoDetailIconEntityV2 {
  const MockCardInfoDetailIcon({this.url, this.action});
  @override
  final String? url;
  @override
  final String? action;
}

/// Mock implementation of [CardInfoDetailEntityV2] for Widgetbook.
class MockCardInfoDetail implements CardInfoDetailEntityV2 {
  const MockCardInfoDetail({
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

/// Mock implementation of [CardInfoEntityV2] for Widgetbook.
class MockCardInfo implements CardInfoEntityV2<CardInfoDetailEntityV2> {
  const MockCardInfo({
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
  final List<CardInfoDetailEntityV2>? details;
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

@UseCase(
  name: 'Playground',
  type: CardBorrow,
)

/// A Widgetbook use case wrapper for [CardBorrow] utilizing the [context].
Widget cardBorrowUseCase(BuildContext context) {
  final colors = context.mayColors;

  final title = context.knobs.string(label: 'Card Title', initialValue: 'Phiếu mượn #05');
  final subTitle = context.knobs.string(label: 'Subtitle', initialValue: 'T5, 16/07/2026 08:00');

  final badgeLabel =
      context.knobs.string(label: 'Badge Label', initialValue: 'Đã duyệt - Chờ lấy sách');
  final badgeType = context.knobs.string(label: 'Badge Type Code', initialValue: 'SUCCESS');

  final avatarName = context.knobs.string(label: 'Avatar Name', initialValue: 'Lê Anh Tuấn');
  final avatarUrl = context.knobs.string(
    label: 'Avatar URL',
    initialValue: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150',
  );

  final detail1Title = context.knobs.string(
    label: 'Book 1 Title',
    initialValue: 'Kỹ Năng Toàn Diện Dành Cho Học Sinh Tiểu Học - Ngoài Đường',
  );
  final detail1IconUrl = context.knobs.string(
    label: 'Book 1 Icon URL',
    initialValue: 'https://encrypted-tbn0.gstatic.com/images?'
        'q=tbn:ANd9GcT3R4pE0xP89V_79r-K6B00c6dJ5J1J5J1J5J1J5J1J5&s',
  );

  final detail2Title = context.knobs.string(
    label: 'Book 2 Title',
    initialValue: 'Kỹ Năng Toàn Diện Dành Cho Học Sinh Tiểu Học - Trong Nhà',
  );
  final detail2IconUrl = context.knobs.string(
    label: 'Book 2 Icon URL',
    initialValue: 'https://encrypted-tbn0.gstatic.com/images?'
        'q=tbn:ANd9GcR_xN8J9R_xN8J9R_xN8J9R_xN8J9R_xN8J9R_xN&s',
  );

  final isShowArrow = context.knobs.boolean(label: 'Show Arrow', initialValue: true);

  final mockEntity = MockCardInfo(
    title: title,
    subTitle: subTitle,
    badge: MockCardInfoBadge(content: badgeLabel, badgeType: badgeType),
    bottomInfo: MockCardInfoBottomInfo(title: avatarName, avatarUrl: avatarUrl),
    details: [
      MockCardInfoDetail(
        title: detail1Title,
        icon: [
          MockCardInfoDetailIcon(url: detail1IconUrl),
        ],
      ),
      MockCardInfoDetail(
        title: detail2Title,
        icon: [
          MockCardInfoDetailIcon(url: detail2IconUrl),
        ],
      ),
    ],
  );

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.lg),
        child: SizedBox(
          width: 350,
          child: CardBorrow(
            entity: mockEntity,
            isShowArrow: isShowArrow,
            onTap: () {},
          ),
        ),
      ),
    ),
  );
}

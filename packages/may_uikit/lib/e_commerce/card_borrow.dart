import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

import '../resources/generated/assets.gen.dart';

/// Displays general card headers, a list of detail items with book thumbnails,
/// an optional status badge, requester/borrower information, and a trailing arrow action.
/// Uses [CardInfoEntityV2] as the input data entity.
class CardBorrow extends StatelessWidget {
  const CardBorrow({
    super.key,
    required this.entity,
    this.onTap,
    this.isShowArrow = true,
  });

  /// The entity containing all card information.
  final CardInfoEntityV2<CardInfoDetailEntityV2> entity;

  /// Optional tap callback for the card.
  final VoidCallback? onTap;

  /// Whether to render the circular action arrow button on the right, default is true.
  final bool isShowArrow;

  /// Builds the widget tree for [CardBorrow] using the provided [context].
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    final title = entity.title ?? '';
    final subTitle = entity.subTitle ?? entity.content ?? '';
    final details = entity.details ?? const [];
    final badgeLabel = entity.badge?.content ?? entity.badge?.title ?? '';
    final badgeStatus = AppBadgeStatus.fromCode(entity.badge?.badgeType);
    final avatarName = entity.avatarName ?? '';
    final avatarUrl = entity.avatarUrl ?? '';

    return CardV2(
      onTap: onTap,
      borderRadius: AppRadiusV2.x3l, // 28px
      margin: EdgeInsets.only(bottom: AppSpacingV2.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header (Title & Subtitle)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title.isNotEmpty)
                      Text(
                        title,
                        style: AppTextStylesV2.text16Semibold.copyWith(
                          color: colors.txContentPrimaryDefault,
                        ),
                      ),
                    if (subTitle.isNotEmpty) ...[
                      const SizedBox(height: DimensV2.d4),
                      Text(
                        subTitle,
                        style: AppTextStylesV2.text13Medium.copyWith(
                          color: colors.txContentSecondaryDefault,
                        ),
                      ),
                    ],
                  ],
                ),
                if (details.isNotEmpty) ...[
                  const SizedBox(height: DimensV2.d12),
                  // List of detail items (e.g. books)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < details.length; i++) ...[
                        if (i > 0) const SizedBox(height: DimensV2.d12),
                        _buildDetailItem(context, details[i]),
                      ],
                    ],
                  ),
                ],
                // Badge
                if (badgeLabel.isNotEmpty && badgeStatus != AppBadgeStatus.undefined) ...[
                  const SizedBox(height: DimensV2.d12),
                  AppBadgeV2(
                    status: badgeStatus,
                    label: badgeLabel,
                  ),
                ],
                // Requester (Avatar + Name)
                if (avatarName.isNotEmpty) ...[
                  const SizedBox(height: DimensV2.d12),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonAvatarV2(
                        imageUrl: avatarUrl,
                        radius: DimensV2.d24,
                      ),
                      const SizedBox(width: DimensV2.d8),
                      Expanded(
                        child: Text(
                          avatarName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStylesV2.text13Medium.copyWith(
                            color: colors.txContentSecondaryDefault,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          if (isShowArrow) ...[
            const SizedBox(width: DimensV2.d12),
            Container(
              width: DimensV2.d28,
              height: DimensV2.d28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.bgIcon,
              ),
              child: Center(
                child: AdaptiveImageV2(
                  url: Assets.icons.icArrowRight.keyName,
                  width: DimensV2.d12,
                  height: DimensV2.d12,
                  tintColor: colors.icColor,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailItem(BuildContext context, CardInfoDetailEntityV2 item) {
    final colors = context.mayColors;
    final itemTitle = item.title ?? '';
    final iconUrl = item.imageUrl ?? '';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: DimensV2.d46,
          height: DimensV2.d61,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DimensV2.d12),
            border: Border.all(
              color: AppColorsV2.neutral200,
              width: DimensV2.d_05,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(DimensV2.d12),
            child: iconUrl.isNotEmpty
                ? AdaptiveImageV2(
                    url: iconUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error) => Container(
                      color: AppColorsV2.neutral100,
                      child: Center(
                        child: AdaptiveImageV2(
                          url: Assets.icons.emptyProduct.keyName,
                          width: DimensV2.d20,
                          height: DimensV2.d20,
                        ),
                      ),
                    ),
                  )
                : Container(
                    color: AppColorsV2.neutral100,
                    child: Center(
                        child: AdaptiveImageV2(
                      url: Assets.icons.emptyProduct.keyName,
                      width: DimensV2.d20,
                      height: DimensV2.d20,
                    )),
                  ),
          ),
        ),
        const SizedBox(width: DimensV2.d12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStylesV2.text14Medium.copyWith(
                  color: colors.txContentPrimaryDefault,
                ),
              ),
              const SizedBox(height: DimensV2.d4),
              Text(
                item.content ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStylesV2.text14Medium.copyWith(
                  color: colors.txContentSecondaryDefault,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

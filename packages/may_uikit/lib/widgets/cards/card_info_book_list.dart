import 'package:flutter/material.dart';

import '../../may_uikit.dart';
import '../../resources/generated/assets.gen.dart';

/// A card-info variant that displays a list of books below its header.
class CardInfoBookListV2 extends StatelessWidget {
  const CardInfoBookListV2({
    super.key,
    required this.entity,
    this.onTap,
  });

  /// The card header and book details.
  final CardInfoEntityV2<CardInfoDetailEntityV2> entity;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  /// Builds the book list card using the current [context].
  @override
  Widget build(BuildContext context) {
    final details = entity.details ?? const <CardInfoDetailEntityV2>[];

    return CardV2(
      title: entity.title,
      icon: entity.imageUrl,
      onTap: onTap,
      borderRadius: AppRadiusV2.x3l,
      margin: const EdgeInsets.only(
        bottom: AppSpacingV2.md,
        left: AppSpacingV2.screenHorizontal,
        right: AppSpacingV2.screenHorizontal,
      ),
      padding: const EdgeInsets.all(AppSpacingV2.cardLg),
      child: details.isEmpty ? null : _buildDetails(context, details),
    );
  }

  Widget _buildDetails(
    BuildContext context,
    List<CardInfoDetailEntityV2> details,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int index = 0; index < details.length; index++) ...[
          _buildDetail(context, details[index]),
          if (details[index].showDivider == true) ...[
            const SizedBox(height: AppSpacingV2.sm),
            const CommonDividerV2(),
          ],
          if (index < details.length - 1) const SizedBox(height: AppSpacingV2.sm),
        ],
      ],
    );
  }

  Widget _buildDetail(BuildContext context, CardInfoDetailEntityV2 detail) {
    final content = detail.content ?? '';
    final hasBadge = detail.badge?.badgeType?.trim().isNotEmpty == true;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: hasBadge ? DimensV2.d80 : DimensV2.d53,
          height: hasBadge ? DimensV2.d106 : DimensV2.d70,
          child: _buildBookImage(context, detail.imageUrl),
        ),
        const SizedBox(width: AppSpacingV2.sm),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                detail.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStylesV2.text14Semibold.copyWith(
                  color: context.mayColors.txContentPrimaryDefault,
                ),
              ),
              if (content.isNotEmpty) ...[
                const SizedBox(height: AppSpacingV2.x2s),
                Text(
                  content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStylesV2.text14Medium.copyWith(
                    color: context.mayColors.txContentSecondaryDefault,
                  ),
                ),
              ],
              if (hasBadge) ...[
                const SizedBox(height: AppSpacingV2.xs),
                AppBadgeV2(
                  status: AppBadgeStatus.fromCode(detail.badge?.badgeType),
                  label: detail.badge?.title ?? '--',
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBookImage(BuildContext context, String? imageUrl) {
    /// Builds the fallback shown when [imageUrl] is unavailable.
    Widget fallback() => Container(
          color: AppColorsV2.neutral100,
          alignment: Alignment.center,
          child: AdaptiveImageV2(
            url: Assets.icons.emptyProduct.keyName,
            width: DimensV2.d20,
            height: DimensV2.d20,
          ),
        );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadiusV2.md),
      ),
      foregroundDecoration: BoxDecoration(
        border: Border.all(
          color: context.mayColors.bdDefault,
          width: DimensV2.d_05,
        ),
        borderRadius: BorderRadius.circular(AppRadiusV2.md),
      ),
      clipBehavior: Clip.antiAlias,
      child: imageUrl?.trim().isNotEmpty == true
          ? AdaptiveImageV2(
              url: imageUrl!,
              fit: BoxFit.cover,
              errorBuilder: (_, __) => fallback(),
            )
          : fallback(),
    );
  }
}

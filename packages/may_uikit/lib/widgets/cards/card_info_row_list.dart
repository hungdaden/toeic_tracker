import 'package:flutter/material.dart';

import '../../may_uikit.dart';

/// A list layout component that renders multiple registration info rows inside a [CardV2].
class CardInfoRowListV2 extends StatelessWidget {
  /// Creates a [CardInfoRowListV2] with the given [rows] and [itemSpacing].
  const CardInfoRowListV2({
    super.key,
    required this.rows,
    this.itemSpacing = AppSpacingV2.sm,
  });

  /// The list of registration info rows to display.
  final List<CardInfoGroupData> rows;

  /// The spacing between items within a row.
  final double itemSpacing;

  @override

  /// Builds the vertical list containing multiple info rows.
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    final listContent = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < rows.length; i++) ...[
          if (i > 0)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacingV2.sm),
              child: CommonDividerV2(),
            ),
          _buildRowContent(context, rows[i], colors),
        ],
      ],
    );

    return CardV2(
      padding: const EdgeInsets.all(DimensV2.d20),
      borderRadius: AppRadiusV2.x3l,
      child: listContent,
    );
  }

  Widget _buildRowContent(
    BuildContext context,
    CardInfoGroupData row,
    MayThemeColorsV2 colors,
  ) {
    final hasHeader = row.avatar != null || row.title != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasHeader) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: DimensV2.d40,
                height: DimensV2.d40,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.primaryButton.withValues(alpha: 0.1),
                ),
                child: Center(
                  child: CommonAvatarV2(
                    imageUrl: row.avatar ?? '',
                    radius: DimensV2.d40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: DimensV2.d6),
              if (row.title != null)
                Expanded(
                  child: Text(
                    row.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStylesV2.text15Semibold.copyWith(
                      color: colors.txContentPrimaryDefault,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppSpacingV2.sm),
        ],
        Builder(
          builder: (context) {
            final chunks = <List<CardInfoEntry>>[];
            for (var i = 0; i < row.items.length; i += 2) {
              chunks.add(
                row.items.sublist(
                  i,
                  i + 2 > row.items.length ? row.items.length : i + 2,
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var i = 0; i < chunks.length; i++) ...[
                  if (i > 0) const SizedBox(height: AppSpacingV2.sm),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildItem(chunks[i][0], colors)),
                      SizedBox(width: itemSpacing),
                      Expanded(
                        child: chunks[i].length > 1
                            ? _buildItem(chunks[i][1], colors)
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildItem(CardInfoEntry item, MayThemeColorsV2 colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          item.label,
          style: AppTextStylesV2.text13Medium.copyWith(
            color: colors.txContentSecondaryDefault,
          ),
        ),
        const SizedBox(height: DimensV2.d8),
        if (item.badge != null)
          AppBadgeV2(
            status: item.badge!.status,
            label: item.badge!.label,
            showIcon: item.badge!.showIcon,
          )
        else
          CommonSelectableTextV2(
            item.value,
            style: (item.isBold ? AppTextStylesV2.text16Semibold : AppTextStylesV2.labelSemiBold)
                .copyWith(
              color: colors.txContentPrimaryDefault,
            ),
          ),
      ],
    );
  }
}

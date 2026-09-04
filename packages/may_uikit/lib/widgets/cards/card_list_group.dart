import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:may_uikit/may_uikit.dart';
import '../../resources/generated/assets.gen.dart';

/// Data class representing an item inside [CardListGroupV2].
class CardListGroupItemData {
  const CardListGroupItemData({
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  /// The title text, e.g. "Tháng 12/2025".
  final String title;

  /// The subtitle text, e.g. "Điểm TB tháng: 100 - Rèn luyện: Tốt".
  final String subtitle;

  /// Tap callback when this list item is clicked.
  final VoidCallback? onTap;
}

/// A card enclosing a list of items, each separated by a divider,
/// and featuring a right arrow button.
class CardListGroupV2 extends StatelessWidget {
  const CardListGroupV2({
    super.key,
    required this.items,
    this.padding = const EdgeInsets.all(AppSpacingV2.cardLg),
    this.borderRadius = AppRadiusV2.x3l,
  });

  /// List of items to display.
  final List<CardListGroupItemData> items;

  /// Padding of the enclosing card container.
  final EdgeInsetsGeometry padding;

  /// Border radius of the enclosing card container.
  final double borderRadius;

  @override

  /// Builds the card widget containing the list group items.
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return PressableCardContainerV2(
      borderRadius: borderRadius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < items.length; i++) ...[
            if (i > 0) CommonDividerV2(),
            GestureContainerV2(
              padding: const EdgeInsets.symmetric(
                  vertical: AppSpacingV2.md, horizontal: AppSpacingV2.lg),
              onTap: items[i].onTap,
              child: _buildItemRow(context, items[i], colors),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildItemRow(
    BuildContext context,
    CardListGroupItemData item,
    MayThemeColorsV2 colors,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (item.title.trim().isNotEmpty)
                Text(
                  item.title,
                  style: AppTextStylesV2.text16Semibold.copyWith(
                    color: colors.txContentPrimaryDefault,
                  ),
                ),
              if (item.subtitle.trim().isNotEmpty) ...[
                const SizedBox(height: AppSpacingV2.x2s),
                Text(
                  item.subtitle,
                  style: AppTextStylesV2.text14Medium.copyWith(
                    color: colors.txContentPrimaryDefault,
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(width: AppSpacingV2.md),
        Container(
          width: DimensV2.d28,
          height: DimensV2.d28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors.bgIcon,
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.icons.icArrowRight.keyName,
              width: DimensV2.d12,
              height: DimensV2.d12,
              colorFilter: ColorFilter.mode(
                colors.icColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

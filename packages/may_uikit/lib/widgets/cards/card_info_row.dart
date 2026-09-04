import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../may_uikit.dart';

/// Represents an action that can be executed from a card info row.
class CardInfoAction {
  /// Creates a [CardInfoAction] with the given icon [url] and [action] type.
  const CardInfoAction({
    required this.url,
    required this.action,
  });

  /// The SVG icon URL for the action button.
  final String url;

  /// The type of action to execute.
  final CardInfoActionType action;
}

/// Represents an entry with label, value, and optional style configurations.
class CardInfoEntry {
  /// Creates a [CardInfoEntry] with the given [label] and [value].
  const CardInfoEntry({
    required this.label,
    required this.value,
    this.isBold = false,
    this.badge,
    this.isCopy = false,
    this.iconUrl,
    this.onCopyTap,
    this.isActionItem = false,
    this.showDivider = false,
    this.iconPhone,
    this.iconChat,
    this.actions,
    this.isFullRow = false,
    this.isJustify = false,
    this.imageUrl,
  });

  /// The label text of this entry.
  final String label;

  /// The value text of this entry.
  final String value;

  /// Whether the value should be rendered in a bold style.
  final bool isBold;

  /// Optional badge data to display instead of the value text.
  final CardInfoBadgeData? badge;

  /// Whether a copy button should be displayed.
  final bool isCopy;

  /// Optional custom icon URL for copy button.
  final String? iconUrl;

  /// Callback when copy button is tapped.
  final VoidCallback? onCopyTap;

  /// Whether this item represents a contact block.
  final bool isActionItem;

  /// Whether to show the divider before contact block.
  final bool showDivider;

  /// Phone icon URL for contact block.
  final String? iconPhone;

  /// Chat icon URL for contact block.
  final String? iconChat;

  /// List of custom actions for this entry.
  final List<CardInfoAction>? actions;

  /// Whether the entry should occupy the full width of the row.
  final bool isFullRow;

  /// Whether text content should be aligned justify.
  final bool isJustify;

  /// Optional image URL to display as a circular avatar next to the content value.
  final String? imageUrl;
}

/// A horizontal row layout displaying multiple [CardInfoEntry] elements.
class CardInfoRowV2 extends StatelessWidget {
  /// Creates a [CardInfoRowV2] with the given [items] and [itemSpacing].
  const CardInfoRowV2({
    super.key,
    required this.items,
    required this.itemSpacing,
    this.isSingleItem = false,
  });

  /// The list of info entries to display in the row.
  final List<CardInfoEntry> items;

  /// The horizontal spacing between the items.
  final double itemSpacing;

  /// Whether this row contains the only item in the CardInfo block.
  final bool isSingleItem;

  bool _isPhoneNumber(String value) {
    final clean = value.replaceAll(RegExp(r'[\s\+\-\(\)]'), '');
    return clean.isNotEmpty && clean.length >= 8 && int.tryParse(clean) != null;
  }

  /// Builds the horizontal row layout.
  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    final leading = items[0];

    if (leading.isFullRow) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildCell(context, leading)),
        ],
      );
    } else {
      final trailing = items.length > 1 ? items[1] : null;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildCell(context, leading)),
          SizedBox(width: itemSpacing),
          Expanded(
            child: trailing != null ? _buildCell(context, trailing) : const SizedBox.shrink(),
          ),
        ],
      );
    }
  }

  Widget _buildCell(BuildContext context, CardInfoEntry item) {
    final colors = context.mayColors;
    final bool canTapText = item.isCopy && _isPhoneNumber(item.value);
    final Widget valueWidget = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: CommonSelectableTextV2(
            item.value,
            textAlign: item.isJustify ? TextAlign.justify : TextAlign.start,
            style: (item.isBold ? AppTextStylesV2.text16Semibold : AppTextStylesV2.labelSemiBold)
                .copyWith(
              color: colors.txContentPrimaryDefault,
            ),
          ),
        ),
        if (item.isCopy && item.iconUrl != null && item.iconUrl!.isNotEmpty) ...[
          const SizedBox(width: DimensV2.d6),
          if (canTapText)
            SvgPicture.network(
              (item.iconUrl != null && item.iconUrl!.isNotEmpty) ? item.iconUrl! : '',
              width: DimensV2.d16,
              height: DimensV2.d16,
              colorFilter: ColorFilter.mode(
                colors.tertiaryText,
                BlendMode.srcIn,
              ),
            )
          else
            GestureDetector(
              onTap: item.onCopyTap,
              child: Padding(
                padding: const EdgeInsets.only(right: DimensV2.d8),
                child: SvgPicture.network(
                  (item.iconUrl != null && item.iconUrl!.isNotEmpty) ? item.iconUrl! : '',
                  width: DimensV2.d16,
                  height: DimensV2.d16,
                  colorFilter: ColorFilter.mode(
                    colors.tertiaryText,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
        ],
      ],
    );

    final Widget finalValueWidget = canTapText
        ? GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: item.onCopyTap,
            child: SizedBox(
              width: double.infinity,
              child: valueWidget,
            ),
          )
        : valueWidget;

    final bool hasContent = item.value.trim().isNotEmpty ||
        item.badge != null ||
        (item.imageUrl != null && item.imageUrl!.isNotEmpty) ||
        (item.actions != null && item.actions!.isNotEmpty);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (item.label.trim().isNotEmpty)
          Text(
            item.label,
            style: (isSingleItem && !hasContent)
                ? AppTextStylesV2.text14Medium.copyWith(
                    color: colors.txContentSecondaryDefault,
                  )
                : AppTextStylesV2.text13Medium.copyWith(
                    color: colors.txContentSecondaryDefault,
                  ),
          ),
        if (hasContent) ...[
          const SizedBox(height: DimensV2.d2),
        ],
        if (item.badge != null)
          AppBadgeV2(
            status: item.badge!.status,
            label: item.badge!.label,
            showIcon: item.badge!.showIcon,
          )
        else if (item.imageUrl != null && item.imageUrl!.isNotEmpty)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: DimensV2.d34,
                height: DimensV2.d34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColorsV2.neutral100,
                    width: 1.067,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: AdaptiveImageV2(
                  url: item.imageUrl ?? '',
                  fit: BoxFit.cover,
                  enableCache: true,
                ),
              ),
              const SizedBox(width: AppSpacingV2.xs),
              Expanded(child: finalValueWidget),
            ],
          )
        else if (item.value.trim().isNotEmpty)
          finalValueWidget,
        if (item.showDivider) ...[
          const Padding(
            padding: EdgeInsets.only(top: DimensV2.d12, bottom: DimensV2.d4),
            child: CommonDividerV2(),
          ),
        ],
      ],
    );
  }
}

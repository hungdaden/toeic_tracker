import 'package:flutter/material.dart';

import '../../may_uikit.dart';
import '../../resources/generated/assets.gen.dart';

/// Per-item data for [RowPinItemV2] / [RowPinListV2] — bundles the label,
/// optional icon URL, and pinned flag.
class RowPinData {
  const RowPinData({
    required this.id,
    required this.label,
    this.iconUrl,
    this.isPinned = false,
    this.onTap,
    this.onTapPin,
  });

  /// Stable identifier shared with [DragAndDropItemData.id] for the same
  /// logical item. Used to correlate pin/close actions across the two lists.
  final String id;

  /// Main label (e.g. "Thời khóa biểu").
  final String label;

  /// Optional URL (svg/png) for the centered icon.
  final String? iconUrl;

  /// When true, renders a pin chip in the top-left corner.
  final bool isPinned;

  /// Tap on the card body.
  final VoidCallback? onTap;

  /// Tap on the pin chip. Ignored when [isPinned] is false.
  final VoidCallback? onTapPin;
}

/// Sectioned group of [RowPinData] rendered under a single [label] header
/// in [RowPinListV2].
class RowPinSection {
  const RowPinSection({
    required this.label,
    required this.items,
  });

  /// Header text (e.g. "Thông tin chung").
  final String label;

  /// Items rendered under this header.
  final List<RowPinData> items;
}

/// Grid of [RowPinItemV2] cards: 3 per row, equal width/height.
///
/// Renders [items] as a wrap of fixed-width tiles sized to fit 3 across the
/// available width with [spacing] between tiles. Items beyond the third wrap
/// onto the next row at the same size as the first row.
///
/// When [sections] is non-null, the list renders each section with a header
/// built from [RowPinSection.label] and the items beneath it. [items] is
/// ignored in that case.
class RowPinListV2 extends StatelessWidget {
  RowPinListV2({
    super.key,
    this.items = const [],
    this.sections,
    this.columns = 3,
    this.headerStyle,
  }) : assert(
          sections == null || items.isEmpty,
          'Provide either items or sections, not both',
        );

  /// Flat list of tabs (used when no [sections] are given).
  final List<RowPinData> items;

  /// Sectioned list. Takes precedence over [items] when provided.
  final List<RowPinSection>? sections;

  /// Number of items per row. Default 3.
  final int columns;

  /// Optional style for section header text. Defaults to
  /// `AppTextStyles.title3SemiBold`.
  final TextStyle? headerStyle;

  /// Lays out [items] in a wrap of fixed-width tiles sized to fit [columns]
  /// per row across the available width with [spacing] between tiles.
  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacingV2.xs;
    final runSpacing = AppSpacingV2.sm;
    final sectionList = sections;
    if (sectionList != null) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacingV2.screenHorizontal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < sectionList.length; i++) ...[
              if (i > 0) const SizedBox(height: AppSpacingV2.lg),
              _SectionHeader(
                label: sectionList[i].label,
                style: headerStyle,
              ),
              const SizedBox(height: AppSpacingV2.sm),
              LayoutBuilder(
                builder: (context, constraints) {
                  final tileWidth = (constraints.maxWidth - spacing * (columns - 1)) / columns;
                  return Wrap(
                    spacing: spacing,
                    runSpacing: runSpacing,
                    children: [
                      for (final item in sectionList[i].items)
                        SizedBox(
                          width: tileWidth,
                          child: RowPinItemV2(
                            label: item.label,
                            iconUrl: item.iconUrl,
                            isPinned: item.isPinned,
                            onTap: item.onTap,
                            onTapPin: item.onTapPin,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ],
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacingV2.screenHorizontal),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final tileWidth = (constraints.maxWidth - spacing * (columns - 1)) / columns;
          return Wrap(
            spacing: spacing,
            runSpacing: runSpacing,
            children: [
              for (final item in items)
                SizedBox(
                  width: tileWidth,
                  child: RowPinItemV2(
                    label: item.label,
                    iconUrl: item.iconUrl,
                    isPinned: item.isPinned,
                    onTap: item.onTap,
                    onTapPin: item.onTapPin,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.label, this.style});

  final String label;
  final TextStyle? style;

  /// Renders [label] with [style] (or the default title3SemiBold) using
  /// 2-line ellipsis truncation.
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: style ?? AppTextStylesV2.title3SemiBold.copyWith(
            color: context.mayColors.primaryText,
          ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// Square/vertical tab card matching the Figma "Item tab" surface.
///
/// Renders a centered leading icon above a label, with an optional pinned
/// chip in the top-left corner. Wraps `PressableCardContainerV2` for the
/// press-down + drop-shadow feedback.
class RowPinItemV2 extends StatelessWidget {
  const RowPinItemV2({
    super.key,
    required this.label,
    this.iconUrl,
    this.iconBackground,
    this.isPinned = true,
    this.pinIconUrl,
    this.onTap,
    this.onTapPin,
  });

  /// Main text under the icon (e.g. "Thứ 2").
  final String label;

  /// Optional URL (svg/png) for the centered icon.
  final String? iconUrl;

  /// Background tint for the icon container. Falls back to a warm peach tone
  /// matching the Figma spec when null.
  final Color? iconBackground;

  /// When true, renders a pin chip in the top-left corner.
  final bool isPinned;

  /// Optional override for the pin icon. Defaults to `Icons.push_pin`.
  final String? pinIconUrl;

  /// Tap on the card body.
  final VoidCallback? onTap;

  /// Tap on the pin chip. Ignored when [isPinned] is false.
  final VoidCallback? onTapPin;

  static const double _iconBoxSize = DimensV2.d48;
  static const double _pinBoxSize = DimensV2.d28;
  static const double _pinIconSize = DimensV2.d12;

  /// Builds the pressable card with a centered icon, label, and an
  /// optional pin/add chip in the top-right corner.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final iconBg = iconBackground ?? context.mayColors.bgIconTertiary;

    final card = PressableCardContainerV2(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacingV2.xs,
        vertical: AppSpacingV2.sm,
      ),
      borderRadius: AppRadiusV2.x3l,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _IconBox(
            url: iconUrl,
            size: _iconBoxSize,
            background: iconBg,
          ),
          const SizedBox(height: AppSpacingV2.xs),
          SizedBox(
            height: DimensV2.d40,
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStylesV2.text14Medium.copyWith(
                color: colors.txContentSecondaryDefault,
              ),
            ),
          ),
        ],
      ),
    );

    final showPinChip = isPinned;
    final addChip = !isPinned;

    if (!showPinChip && !addChip) return card;

    // Pin chip lives in an outer Stack so its negative offset isn't clipped
    // by the pressable container's anti-alias clipBehavior.
    return Stack(
      clipBehavior: Clip.none,
      children: [
        card,
        Positioned(
          top: -AppSpacingV2.xs,
          right: -AppSpacingV2.xs,
          child: _PinChip(
            isPinned: showPinChip,
            url: showPinChip ? Assets.icons.icPin.keyName : Assets.icons.icPlus.keyName,
            size: _pinBoxSize,
            iconSize: showPinChip ? _pinIconSize + 4 : _pinIconSize,
            background: showPinChip ? colors.bgIconTertiary : colors.bgIcon,
            iconColor: showPinChip ? AppColorsV2.neutral400 : colors.icColor,
            borderColor: showPinChip ? colors.bdDefault : colors.icColor,
            onTap: onTapPin,
          ),
        ),
      ],
    );
  }
}

class _IconBox extends StatelessWidget {
  const _IconBox({
    required this.url,
    required this.size,
    required this.background,
  });

  final String? url;
  final double size;
  final Color background;

  /// Renders the centered icon at [size], falling back to the tab icon
  /// when [url] is null or empty.
  @override
  Widget build(BuildContext context) {
    return AdaptiveImageV2(
      width: size,
      height: size,
      url: url ?? Assets.icons.iconTab.keyName,
    );
  }
}

class _PinChip extends StatelessWidget {
  const _PinChip({
    required this.isPinned,
    required this.url,
    required this.size,
    required this.iconSize,
    required this.background,
    required this.iconColor,
    this.borderColor,
    this.onTap,
  });

  final bool isPinned;
  final String? url;
  final double size;
  final double iconSize;
  final Color background;
  final Color iconColor;
  final Color? borderColor;
  final VoidCallback? onTap;

  /// Renders the circular pin/add chip with [iconColor] on [background],
  /// invoking [onTap] when tapped.
  @override
  Widget build(BuildContext context) {
    return GestureContainerV2(
      padding: EdgeInsets.all(AppSpacingV2.xs),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadiusV2.x3l),
      ),
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: background,
          shape: BoxShape.circle,
          border:
              borderColor != null ? Border.all(color: borderColor!, width: DimensV2.d_05) : null,
        ),
        child: url != null
            ? AdaptiveImageV2(
                url: url!,
                width: iconSize,
                height: iconSize,
                tintColor: iconColor,
              )
            : Icon(
                isPinned ? Icons.push_pin : Icons.add_rounded,
                size: iconSize,
                color: iconColor,
              ),
      ),
    );
  }
}

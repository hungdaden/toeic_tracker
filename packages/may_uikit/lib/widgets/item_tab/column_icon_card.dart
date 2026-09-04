import 'package:flutter/material.dart';

import '../../may_uikit.dart';

/// Per-item data for [ColumnIconCardV2] / [ColumnIconCardListV2].
class ColumnIconCardData {
  const ColumnIconCardData({
    required this.id,
    required this.label,
    this.iconUrl,
    this.defaultIconUrl,
    this.count,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
  });

  /// Stable identifier.
  final String id;

  /// Label rendered under the icon.
  final String label;

  /// Optional URL (svg/png) for the leading icon.
  final String? iconUrl;

  /// Optional local asset fallback/placeholder URL.
  final String? defaultIconUrl;

  /// Optional badge count.
  final int? count;

  /// Tap on card body.
  final VoidCallback? onTap;

  /// Optional override background color
  final Color? backgroundColor;

  /// Optional card border override.
  final Color? borderColor;
}

/// Vertical icon card matching the Figma "Dịch vụ của tôi" surface.
///
/// Square-ish card with a 32x32 icon centered on top and a 14px medium
/// label below. Pink background, magenta border, 28px radius, 4px
/// bottom drop-shadow. Wraps `PressableCardContainerV2` for press-down
/// feedback.
class ColumnIconCardV2 extends StatelessWidget {
  const ColumnIconCardV2({
    super.key,
    required this.label,
    this.iconUrl,
    this.defaultIconUrl,
    this.count,
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
    this.onTap,
  });

  /// Main label rendered below the icon.
  final String label;

  /// Optional URL (svg/png) for the icon.
  final String? iconUrl;

  /// Optional local asset fallback/placeholder URL.
  final String? defaultIconUrl;

  /// Optional badge count.
  final int? count;

  /// Override background color. Defaults to
  /// `AppColorsV2.serviceCardPinkBg` (soft pink).
  final Color? backgroundColor;

  /// Override border color. Defaults to
  /// `AppColorsV2.serviceCardPinkBorder` (magenta).
  final Color? borderColor;

  /// Override drop-shadow color. Defaults to [borderColor].
  final Color? shadowColor;

  /// Tap on card body.
  final VoidCallback? onTap;

  static const double _iconSize = DimensV2.d40;
  static const double _radius = DimensV2.d28;

  /// Builds the pink-bordered service tile (icon stacked above label)
  /// wrapped in [PressableCardContainerV2] for press-down feedback.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final bg = backgroundColor ?? AppColorsV2.serviceCardPinkBg;
    final border = borderColor ?? AppColorsV2.serviceCardPinkBorder;
    final shadow = shadowColor ?? border;

    final String? displayCount = count != null && count! > 0
        ? (count! > 99 ? '99+' : '$count')
        : null;

    final hasUrl = iconUrl != null && iconUrl!.trim().isNotEmpty;
    final hasDefault = defaultIconUrl != null && defaultIconUrl!.trim().isNotEmpty;

    ///
    Widget buildDefaultIcon(String path) {
      return AdaptiveImageV2(
        url: path,
        width: _iconSize,
        height: _iconSize,
      );
    }

    Widget iconWidget;
    if (hasUrl) {
      iconWidget = AdaptiveImageV2(
        url: iconUrl!,
        width: _iconSize,
        height: _iconSize,
        placeholderBuilder: hasDefault ? (_) => buildDefaultIcon(defaultIconUrl!) : null,
        errorBuilder: hasDefault ? (_, __) => buildDefaultIcon(defaultIconUrl!) : null,
      );
    } else if (hasDefault) {
      iconWidget = buildDefaultIcon(defaultIconUrl!);
    } else {
      iconWidget = Icon(
        Icons.event_outlined,
        size: _iconSize,
        color: colors.txContentSecondaryDefault,
      );
    }

    final card = SizedBox(
      width: double.infinity,
      child: PressableCardContainerV2(
        onTap: onTap,
        borderRadius: _radius,
        borderColor: border,
        shadowColor: shadow,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacingV2.sm,
          vertical: AppSpacingV2.xs,
        ),
        color: bg,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: _iconSize,
              height: _iconSize,
              child: iconWidget,
            ),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStylesV2.text14Medium.copyWith(
                color: AppColorsV2.genericBlack,
              ),
            ),
          ],
        ),
      ),
    );

    if (displayCount == null) return card;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        card,
        Positioned(
          top: -DimensV2.d4,
          right: -DimensV2.d4,
          child: AppUnreadBadgeV2(label: displayCount),
        ),
      ],
    );
  }
}

/// Grid list of [ColumnIconCardV2] tiles, [columns] per row (default 2).
///
/// Lays out [items] in fixed-width tiles sized to fit [columns] per row
/// across available width with [spacing] between tiles.
class ColumnIconCardListV2 extends StatelessWidget {
  const ColumnIconCardListV2({
    super.key,
    required this.items,
    this.columns = 2,
    this.spacing = AppSpacingV2.md,
    this.runSpacing = AppSpacingV2.md,
  });

  /// Items to render inside the grid.
  final List<ColumnIconCardData> items;

  /// Number of items per row. Default 2.
  final int columns;

  /// Horizontal gap between tiles.
  final double spacing;

  /// Vertical gap between rows.
  final double runSpacing;

  /// Builds the responsive tile grid for [items]; falls back to
  /// an empty `SizedBox.shrink()` when [items] is empty.
  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacingV2.screenHorizontal),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final tileWidth = (constraints.maxWidth - spacing * (columns - 1)) / columns;
          return Wrap(
            clipBehavior: Clip.none,
            spacing: spacing,
            runSpacing: runSpacing,
            children: [
              for (final item in items)
                SizedBox(
                  width: tileWidth,
                  child: ColumnIconCardV2(
                    backgroundColor: item.backgroundColor,
                    borderColor: item.borderColor,
                    shadowColor: item.borderColor,
                    label: item.label,
                    iconUrl: item.iconUrl,
                    defaultIconUrl: item.defaultIconUrl,
                    count: item.count,
                    onTap: item.onTap,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

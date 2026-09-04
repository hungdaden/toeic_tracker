import 'package:flutter/material.dart';

import '../../may_uikit.dart';

/// Per-item data for [RowTabPillV2] / [RowTabPillListV2].
class RowTabPillData {
  const RowTabPillData({
    required this.id,
    required this.label,
    this.iconUrl,
    this.defaultIconUrl,
    this.trailingText,
    this.count,
    this.color,
    this.borderColor,
    this.onTap,
  });

  /// Stable identifier for this item.
  final String id;

  /// Main label (e.g. "Sự kiện").
  final String label;

  /// Optional URL (svg/png) for the leading icon (rendered at 28x28).
  final String? iconUrl;

  /// Optional local asset fallback/placeholder URL.
  final String? defaultIconUrl;

  /// Optional small text trailing the label (e.g. count, date).
  final String? trailingText;

  /// Optional badge count trailing the label.
  final int? count;

  /// Fill start color (renders as gradient → `AppColorsV2.genericWhite`
  /// when set). Also tints the icon background.
  final Color? color;

  /// Optional card border override.
  final Color? borderColor;

  /// Tap on card body.
  final VoidCallback? onTap;
}

/// Horizontal pill tab item matching the Figma "Item tab" surface.
class RowTabPillV2 extends StatelessWidget {
  const RowTabPillV2({
    super.key,
    required this.label,
    this.iconUrl,
    this.defaultIconUrl,
    this.trailingText,
    this.count,
    this.borderColor,
    this.color,
    this.onTap,
  });

  /// Main label (e.g. "Sự kiện").
  final String label;

  /// Optional URL (svg/png) for the leading icon.
  final String? iconUrl;

  /// Optional local asset fallback/placeholder URL.
  final String? defaultIconUrl;

  /// Optional small text trailing the label.
  final String? trailingText;

  /// Optional badge count trailing the label.
  final int? count;

  /// Override card border color. Defaults to `AppColorsV2.orangeCream300`.
  final Color? borderColor;

  /// Override card fill color. Defaults to `AppColorsV2.primaryBackground`.
  final Color? color;

  /// Tap on card body.
  final VoidCallback? onTap;



  static const double _iconBoxSize = DimensV2.d48;
  static const double _iconSize = DimensV2.d28;
  static const double _containerRadius = DimensV2.d16;

  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    final String? displayCount = count != null && count! > 0
        ? (count! > 99 ? '99+' : '$count')
        : null;

    final card = PressableCardContainerV2(
      onTap: onTap,
      height: _iconBoxSize,
      borderRadius: _containerRadius,
      borderColor: borderColor,
      borderWidth: DimensV2.d_05,
      gradient: color != null ? LinearGradient(colors: [color!, AppColorsV2.genericWhite]) : null,
      shadowColor: borderColor,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          _IconBox(
            url: iconUrl,
            defaultIconUrl: defaultIconUrl,
            size: _iconBoxSize,
            iconSize: _iconSize,
            radius: _containerRadius,
            background: color ?? colors.bgCard,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacingV2.xs,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStylesV2.text14Medium.copyWith(
                        color: color != null
                            ? AppColorsV2.genericBlack
                            : colors.txContentPrimaryDefault,
                      ),
                    ),
                  ),
                  if (trailingText != null && trailingText!.isNotEmpty) ...[
                    SizedBox(width: AppSpacingV2.xs),
                    Text(
                      trailingText!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStylesV2.text14Medium.copyWith(
                        color: colors.txBgColorSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
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

class _IconBox extends StatelessWidget {
  const _IconBox({
    required this.url,
    this.defaultIconUrl,
    required this.size,
    required this.iconSize,
    required this.radius,
    required this.background,
  });

  final String? url;
  final String? defaultIconUrl;
  final double size;
  final double iconSize;
  final double radius;
  final Color background;

  @override
  Widget build(BuildContext context) {
    final hasUrl = url != null && url!.trim().isNotEmpty;
    final hasDefault = defaultIconUrl != null && defaultIconUrl!.trim().isNotEmpty;

    ///
    Widget buildDefaultIcon(String path) {
      return AdaptiveImageV2(
        url: path,
        width: iconSize,
        height: iconSize,
      );
    }

    Widget content;
    if (hasUrl) {
      content = AdaptiveImageV2(
        url: url!,
        width: iconSize,
        height: iconSize,
        placeholderBuilder: hasDefault ? (_) => buildDefaultIcon(defaultIconUrl!) : null,
        errorBuilder: hasDefault ? (_, __) => buildDefaultIcon(defaultIconUrl!) : null,
      );
    } else if (hasDefault) {
      content = buildDefaultIcon(defaultIconUrl!);
    } else {
      content = Center(
        child: Icon(
          Icons.event_outlined,
          size: iconSize,
        ),
      );
    }

    return SizedBox(
      width: size,
      height: size,
      child: content,
    );
  }
}

/// Grid list of [RowTabPillV2] rows, [columns] per row (default 2).
///
/// Lays out [items] in fixed-width tiles sized to fit [columns] per row
/// across available width with [spacing] between tiles.
class RowTabPillListV2 extends StatelessWidget {
  const RowTabPillListV2({
    super.key,
    this.items,
    this.title,
    this.isHome = false,
    this.actionLabel,
    this.onActionTap,
    this.titleStyle,
    this.actionStyle,
    this.emptyIconUrl,
    this.emptyLabel,
    this.emptyOnTap,
    this.columns = 2,
    this.spacing = AppSpacingV2.sm,
    this.runSpacing = AppSpacingV2.sm,
  });

  /// Items to render inside the grid.
  final List<RowTabPillData>? items;

  /// Optional section title shown above the grid.
  final String? title;

  /// Optional label for the trailing action (e.g. "Tất cả").
  final String? actionLabel;

  /// Optional tap handler for the trailing action.
  final VoidCallback? onActionTap;

  /// Override title text style. Defaults to `AppTextStylesV2.title3SemiBold`.
  final TextStyle? titleStyle;

  /// Override action text style. Defaults to `AppTextStylesV2.bodyRegular`
  /// tinted with `context.mayColors.icColor`.
  final TextStyle? actionStyle;

  /// Single-row icon shown when [items] is empty.
  final String? emptyIconUrl;

  /// Single-row label shown when [items] is empty.
  final String? emptyLabel;

  /// Optional tap handler for the empty-state row.
  final VoidCallback? emptyOnTap;

  /// Number of items per row. Default 2.
  final int columns;

  /// Horizontal gap between tiles.
  final double spacing;

  /// Vertical gap between rows.
  final double runSpacing;

  ///check ui home page
  final bool? isHome;

  /// Builds the responsive tile grid for [items]; falls back to a single
  /// empty-state [RowTabPillV2] or `SizedBox.shrink()` when none.
  @override
  Widget build(BuildContext context) {
    final hasHeader = title != null || (actionLabel != null && onActionTap != null);
    final isEmpty = items == null || items!.isEmpty;

    Widget content;
    if (isEmpty) {
      if (emptyLabel == null) {
        content = const SizedBox.shrink();
      } else {
        content = Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacingV2.screenHorizontal),
          child: RowTabPillV2(
            label: emptyLabel!,
            iconUrl: emptyIconUrl,
            onTap: emptyOnTap,
          ),
        );
      }
    } else {
      content = Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacingV2.screenHorizontal),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final tileWidth = (constraints.maxWidth - spacing * (columns - 1)) / columns;
            return Wrap(
              clipBehavior: Clip.none,
              spacing: spacing,
              runSpacing: runSpacing,
              children: [
                for (final item in items!)
                  SizedBox(
                    width: tileWidth,
                    child: RowTabPillV2(
                      label: item.label,
                      iconUrl: item.iconUrl,
                      defaultIconUrl: item.defaultIconUrl,
                      trailingText: item.trailingText,
                      count: item.count,
                      color: item.color,
                      borderColor: item.borderColor,
                      onTap: item.onTap,
                    ),
                  ),
              ],
            );
          },
        ),
      );
    }

    if (!hasHeader) return content;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (title != null)
              Padding(
                padding: EdgeInsets.only(
                    left: AppSpacingV2.screenHorizontal,
                    right: AppSpacingV2.screenHorizontal,
                    bottom: AppSpacingV2.sm,
                    top: isHome == true ? 0 : AppSpacingV2.sm,
                ),
                child: Text(
                  title!,
                  style: titleStyle ??
                      AppTextStylesV2.title16SemiBold.copyWith(
                        color: context.mayColors.txContentPrimaryDefault,
                      ),
                ),
              ),
            if (actionLabel != null && onActionTap != null)
              GestureContainerV2(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacingV2.screenHorizontal,
                  vertical: AppSpacingV2.sm,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DimensV2.d16),
                ),
                onTap: onActionTap,
                child: Text(
                  actionLabel!,
                  style: actionStyle ??
                      AppTextStylesV2.bodySemiBold.copyWith(
                        color: context.mayColors.txPrimaryTheme,
                      ),
                ),
              ),
          ],
        ),
        content,
      ],
    );
  }
}

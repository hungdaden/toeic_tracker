import 'package:flutter/material.dart';
import '../../may_uikit.dart';

/// Configuration details for an item in [FlatActionListV2].
class FlatActionItemV2 {
  const FlatActionItemV2({
    required this.title,
    required this.icon,
    this.trailing,
    this.onTap,
    this.titleStyle,
    this.iconBackgroundColor,
    this.arrowBackgroundColor,
    this.arrowColor,
  });

  /// The title text of the item.
  final String title;

  /// The leading icon asset path or URL.
  final String? icon;

  /// Optional trailing widget. If null, displays the default arrow button.
  final Widget? trailing;

  /// Callback when the item is tapped.
  final VoidCallback? onTap;

  /// Optional style override for the title text.
  final TextStyle? titleStyle;

  /// Background color for the leading icon container.
  final Color? iconBackgroundColor;

  /// Background color for the trailing arrow container.
  final Color? arrowBackgroundColor;

  /// Color for the trailing arrow icon.
  final Color? arrowColor;
}

/// A flat, bordered action list card styled to match Phenikaa School part 2 design.
///
/// It features a rounded card containing multiple [ActionTileV2]s separated by dividers,
/// with no shadow and automatic divider hiding on the last item.
class FlatActionListV2 extends StatelessWidget {
  const FlatActionListV2({
    super.key,
    required this.items,
    this.borderRadius = AppRadiusV2.x3l, // Matches 28px in Phenikaa design
    this.padding,
  });

  /// The list of items to render.
  final List<FlatActionItemV2> items;

  /// The border radius for the outer container card.
  final double borderRadius;

  /// The padding inside each item tile.
  final EdgeInsetsGeometry? padding;

  @override
  /// Builds the visual representation of [FlatActionListV2].
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colors.bgCard,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: colors.bdDefault,
          width: DimensV2.d_05,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isLast = index == items.length - 1;

          return ActionTileV2(
            title: item.title,
            icon: item.icon,
            trailing: item.trailing,
            showDivider: !isLast,
            onTap: item.onTap,
            titleStyle: item.titleStyle,
            iconBackgroundColor: item.iconBackgroundColor,
            arrowBackgroundColor: item.arrowBackgroundColor,
            arrowColor: item.arrowColor,
            padding: padding,
          );
        }),
      ),
    );
  }
}

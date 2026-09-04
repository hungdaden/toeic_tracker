import 'package:flutter/material.dart';

import '../../may_uikit.dart';
import '../../resources/generated/assets.gen.dart';

/// A reusable tile component designed to be used inside [ActionListV2]
/// or as a standalone action row. Mirrors the design of Figma node `40024256-22057`.
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../may_uikit.dart';

/// A reusable action tile widget.
class ActionTileV2 extends StatelessWidget {
  /// Creates an action tile with a title, optional icon, and custom trailing widget.
  const ActionTileV2({
    super.key,
    required this.title,
    this.icon,
    this.trailing,
    this.showDivider = true,
    this.titleStyle,
    this.iconBackgroundColor,
    this.arrowBackgroundColor,
    this.arrowColor,
    this.padding,
    this.onTap,
  });

  /// The title text of the tile.
  final String title;

  /// The leading icon asset path or URL.
  final String? icon;

  /// The trailing widget. If null, displays the default arrow button.
  final Widget? trailing;

  /// Whether to show a divider at the bottom.
  final bool showDivider;

  /// Optional style override for the title text.
  final TextStyle? titleStyle;

  /// Background color for the leading icon container.
  final Color? iconBackgroundColor;

  /// Background color for the trailing arrow container.
  final Color? arrowBackgroundColor;

  /// Color for the trailing arrow icon.
  final Color? arrowColor;

  /// Padding for the tile content.
  final EdgeInsetsGeometry? padding;

  /// Callback when the tile is tapped.
  final VoidCallback? onTap;

  @override
  /// Builds the visual representation of [ActionTileV2].
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    final resolvedIconBg = iconBackgroundColor ?? colors.bgIcon;
    final resolvedArrowBg = arrowBackgroundColor ?? colors.bgIcon;
    final resolvedArrowColor = arrowColor ?? colors.icColor;

    final defaultPadding = padding ??
        const EdgeInsets.symmetric(
          horizontal: AppSpacingV2.cardLg,
          vertical: AppSpacingV2.md,
        );

    Widget? leadingIcon;
    if (icon != null && icon!.isNotEmpty) {
      final isSvg = icon!.toLowerCase().endsWith('.svg');
      final isNetwork = icon!.startsWith('http');

      Widget iconWidget;
      if (isNetwork) {
        iconWidget = isSvg
            ? SvgPicture.network(
                icon!,
                width: DimensV2.d20,
                height: DimensV2.d20,
                colorFilter: ColorFilter.mode(colors.icColor, BlendMode.srcIn),
              )
            : Image.network(
                icon!,
                width: DimensV2.d20,
                height: DimensV2.d20,
                fit: BoxFit.contain,
              );
      } else {
        iconWidget = SvgPicture.asset(
          icon!,
          width: DimensV2.d20,
          height: DimensV2.d20,
          colorFilter: ColorFilter.mode(colors.icColor, BlendMode.srcIn),
        );
      }

      leadingIcon = Container(
        width: DimensV2.d32,
        height: DimensV2.d32,
        decoration: BoxDecoration(
          color: resolvedIconBg,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: iconWidget,
      );
    }

    return GestureContainerV2(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: defaultPadding.resolve(Directionality.of(context)).left,
          right: defaultPadding.resolve(Directionality.of(context)).right,
          top: defaultPadding.resolve(Directionality.of(context)).top,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (leadingIcon != null) ...[
                  leadingIcon,
                  const SizedBox(width: AppSpacingV2.xs),
                ],
                Expanded(
                  child: Text(
                    title,
                    style: titleStyle ??
                        AppTextStylesV2.text14Medium.copyWith(
                          color: colors.txContentPrimaryDefault,
                        ),
                  ),
                ),
                const SizedBox(width: AppSpacingV2.xs),
                trailing ??
                    Container(
                      width: DimensV2.d28,
                      height: DimensV2.d28,
                      decoration: BoxDecoration(
                        color: resolvedArrowBg,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Assets.icons.icArrowRight.svg(
                        width: DimensV2.d12,
                        height: DimensV2.d12,
                        colorFilter: ColorFilter.mode(
                          resolvedArrowColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
              ],
            ),
            if (showDivider) ...[
              SizedBox(height: defaultPadding.resolve(Directionality.of(context)).bottom),
              const CommonDividerV2(),
            ] else ...[
              SizedBox(height: defaultPadding.resolve(Directionality.of(context)).bottom),
            ],
          ],
        ),
      ),
    );
  }
}

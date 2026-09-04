import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:may_uikit/resources/generated/assets.gen.dart';

/// Shared empty state component for surfaces that may appear inside larger layouts.
class EmptyStateWidgetV2 extends StatelessWidget {
  /// Creates an empty state with an icon, title, and description.
  const EmptyStateWidgetV2({
    super.key,
    this.title = 'Trống',
    this.description = 'Dữ liệu đang trống',
    this.iconPath,
    this.iconSize = DimensV2.d90,
    this.padding,
    this.fillParent = false,
    this.hasBorder = true,
    this.hasShadow = true,
    this.isShowButton = false,
    this.buttonLabel,
    this.onButtonPressed,
  });

  /// Title shown below the empty icon.
  final String title;

  /// Description shown below [title].
  final String description;

  /// SVG asset path used for the empty icon.
  final String? iconPath;

  /// Square icon size.
  final double iconSize;
  final EdgeInsetsGeometry? padding;
  final bool fillParent;
  final bool hasBorder;
  final bool hasShadow;
  final bool isShowButton;
  final String? buttonLabel;
  final VoidCallback? onButtonPressed;

  /// Builds the empty state content.
  @override
  Widget build(BuildContext context) {
    final card = PressableCardContainerV2(
      borderRadius: AppRadiusV2.x3l,
      padding: EdgeInsets.symmetric(horizontal: AppSpacingV2.x3l, vertical: AppSpacingV2.x2l),
      borderColor: hasBorder ? null : AppColorsV2.transparent,
      shadowColor: hasShadow ? null : AppColorsV2.transparent,
      borderWidth: hasBorder ? 1.0 : 0.0,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildIcon(),
            const SizedBox(height: AppSpacingV2.lg),
            Text(
              title,
              style: AppTextStylesV2.text16Semibold.copyWith(
                color: context.mayColors.txTitleEmptyState,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacingV2.xs),
            Text(
              description,
              style: AppTextStylesV2.text14Medium.copyWith(
                color: context.mayColors.txDescriptionEmptyState,
              ),
              textAlign: TextAlign.center,
            ),
            if (isShowButton) ...[
              const SizedBox(height: AppSpacingV2.lg),
              CommonButtonV2(
                variant: CommonButtonVariant.primary,
                size: CommonButtonSize.medium,
                label: buttonLabel ?? '',
                onTap: onButtonPressed,
              ),
            ],
          ],
        ),
      ),
    );
    final wrappedCard = fillParent
        ? SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: card,
          )
        : card;

    return Padding(
      padding: padding ??
          (fillParent
              ? EdgeInsets.fromLTRB(
                  AppSpacingV2.screenHorizontal,
                  0,
                  AppSpacingV2.screenHorizontal,
                  AppDimenV2.of(context).glassBottomBarHeight,
                )
              : EdgeInsets.fromLTRB(
                  AppSpacingV2.screenHorizontal,
                  AppDimenV2.of(context).paddingTop,
                  AppSpacingV2.screenHorizontal,
                  AppDimenV2.of(context).glassBottomBarHeight,
                )),
      child: wrappedCard,
    );
  }

  Widget _buildIcon() {
    if (iconPath == null) {
      return Assets.icons.icEmptyState.svg(
        width: iconSize,
        height: iconSize,
      );
    }

    return SvgPicture.asset(
      iconPath!,
      width: iconSize,
      height: iconSize,
    );
  }
}

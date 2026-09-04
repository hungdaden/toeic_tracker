import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

import '../../../resources/generated/assets.gen.dart';

/// Content modes supported by [CardListItemV2].
enum CardListItemType { normal, dynamic }

/// Visual styles supported by [CardListItemV2].
enum CardListItemStyle { normal, bottomSheet }

/// Checkbox variants supported by [CardListItemV2].
enum CardListItemCheckboxStyle { square, circle }

/// Individual selectable card row used by [CardListV2].
class CardListItemV2 extends StatelessWidget {
  const CardListItemV2({
    super.key,
    this.margin = EdgeInsets.zero,
    this.borderRadius = AppSpacingV2.sm,
    this.customBorderRadius,
    this.backgroundColor = AppColorsV2.genericWhite,
    this.isShowBorder = true,
    this.borderColor = AppColorsV2.neutral200,
    this.borderWidth = DimensV2.d_05,
    this.padding = const EdgeInsets.symmetric(
      vertical: AppSpacingV2.sm,
      horizontal: AppSpacingV2.md,
    ),
    this.isShowAvatar = true,
    this.imageUrl = '',
    this.avatarSize = AppSpacingV2.x4l,
    this.name = '',
    this.nameStyle,
    this.trailingIcon,
    this.subtitle = '',
    this.subtitleIconNetworkUrl,
    this.cardData = const [],
    this.type = CardListItemType.normal,
    this.isShowCheckbox = false,
    this.checkboxValue = false,
    this.onCheckboxChanged,
    this.checkboxTapPadding = EdgeInsets.zero,
    this.checkboxReplacement,
    this.checkboxScale = 1,
    this.checkboxStyle = CardListItemCheckboxStyle.square,
    this.multiSelected = false,
    this.isShowArrowRight = false,
    this.style = CardListItemStyle.normal,
    this.onTap,
    this.badgeTitle,
    this.badgeStatus,
    this.inkWell = false,
  });

  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final BorderRadiusGeometry? customBorderRadius;
  final Color backgroundColor;
  final bool isShowBorder;
  final Color? borderColor;
  final double borderWidth;
  final EdgeInsetsGeometry padding;
  final bool isShowAvatar;
  final String imageUrl;
  final double avatarSize;
  final String name;
  final TextStyle? nameStyle;
  final String? trailingIcon;
  final String subtitle;
  final String? subtitleIconNetworkUrl;
  final List<CardDataV2> cardData;
  final CardListItemType type;
  final bool isShowCheckbox;
  final bool checkboxValue;
  final ValueChanged<bool?>? onCheckboxChanged;
  final EdgeInsetsGeometry checkboxTapPadding;
  final Widget? checkboxReplacement;
  final double checkboxScale;
  final CardListItemCheckboxStyle checkboxStyle;
  final bool multiSelected;
  final bool isShowArrowRight;
  final CardListItemStyle style;
  final VoidCallback? onTap;
  final String? badgeTitle;
  final AppBadgeStatus? badgeStatus;
  final bool inkWell;

  EdgeInsetsGeometry get _checkboxPositionPadding => checkboxTapPadding == EdgeInsets.zero
      ? const EdgeInsets.only(right: AppSpacingV2.md)
      : EdgeInsets.zero;

  @override

  /// Builds the card list row.
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureContainerV2(
          inkWell: inkWell,
          onTap: onTap,
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: customBorderRadius ?? BorderRadius.circular(borderRadius),
            color: backgroundColor,
            border: isShowBorder && borderColor != null
                ? Border.all(color: borderColor!, width: borderWidth)
                : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isShowAvatar) ...[
                CommonAvatarV2(imageUrl: imageUrl, radius: avatarSize),
                const SizedBox(width: AppSpacingV2.sm),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isShowArrowRight)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: _buildNameHeader(context)),
                          const SizedBox(width: AppSpacingV2.md),
                          CommonImageV2.svg(
                            path: Assets.icons.icArrowRight.keyName,
                            width: DimensV2.d12,
                            height: DimensV2.d12,
                          ),
                        ],
                      )
                    else
                      _buildNameHeader(context),
                    _buildSubtitleContent(context),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (isShowCheckbox)
          Positioned.fill(
            child: Padding(
              padding: _checkboxPositionPadding,
              child: Align(
                alignment: Alignment.centerRight,
                child: Transform.scale(
                  scale: checkboxScale,
                  child: checkboxReplacement ??
                      (multiSelected ? _buildMultiSelectedIcon() : _buildCheckboxSingle()),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildNameHeader(BuildContext context) {
    if (type == CardListItemType.dynamic && cardData.isNotEmpty) {
      final firstItem = cardData.first;
      return _buildRowItem(
        firstItem,
        labelStyle: AppTextStylesV2.text16Semibold.copyWith(color: context.mayColors.primaryText),
        contentStyle:
            AppTextStylesV2.text16Semibold.copyWith(color: context.mayColors.secondaryText),
      );
    }

    final nameWidget = Text(
      name,
      style: nameStyle ??
          (style == CardListItemStyle.bottomSheet
              ? AppTextStylesV2.labelMedium.copyWith(color: context.mayColors.primaryText)
              : AppTextStylesV2.text16Semibold.copyWith(color: context.mayColors.primaryText)),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    if (trailingIcon != null && trailingIcon!.isNotEmpty) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: nameWidget),
          const SizedBox(width: AppSpacingV2.xs),
          CommonImageV2.network(
            url: trailingIcon!,
            width: DimensV2.d16,
            height: DimensV2.d16,
            fit: BoxFit.contain,
            errorBuilder: (_, __) => const SizedBox.shrink(),
          ),
        ],
      );
    }

    return nameWidget;
  }

  Widget _buildSubtitleContent(BuildContext context) {
    final color = context.mayColors;
    if (type == CardListItemType.dynamic && cardData.length > 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...cardData.skip(1).map((item) {
            if (!item.isCustomContent && item.label.isEmpty && item.content.isEmpty) {
              return const SizedBox.shrink();
            }

            return Padding(
              padding: const EdgeInsets.only(top: AppSpacingV2.x2s),
              child: _buildRowItem(
                item,
                labelStyle: AppTextStylesV2.text13Medium.copyWith(
                  color: color.secondaryText,
                ),
                contentStyle: AppTextStylesV2.text13Medium.copyWith(
                  color: color.primaryText,
                ),
              ),
            );
          }),
          if (badgeTitle != null && badgeTitle!.isNotEmpty && badgeStatus != null)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacingV2.xs),
              child: AppBadgeV2(
                status: badgeStatus!,
                label: badgeTitle!,
              ),
            ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (subtitle.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacingV2.x2s),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (subtitleIconNetworkUrl != null && subtitleIconNetworkUrl!.isNotEmpty) ...[
                  CommonImageV2.network(
                    url: subtitleIconNetworkUrl!,
                    width: DimensV2.d16,
                    height: DimensV2.d16,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: AppSpacingV2.x2s),
                ],
                Expanded(
                  child: Text(
                    subtitle,
                    style: AppTextStylesV2.text13Medium.copyWith(
                      color: context.mayColors.txContentSecondaryDefault,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        if (cardData.isNotEmpty)
          ...cardData.map((item) {
            if (!item.isCustomContent && item.label.isEmpty && item.content.isEmpty) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: const EdgeInsets.only(top: AppSpacingV2.x2s),
              child: _buildRowItem(
                item,
                labelStyle: AppTextStylesV2.text13Medium.copyWith(
                  color: context.mayColors.txContentSecondaryDefault,
                ),
                contentStyle: AppTextStylesV2.text13Medium.copyWith(
                  color: context.mayColors.txContentSecondaryDefault,
                ),
              ),
            );
          }),
        if (badgeTitle != null && badgeTitle!.isNotEmpty && badgeStatus != null)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacingV2.xs),
            child: AppBadgeV2(
              status: badgeStatus!,
              label: badgeTitle!,
            ),
          ),
      ],
    );
  }

  Widget _buildRowItem(CardDataV2 item,
      {required TextStyle labelStyle, required TextStyle contentStyle}) {
    if (item.isCustomContent && item.customContent != null) {
      return item.customContent!;
    }
    if (item.label.isEmpty && item.content.isEmpty) return const SizedBox.shrink();

    final textWidget = RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          if (item.label.isNotEmpty) TextSpan(text: item.label, style: labelStyle),
          if (item.content.isNotEmpty) TextSpan(text: item.content, style: contentStyle),
        ],
      ),
    );

    if ((item.iconSvgPath != null && item.iconSvgPath!.isNotEmpty) ||
        (item.iconUrl != null && item.iconUrl!.isNotEmpty)) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (item.iconUrl != null && item.iconUrl!.isNotEmpty)
            CommonImageV2.network(
              url: item.iconUrl!,
              width: AppSpacingV2.md,
              height: AppSpacingV2.md,
              fit: BoxFit.contain,
            )
          else
            CommonImageV2.svg(
              path: item.iconSvgPath!,
              width: AppSpacingV2.md,
              height: AppSpacingV2.md,
            ),
          const SizedBox(width: AppSpacingV2.x2s),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: DimensV2.d2),
            child: textWidget,
          )),
        ],
      );
    }

    return textWidget;
  }

  Widget _buildCheckboxSingle() {
    final checkboxSize =
        checkboxStyle == CardListItemCheckboxStyle.circle ? AppSpacingV2.lg : AppSpacingV2.xl;
    final checkboxRadius =
        checkboxStyle == CardListItemCheckboxStyle.circle ? DimensV2.d100 : DimensV2.d7;

    return GestureContainerV2(
      onTap: onCheckboxChanged == null ? null : () => onCheckboxChanged?.call(!checkboxValue),
      padding: checkboxTapPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(checkboxRadius),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: checkboxSize,
        height: checkboxSize,
        decoration: BoxDecoration(
          color: checkboxValue ? AppColorsV2.primaryText900 : AppColorsV2.genericWhite,
          borderRadius: BorderRadius.circular(checkboxRadius),
          border: Border.all(
            color: checkboxValue ? AppColorsV2.primaryText900 : AppColorsV2.neutral200,
            width: DimensV2.d1,
          ),
        ),
        child: checkboxValue
            ? const Icon(
                Icons.check_rounded,
                size: DimensV2.d14,
                color: AppColorsV2.genericWhite,
              )
            : null,
      ),
    );
  }

  Widget _buildMultiSelectedIcon() {
    return SizedBox(
      width: AppSpacingV2.lg,
      height: AppSpacingV2.lg,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: checkboxValue
            ? const Icon(Icons.check_circle_rounded,
                color: AppColorsV2.primaryText900, size: AppSpacingV2.lg)
            : const SizedBox.shrink(),
      ),
    );
  }
}

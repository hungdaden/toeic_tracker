import 'package:flutter/material.dart';

import '../../../may_uikit_internal.dart';
import '../../../resources/generated/assets.gen.dart';

/// The layout style type of the person card.
enum PersonCardType { normal, dynamic }

/// Style configurations for [PersonCardItem].
enum PersonCardItemStyle { normal, bottomSheet }

/// The type of content to display in the person card.
enum PersonCardItemContentType { checkbox, chat }

/// Shapes of checkbox for selection.
enum PersonCardCheckboxStyle { square, circle }

/// A widget representing an item card with profile and contact details.
class PersonCardItem extends StatelessWidget {
  /// Creates a person card configured for checkbox or chat content.
  const PersonCardItem({
    super.key,
    this.margin = EdgeInsets.zero,
    this.borderRadius = DimensV2.d20,
    this.customBorderRadius,
    this.backgroundColor,
    this.isShowBorder = true,
    this.borderColor = AppColorsV2.neutral200,
    this.borderWidth = DimensV2.d_05,
    this.padding = const EdgeInsets.symmetric(
      vertical: DimensV2.d12,
      horizontal: DimensV2.d16,
    ),
    this.isShowAvatar = true,
    this.imageUrl = '',
    this.avatarSize = DimensV2.d48,
    this.name = '',
    this.nameStyle,
    this.subtitle = '',
    this.cardData = const [],
    this.type = PersonCardType.normal,
    this.badgeStatus,
    this.badgeLabel = '',
    this.appBadge,
    this.isShowCheckbox = false,
    this.checkboxValue = false,
    this.onCheckboxChanged,
    this.checkboxTapPadding = EdgeInsets.zero,
    this.checkboxReplacement,
    this.checkboxScale = 1,
    this.checkboxStyle = PersonCardCheckboxStyle.square,
    this.multiSelected = false,
    this.isShowArrowRight = false,
    this.style = PersonCardItemStyle.normal,
    this.contentType = PersonCardItemContentType.checkbox,
    this.timeLabel = '',
    this.unreadBadgeLabel = '',
    this.avatarText = '',
    this.isUnread,
    this.enableHoverEffect = false,
    this.onTap,
  });

  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final BorderRadiusGeometry? customBorderRadius;

  /// Overrides the semantic card background when provided.
  final Color? backgroundColor;
  final bool isShowBorder;
  final Color? borderColor;
  final double borderWidth;
  final EdgeInsetsGeometry padding;
  final bool isShowAvatar;
  final String imageUrl;
  final double avatarSize;
  final String name;
  final TextStyle? nameStyle;
  final String subtitle;
  final List<CardData> cardData;
  final PersonCardType type;
  final AppBadgeStatus? badgeStatus;
  final String badgeLabel;
  final Widget? appBadge;
  final bool isShowCheckbox;
  final bool checkboxValue;
  final ValueChanged<bool?>? onCheckboxChanged;
  final EdgeInsetsGeometry checkboxTapPadding;
  final Widget? checkboxReplacement;
  final double checkboxScale;
  final PersonCardCheckboxStyle checkboxStyle;
  final bool isShowArrowRight;
  final bool multiSelected;
  final PersonCardItemStyle style;
  final PersonCardItemContentType contentType;
  final String timeLabel;
  final String unreadBadgeLabel;
  final String avatarText;
  final bool? isUnread;
  final bool enableHoverEffect;
  final VoidCallback? onTap;

  static const List<Color> _chatAvatarBackgroundColors = [
    AppColorsV2.badgeGreen600,
    AppColorsV2.badgeOrange600,
    AppColorsV2.badgeBlue600,
    AppColorsV2.secondaryPurple600,
    AppColorsV2.badgeRed600,
    AppColorsV2.badgeYellow600,
  ];

  bool get _isChat => contentType == PersonCardItemContentType.chat;
  bool get _isUnreadChat => isUnread ?? unreadBadgeLabel.isNotEmpty;
  EdgeInsetsGeometry get _checkboxPositionPadding => checkboxTapPadding == EdgeInsets.zero
      ? const EdgeInsets.only(right: DimensV2.d16)
      : EdgeInsets.zero;

  /// Builds the [PersonCardItem] widget tree.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return Stack(
      children: [
        GestureContainerV2(
          onTap: onTap,
          enableAnimation: enableHoverEffect,
          margin: margin,
          padding: padding,
          clipBehavior: _isChat ? Clip.none : null,
          decoration: BoxDecoration(
            borderRadius: customBorderRadius ?? BorderRadius.circular(borderRadius),
            color: backgroundColor ?? colors.bgCard,
            border: isShowBorder && borderColor != null
                ? Border.all(color: borderColor!, width: borderWidth)
                : null,
          ),
          child: Row(
            crossAxisAlignment: _isChat ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              if (isShowAvatar) ...[
                _buildAvatar(),
                const SizedBox(width: AppSpacingV2.sm),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildNameHeader(context),
                    _buildSubtitleContent(context),
                    if (appBadge != null) ...[
                      const SizedBox(height: DimensV2.d4),
                      appBadge!,
                    ] else if (badgeStatus != null && badgeLabel.isNotEmpty) ...[
                      const SizedBox(height: DimensV2.d4),
                      AppBadgeV2(status: badgeStatus!, label: badgeLabel),
                    ],
                  ],
                ),
              ),
              if (isShowCheckbox) const SizedBox(width: DimensV2.d40),
              if (isShowArrowRight) const SizedBox(width: DimensV2.d24),
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
                      (multiSelected ? _buildMultiSelectedIcon() : _buildCheckboxSingle(context)),
                ),
              ),
            ),
          ),
        if (isShowArrowRight)
          Positioned(
            right: DimensV2.d16,
            top: 0,
            bottom: 0,
            child: Assets.icons.icArrowRight.svg(
                width: DimensV2.d16,
                height: DimensV2.d16,
                colorBlendMode: BlendMode.srcIn,
                color: colors.icColor),
          ),
      ],
    );
  }

  Widget _buildNameHeader(BuildContext context) {
    if (_isChat) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              name,
              style: AppTextStylesV2.text16Semibold.copyWith(
                color: context.mayColors.txContentPrimaryDefault,
                height: DimensV2.d26 / DimensV2.d16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (timeLabel.isNotEmpty) ...[
            const SizedBox(width: DimensV2.d8),
            Text(
              timeLabel,
              style: AppTextStylesV2.text12Medium.copyWith(
                color: context.mayColors.txContentTertiary,
              ),
              maxLines: 1,
            ),
          ],
        ],
      );
    }

    if (type == PersonCardType.dynamic && cardData.isNotEmpty) {
      final firstItem = cardData.first;
      return _buildRowItem(
        firstItem,
        labelStyle:
            AppTextStylesV2.bodySemiBold.copyWith(color: context.mayColors.txContentPrimaryDefault),
        contentStyle:
            AppTextStylesV2.bodySemiBold.copyWith(color: context.mayColors.txModalDescription),
      );
    }
    return Text(
      name,
      style: nameStyle ??
          (style == PersonCardItemStyle.bottomSheet
              ? AppTextStylesV2.labelMedium
                  .copyWith(color: context.mayColors.txContentPrimaryDefault)
              : AppTextStylesV2.bodySemiBold
                  .copyWith(color: context.mayColors.txContentPrimaryDefault)),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitleContent(BuildContext context) {
    if (_isChat) {
      if (subtitle.isEmpty) return const SizedBox.shrink();

      return Padding(
        padding: const EdgeInsets.only(top: DimensV2.d4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                subtitle,
                style:
                    (_isUnreadChat ? AppTextStylesV2.text14Semibold : AppTextStylesV2.text14Medium)
                        .copyWith(
                  color: _isUnreadChat
                      ? context.mayColors.txContentPrimaryDefault
                      : context.mayColors.txContentTertiary,
                  height: DimensV2.d22 / DimensV2.d14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (unreadBadgeLabel.isNotEmpty) ...[
              const SizedBox(width: DimensV2.d12),
              _buildUnreadBadge(),
            ],
          ],
        ),
      );
    }

    if (type == PersonCardType.dynamic && cardData.length > 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: cardData.skip(1).map((item) {
          if (!item.isCustomContent && item.label.isEmpty && item.content.isEmpty) {
            return const SizedBox.shrink();
          }

          return Padding(
            padding: const EdgeInsets.only(top: DimensV2.d4),
            child: _buildRowItem(
              item,
              labelStyle: AppTextStylesV2.bodyRegular.copyWith(
                color: AppColorsV2.neutral500,
              ),
              contentStyle: AppTextStylesV2.bodyRegular.copyWith(
                color: AppColorsV2.neutral900,
              ),
            ),
          );
        }).toList(),
      );
    }
    if (subtitle.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: DimensV2.d4),
        child: Text(
          subtitle,
          style: AppTextStylesV2.bodyRegular.copyWith(color: context.mayColors.txModalDescription),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildAvatar() {
    if (!_isChat) {
      return CommonAvatarV2(imageUrl: imageUrl, radius: avatarSize);
    }

    final resolvedAvatarText = avatarText.isNotEmpty ? avatarText : (name.isEmpty ? '' : name[0]);
    final textAvatar = _buildChatTextAvatar(resolvedAvatarText);

    if (imageUrl.trim().isNotEmpty) {
      return SizedBox.square(
        dimension: avatarSize,
        child: CommonAvatarV2(
          imageUrl: imageUrl,
          radius: avatarSize,
          placeholder: textAvatar,
          errorWidget: textAvatar,
        ),
      );
    }

    return textAvatar;
  }

  Widget _buildChatTextAvatar(String resolvedAvatarText) {
    return Container(
      width: avatarSize,
      height: avatarSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _chatAvatarBackgroundColor(resolvedAvatarText),
        borderRadius: BorderRadius.circular(DimensV2.d99),
      ),
      child: Text(
        resolvedAvatarText,
        style: AppTextStylesV2.text13Semibold.copyWith(
          color: AppColorsV2.genericWhite,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }

  Color _chatAvatarBackgroundColor(String resolvedAvatarText) {
    final seedText = resolvedAvatarText.isNotEmpty ? resolvedAvatarText : name;
    final seed = seedText.codeUnits.fold<int>(0, (value, codeUnit) => value + codeUnit);
    return _chatAvatarBackgroundColors[seed % _chatAvatarBackgroundColors.length];
  }

  Widget _buildUnreadBadge() {
    return AppUnreadBadgeV2(label: unreadBadgeLabel);
  }

  Widget _buildRowItem(CardData item,
      {required TextStyle labelStyle, required TextStyle contentStyle}) {
    if (item.isCustomContent && item.customContent != null) {
      return item.customContent!;
    }
    if (item.label.isEmpty && item.content.isEmpty) return const SizedBox.shrink();

    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          if (item.label.isNotEmpty) TextSpan(text: item.label, style: labelStyle),
          if (item.content.isNotEmpty) TextSpan(text: item.content, style: contentStyle),
        ],
      ),
    );
  }

  Widget _buildCheckboxSingle(BuildContext context) {
    final colors = context.mayColors;
    final checkboxSize =
        checkboxStyle == PersonCardCheckboxStyle.circle ? DimensV2.d20 : DimensV2.d24;
    final checkboxRadius =
        checkboxStyle == PersonCardCheckboxStyle.circle ? DimensV2.d100 : DimensV2.d7;

    return GestureContainerV2(
      highlightColor: AppColorsV2.transparent,
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
          color: checkboxValue ? colors.btnPrimaryDefault : colors.bgCard,
          borderRadius: BorderRadius.circular(checkboxRadius),
          border: Border.all(
            color: checkboxValue ? colors.btnPrimaryDefault : colors.bdDefault,
            width: DimensV2.d1,
          ),
        ),
        child: checkboxValue
            ? Icon(
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
      width: DimensV2.d20,
      height: DimensV2.d20,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: checkboxValue
            ? AdaptiveImageV2(
                url: Assets.icons.iconCheckBadge.path, width: DimensV2.d20, height: DimensV2.d20)
            : const SizedBox.shrink(key: ValueKey('empty_check')),
      ),
    );
  }
}

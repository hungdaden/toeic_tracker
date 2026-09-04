import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

import '../../resources/generated/assets.gen.dart';

/// Layout modes supported by [PersonCardItemV2].
enum PersonCardTypeV2 { normal, dynamic }

/// Visual contexts supported by [PersonCardItemV2].
enum PersonCardItemStyleV2 { normal, bottomSheet }

/// Content modes supported by [PersonCardItemV2].
enum PersonCardItemContentTypeV2 { checkbox, chat }

/// Checkbox shapes supported by [PersonCardItemV2].
enum PersonCardCheckboxStyleV2 { square, circle }

/// A person-oriented card row migrated from the legacy shared UI kit.
///
/// The component keeps the legacy normal, dynamic, checkbox, and chat modes
/// while resolving all visual values from May UI Kit components and tokens.
class PersonCardItemV2 extends StatelessWidget {
  const PersonCardItemV2({
    super.key,
    this.margin = EdgeInsets.zero,
    this.borderRadius = DimensV2.d20,
    this.customBorderRadius,
    this.backgroundColor,
    this.isShowBorder = true,
    this.borderColor,
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
    this.type = PersonCardTypeV2.normal,
    this.badgeStatus,
    this.badgeLabel = '',
    this.appBadge,
    this.isShowCheckbox = false,
    this.checkboxValue = false,
    this.onCheckboxChanged,
    this.checkboxTapPadding = EdgeInsets.zero,
    this.checkboxReplacement,
    this.checkboxScale = 1,
    this.checkboxStyle = PersonCardCheckboxStyleV2.square,
    this.multiSelected = false,
    this.isShowArrowRight = false,
    this.style = PersonCardItemStyleV2.normal,
    this.contentType = PersonCardItemContentTypeV2.checkbox,
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
  final List<CardDataV2> cardData;
  final PersonCardTypeV2 type;
  final AppBadgeStatus? badgeStatus;
  final String badgeLabel;
  final Widget? appBadge;
  final bool isShowCheckbox;
  final bool checkboxValue;
  final ValueChanged<bool?>? onCheckboxChanged;
  final EdgeInsetsGeometry checkboxTapPadding;
  final Widget? checkboxReplacement;
  final double checkboxScale;
  final PersonCardCheckboxStyleV2 checkboxStyle;
  final bool isShowArrowRight;
  final bool multiSelected;
  final PersonCardItemStyleV2 style;
  final PersonCardItemContentTypeV2 contentType;
  final String timeLabel;
  final String unreadBadgeLabel;
  final String avatarText;
  final bool? isUnread;
  final bool enableHoverEffect;
  final VoidCallback? onTap;

  static const List<Color> _chatAvatarBackgroundColors = [
    AppColorsV2.badgeGreen600,
    AppColorsV2.badgeOrange500,
    AppColorsV2.badgeBlue600,
  ];

  bool get _isChat => contentType == PersonCardItemContentTypeV2.chat;
  bool get _isUnreadChat => isUnread ?? unreadBadgeLabel.isNotEmpty;
  bool get _hasTrailingControls => isShowCheckbox || isShowArrowRight;

  /// Builds the person card with May UI Kit tokens resolved from [context].
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return GestureContainerV2(
      onTap: onTap,
      enableAnimation: enableHoverEffect,
      margin: margin,
      padding: padding,
      clipBehavior: _isChat ? Clip.none : null,
      decoration: BoxDecoration(
        borderRadius: customBorderRadius ?? BorderRadius.circular(borderRadius),
        color: backgroundColor ?? colors.bgCard,
        border: isShowBorder
            ? Border.all(
                color: borderColor ?? colors.bdDefault,
                width: borderWidth,
              )
            : null,
      ),
      child: Row(
        crossAxisAlignment: _isChat ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          if (isShowAvatar) ...[
            _buildAvatar(context),
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
          if (_hasTrailingControls) ...[
            const SizedBox(width: AppSpacingV2.sm),
            Padding(
              padding: EdgeInsets.only(top: _isChat ? DimensV2.d14 : 0),
              child: _buildTrailingControls(context),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTrailingControls(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isShowCheckbox)
          Transform.scale(
            scale: checkboxScale,
            child: checkboxReplacement ??
                (multiSelected ? _buildMultiSelectedIcon(context) : _buildCheckboxSingle(context)),
          ),
        if (isShowCheckbox && isShowArrowRight) const SizedBox(width: AppSpacingV2.sm),
        if (isShowArrowRight)
          CommonImageV2.svg(
            path: Assets.icons.icArrowRight.keyName,
            width: DimensV2.d16,
            height: DimensV2.d16,
            foregroundColor: context.mayColors.icSecondary,
          ),
      ],
    );
  }

  Widget _buildNameHeader(BuildContext context) {
    final colors = context.mayColors;

    if (_isChat) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              name,
              style: AppTextStylesV2.text16Semibold.copyWith(
                color: colors.txContentPrimaryDefault,
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
                color: colors.txContentTertiary,
              ),
              maxLines: 1,
            ),
          ],
        ],
      );
    }

    if (type == PersonCardTypeV2.dynamic && cardData.isNotEmpty) {
      return _buildRowItem(
        cardData.first,
        labelStyle: AppTextStylesV2.bodySemiBold.copyWith(
          color: colors.txContentPrimaryDefault,
        ),
        contentStyle: AppTextStylesV2.bodySemiBold.copyWith(
          color: colors.txContentSecondaryDefault,
        ),
      );
    }

    return Text(
      name,
      style: nameStyle ??
          (style == PersonCardItemStyleV2.bottomSheet
              ? AppTextStylesV2.text14Semibold.copyWith(
                  color: colors.txContentPrimaryDefault,
                )
              : AppTextStylesV2.bodySemiBold.copyWith(
                  color: colors.txContentPrimaryDefault,
                )),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitleContent(BuildContext context) {
    final colors = context.mayColors;

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
                  color: _isUnreadChat ? colors.txContentPrimaryDefault : colors.txContentTertiary,
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

    if (type == PersonCardTypeV2.dynamic && cardData.length > 1) {
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
                color: colors.txContentSecondaryDefault,
              ),
              contentStyle: AppTextStylesV2.bodyRegular.copyWith(
                color: colors.txContentPrimaryDefault,
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
          style: AppTextStylesV2.bodyRegular.copyWith(
            color: colors.txContentSecondaryDefault,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildAvatar(BuildContext context) {
    if (!_isChat) {
      return CommonAvatarV2(imageUrl: imageUrl, radius: avatarSize);
    }

    final resolvedAvatarText = avatarText.trim().isNotEmpty
        ? avatarText.trim()
        : (name.trim().isEmpty ? '' : name.trim().characters.first.toUpperCase());
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
        borderRadius: BorderRadius.circular(AppRadiusV2.full),
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
    final seed = seedText.codeUnits.fold<int>(
      0,
      (value, codeUnit) => value + codeUnit,
    );
    return _chatAvatarBackgroundColors[seed % _chatAvatarBackgroundColors.length];
  }

  Widget _buildUnreadBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensV2.d7,
        vertical: AppSpacingV2.x3s,
      ),
      decoration: BoxDecoration(
        color: AppColorsV2.badgeRed600,
        borderRadius: BorderRadius.circular(AppRadiusV2.full),
      ),
      child: Text(
        unreadBadgeLabel,
        style: AppTextStylesV2.text12Medium.copyWith(
          color: AppColorsV2.genericWhite,
        ),
        maxLines: 1,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildRowItem(
    CardDataV2 item, {
    required TextStyle labelStyle,
    required TextStyle contentStyle,
  }) {
    if (item.isCustomContent && item.customContent != null) {
      return item.customContent!;
    }
    if (item.label.isEmpty && item.content.isEmpty) {
      return const SizedBox.shrink();
    }

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
        checkboxStyle == PersonCardCheckboxStyleV2.circle ? DimensV2.d20 : DimensV2.d24;
    final checkboxRadius =
        checkboxStyle == PersonCardCheckboxStyleV2.circle ? AppRadiusV2.full : DimensV2.d7;
    final selectedColor = colors.btnPrimaryDefault;

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
          color: checkboxValue ? selectedColor : colors.bgCard,
          borderRadius: BorderRadius.circular(checkboxRadius),
          border: Border.all(
            color: checkboxValue ? selectedColor : colors.bdDefault,
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

  Widget _buildMultiSelectedIcon(BuildContext context) {
    return SizedBox(
      width: DimensV2.d20,
      height: DimensV2.d20,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: checkboxValue
            ? Icon(
                Icons.check_circle_rounded,
                key: const ValueKey('person_card_selected'),
                color: context.mayColors.btnPrimaryDefault,
                size: DimensV2.d20,
              )
            : const SizedBox.shrink(
                key: ValueKey('person_card_unselected'),
              ),
      ),
    );
  }
}

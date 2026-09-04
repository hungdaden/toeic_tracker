import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../may_uikit.dart';

/// A card layout component featuring structured info rows and contact actions,
/// with bold title on top and smaller subtitle below.
class CardInfoDetailV2 extends StatelessWidget {
  /// Creates a [CardInfoDetailV2] with customized styling parameters and information rows.
  const CardInfoDetailV2({
    super.key,
    this.entity,
    this.borderRadius,
    this.padding,
    this.backgroundOpacity = 0,
    this.rowSpacing = DimensV2.d12,
    this.headerSpacing = DimensV2.d12,
    this.itemSpacing = DimensV2.d12,
    this.boxShadow,
    this.onTap,
    this.onPhoneTap,
    this.onChatTap,
    this.onActionTap,
    this.isImageHeader = false,
    this.onImageTap,
    this.enableImageTap = true,
    this.borderColor,
    this.shadowColor,
    this.colorBackground,
  });

  /// Optional entity model containing all details.
  final CardInfoEntityV2<CardInfoDetailEntityV2>? entity;

  /// Callback khi nhấn nút gọi điện.
  final ValueChanged<String>? onPhoneTap;

  /// Callback khi nhấn nút nhắn tin.
  final VoidCallback? onChatTap;

  /// Callback khi nhấn các nút hành động khác.
  final void Function(CardInfoActionType type, String value)? onActionTap;

  /// Border radius of the card container.
  final double? borderRadius;

  /// Padding of the card container.
  final EdgeInsets? padding;

  /// Background opacity.
  final double backgroundOpacity;

  /// Vertical spacing between info rows.
  final double rowSpacing;

  /// Vertical spacing between header and rows.
  final double headerSpacing;

  /// Horizontal spacing between items in a row.
  final double itemSpacing;

  /// Custom box shadow list.
  final List<BoxShadow>? boxShadow;

  /// Callback when the card is tapped.
  final VoidCallback? onTap;

  /// Whether to style the icon/avatar as a large food image header.
  final bool isImageHeader;

  /// Callback when the header image is tapped.
  final VoidCallback? onImageTap;

  /// Whether image tapping is enabled.
  final bool enableImageTap;

  /// Custom border color.
  final Color? borderColor;

  /// Custom shadow color.
  final Color? shadowColor;

  /// Custom background color.
  final Color? colorBackground;

  bool _isNetworkIcon(String? url) {
    if (url == null) return false;
    return url.startsWith('http://') || url.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    final resolvedTitle = entity?.title ?? '';
    final resolvedSubtitle = entity?.subTitle ?? entity?.content ?? '';

    List<CardInfoGroupData> resolvedRows;
    if (entity?.details != null) {
      final List<CardInfoEntry> entries = [];
      for (final detail in entity!.details!) {
        final List<CardInfoAction> actions = [];
        if (detail.icon != null) {
          for (final iconItem in detail.icon!) {
            actions.add(CardInfoAction(
              url: iconItem.url ?? '',
              action: CardInfoActionType.fromCode(iconItem.action),
            ));
          }
        }

        if (detail.title != null || detail.content != null) {
          entries.add(CardInfoEntry(
            label: detail.title ?? '',
            value: detail.content ?? '',
            isFullRow: detail.isBreakLine ?? false,
            isJustify: detail.isJustify ?? false,
            badge: (detail.badgeType != null && detail.badgeType!.isNotEmpty)
                ? CardInfoBadgeData(
                    label: detail.content ?? '',
                    status: AppBadgeStatus.fromCode(detail.badgeType),
                  )
                : null,
            actions: actions,
          ));
        }
      }

      if (entity!.bottomInfo != null) {
        final bInfo = entity!.bottomInfo!;
        entries.add(CardInfoEntry(
          label: bInfo.title ?? '',
          value: bInfo.subTitle ?? '',
          isActionItem: bInfo.isContact ?? true,
          showDivider: bInfo.showDivider ?? true,
          iconUrl: bInfo.avatarUrl,
          actions: bInfo.icon
              ?.map((ico) => CardInfoAction(
                    url: ico.url ?? '',
                    action: CardInfoActionType.fromCode(ico.action),
                  ))
              .toList(),
        ));
      }

      resolvedRows = [CardInfoGroupData(items: entries)];
    } else {
      resolvedRows = const [];
    }

    final resolvedIcon = entity?.imageUrl;
    final resolvedAvatar = entity?.imageUrl;
    final bool isSvg = resolvedAvatar != null && resolvedAvatar.toLowerCase().contains('.svg');
    final bool isExplicitlyNoAvatar = entity?.hasAvatar == false;

    final resolvedHasAvatar = !isExplicitlyNoAvatar &&
        ((entity?.hasAvatar == true) ||
            (entity?.imageUrl != null && !isSvg));

    final resolvedOnTap = onTap;
    final showArrow = resolvedOnTap != null || entity?.isNext == true;

    final hasSubtitle = resolvedSubtitle.isNotEmpty;
    final colors = context.mayColors;

    final localHasIcon = !isExplicitlyNoAvatar &&
        isSvg &&
        resolvedIcon != null &&
        resolvedIcon.trim().isNotEmpty;

    CardInfoEntry? contactEntry;
    final List<CardInfoGroupData> processedRows = [];
    for (final row in resolvedRows) {
      final List<CardInfoEntry> normalItems = [];
      for (final item in row.items) {
        if (item.isActionItem) {
          contactEntry = item;
        } else {
          normalItems.add(item);
        }
      }
      if (normalItems.isNotEmpty) {
        for (var i = 0; i < normalItems.length;) {
          final leading = normalItems[i];
          if (leading.isFullRow) {
            processedRows.add(
              CardInfoGroupData(
                items: [leading],
                title: i == 0 ? row.title : null,
                avatar: i == 0 ? row.avatar : null,
              ),
            );
            i++;
          } else {
            final trailing = (i + 1 < normalItems.length && !normalItems[i + 1].isFullRow)
                ? normalItems[i + 1]
                : null;
            processedRows.add(
              CardInfoGroupData(
                items: [leading, if (trailing != null) trailing],
                title: i == 0 ? row.title : null,
                avatar: i == 0 ? row.avatar : null,
              ),
            );
            i += (trailing != null) ? 2 : 1;
          }
        }
      }
    }

    final hasPhoneIcon = contactEntry?.iconPhone != null && contactEntry!.iconPhone!.isNotEmpty;
    final hasChatIcon = contactEntry?.iconChat != null && contactEntry!.iconChat!.isNotEmpty;

    final List<CardInfoAction> validActions = [];
    if (contactEntry != null && contactEntry.actions != null) {
      for (final actionItem in contactEntry.actions!) {
        if (actionItem.url.isEmpty) continue;

        if (actionItem.action == CardInfoActionType.phone) {
          final hasPhoneVal = contactEntry.value.isNotEmpty && contactEntry.value != '--';
          var hasFallbackPhone = false;
          for (final r in resolvedRows) {
            for (final item in r.items) {
              if ((item.isCopy ||
                      item.label.toLowerCase().contains('điện thoại') ||
                      item.label.toLowerCase().contains('sđt') ||
                      item.label.toLowerCase().contains('phone')) &&
                  item.value.isNotEmpty &&
                  item.value != '--') {
                hasFallbackPhone = true;
                break;
              }
            }
            if (hasFallbackPhone) break;
          }
          if (hasPhoneVal || hasFallbackPhone) {
            validActions.add(actionItem);
          }
        } else {
          validActions.add(actionItem);
        }
      }
    }

    final showContactBlock = contactEntry != null &&
        (validActions.isNotEmpty ||
            (onPhoneTap != null && hasPhoneIcon) ||
            (onChatTap != null && hasChatIcon));

    return CardV2(
      title: hasSubtitle ? null : resolvedTitle,
      padding: padding ?? const EdgeInsets.all(DimensV2.d20),
      borderRadius: borderRadius ?? AppRadiusV2.x3l,
      icon: hasSubtitle ? null : (localHasIcon ? resolvedIcon : null),
      avatar: hasSubtitle ? null : (resolvedHasAvatar ? resolvedAvatar : null),
      hasAvatar: hasSubtitle
          ? null
          : (resolvedHasAvatar
              ? true
              : (localHasIcon
                  ? null
                  : (entity?.hasAvatar == false ? false : null))),
      onTap: resolvedOnTap,
      isShowArrow: showArrow,
      borderColor: borderColor,
      shadowColor: shadowColor,
      colorBackground: colorBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasSubtitle) ...[
            if (isImageHeader)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (localHasIcon) ...[
                    GestureDetector(
                      onTap: _handleImageTap(context, resolvedIcon, resolvedTitle),
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadiusV2.md),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: _buildFoodImage(context, resolvedIcon),
                      ),
                    ),
                    const SizedBox(width: AppSpacingV2.sm),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          resolvedTitle,
                          style: AppTextStylesV2.text16Semibold.copyWith(
                            color: colors.txContentPrimaryDefault,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: AppSpacingV2.x3s),
                        Text(
                          resolvedSubtitle,
                          style: AppTextStylesV2.text13Medium.copyWith(
                            color: colors.txContentSecondaryDefault,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (resolvedHasAvatar) ...[
                        ThemedIconCircleV2(
                          variant: ThemedIconCircleVariant.avatar,
                          url: resolvedAvatar,
                        ),
                        const SizedBox(width: AppSpacingV2.xs),
                      ] else if (localHasIcon) ...[
                        ThemedIconCircleV2(
                          variant: ThemedIconCircleVariant.icon,
                          url: _isNetworkIcon(resolvedIcon) ? resolvedIcon : null,
                        ),
                        const SizedBox(width: AppSpacingV2.xs),
                      ],
                      Expanded(
                        child: Text(
                          resolvedTitle,
                          style: AppTextStylesV2.text16Semibold.copyWith(
                            color: colors.txContentPrimaryDefault,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacingV2.x2s),
                  Text(
                    resolvedSubtitle,
                    style: AppTextStylesV2.text13Medium.copyWith(
                      color: colors.txContentTertiary,
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: (processedRows.isNotEmpty &&
                      processedRows.first.items.isNotEmpty &&
                      processedRows.first.items.first.label.isEmpty &&
                      processedRows.first.items.first.badge != null)
                  ? AppSpacingV2.xs
                  : headerSpacing,
            ),
          ],
          for (var i = 0; i < processedRows.length; i++) ...[
            if (i > 0) SizedBox(height: rowSpacing),
            CardInfoRowV2(
              items: processedRows[i].items,
              itemSpacing: itemSpacing,
            ),
          ],
          if (showContactBlock) ...[
            if (contactEntry!.showDivider)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacingV2.sm),
                child: CommonDividerV2(),
              ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    contactEntry.label,
                    style: AppTextStylesV2.text13Medium.copyWith(
                      color: colors.txContentSecondaryDefault,
                    ),
                  ),
                ),
                if (validActions.isNotEmpty)
                  Builder(
                    builder: (context) {
                      final buttons = validActions.asMap().entries.map((entry) {
                        final actionItem = entry.value;
                        return _PressIconButton(
                          icon: actionItem.url,
                          onTap: () {
                            onActionTap?.call(actionItem.action, contactEntry!.value);
                          },
                        );
                      }).toList();

                      return SizedBox(
                        width: 50.0 + (buttons.length - 1) * 46.0,
                        height: 50.0,
                        child: Stack(
                          children: [
                            for (var i = 0; i < buttons.length; i++)
                              Positioned(
                                left: i * 46.0,
                                top: 0,
                                bottom: 0,
                                child: buttons[i],
                              ),
                          ],
                        ),
                      );
                    },
                  )
                else ...[
                  Builder(
                    builder: (context) {
                      final List<Widget> buttons = [];
                      if (onPhoneTap != null && hasPhoneIcon) {
                        buttons.add(
                          _PressIconButton(
                            icon: contactEntry!.iconPhone!,
                            onTap: () {
                              var phoneNumber = '';
                              for (final r in resolvedRows) {
                                for (final item in r.items) {
                                  if (item.isCopy && item.value.isNotEmpty) {
                                    phoneNumber = item.value;
                                    break;
                                  }
                                }
                                if (phoneNumber.isNotEmpty) {
                                  break;
                                }
                              }
                              onPhoneTap!(phoneNumber);
                            },
                          ),
                        );
                      }
                      if (onChatTap != null && hasChatIcon) {
                        buttons.add(
                          _PressIconButton(
                            icon: contactEntry!.iconChat!,
                            onTap: onChatTap!,
                          ),
                        );
                      }

                      if (buttons.isEmpty) return const SizedBox.shrink();

                      return SizedBox(
                        width: 50.0 + (buttons.length - 1) * 46.0,
                        height: 50.0,
                        child: Stack(
                          children: [
                            for (var i = 0; i < buttons.length; i++)
                              Positioned(
                                left: i * 46.0,
                                top: 0,
                                bottom: 0,
                                child: buttons[i],
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFoodImage(BuildContext context, String url) {
    return AdaptiveImageV2(
      url: url,
      fit: BoxFit.cover,
      enableCache: true,
    );
  }

  VoidCallback? _handleImageTap(BuildContext context, String? resolvedIcon, String resolvedTitle) {
    if (!enableImageTap) return null;
    if (onImageTap != null) {
      return onImageTap;
    }
    if (resolvedIcon != null && _isNetworkIcon(resolvedIcon)) {
      return () {
        Navigator.push(
          context,
          PageRouteBuilder<void>(
            opaque: false,
            pageBuilder: (context, animation, secondaryAnimation) =>
                ExtendImageViewWidgetV2(url: resolvedIcon, title: resolvedTitle),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 150),
            reverseTransitionDuration: const Duration(milliseconds: 150),
          ),
        );
      };
    }
    return null;
  }
}

class _PressIconButton extends StatefulWidget {
  const _PressIconButton({
    required this.icon,
    required this.onTap,
  });

  final String icon;
  final VoidCallback onTap;

  @override
  State<_PressIconButton> createState() => _PressIconButtonState();
}

class _PressIconButtonState extends State<_PressIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = colors.bgIconTertiary;
    final pressedColor = isDark ? AppColorsV2.neutral600 : AppColorsV2.neutral200;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) async {
        widget.onTap();
        await Future.delayed(const Duration(milliseconds: 120));
        if (mounted) {
          setState(() => _isPressed = false);
        }
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: _isPressed ? 20 : 180),
        decoration: BoxDecoration(
          color: _isPressed
              ? (isDark
                  ? AppColorsV2.genericWhite.withAlpha(20)
                  : AppColorsV2.genericBlack.withAlpha(12))
              : AppColorsV2.transparent,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.symmetric(horizontal: DimensV2.d8),
        child: AnimatedContainer(
          duration: Duration(milliseconds: _isPressed ? 20 : 180),
          width: DimensV2.d34,
          height: DimensV2.d34,
          decoration: BoxDecoration(
            color: _isPressed ? pressedColor : baseColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.network(
              widget.icon,
              width: DimensV2.d18,
              height: DimensV2.d18,
              colorFilter: ColorFilter.mode(
                colors.tertiaryText,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

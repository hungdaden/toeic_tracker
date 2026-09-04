import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../may_uikit.dart';

/// Interface representing detail icon information for CardInfo.
abstract class CardInfoDetailIconEntityV2 {
  /// The icon URL.
  String? get url;

  /// The action identifier.
  String? get action;
}

/// Interface representing badge information for CardInfo.
abstract class CardInfoBadgeEntityV2 {
  /// The badge label or title.
  String? get title;

  /// The badge content or fallback label.
  String? get content;

  /// The badge type code (defining status color).
  String? get badgeType;
}

/// Interface representing bottom contact info for CardInfo.
abstract class CardInfoBottomInfoEntityV2 {
  /// The bottom info label or title.
  String? get title;

  /// The bottom info subTitle or content.
  String? get subTitle;

  /// Optional avatar URL.
  String? get avatarUrl;

  /// Whether it represents a contact item.
  bool? get isContact;

  /// Whether to render a divider.
  bool? get showDivider;

  /// List of action icons/buttons.
  List<CardInfoDetailIconEntityV2>? get icon;
}

/// Interface representing detail entries within a CardInfo.
abstract class CardInfoDetailEntityV2 {
  /// The entry label or title.
  String? get title;

  /// The entry content or value.
  String? get content;

  /// Whether to display a bottom separator line.
  bool? get showDivider;

  /// Whether the entry should span the full width of the card.
  bool? get isBreakLine;

  /// Whether text content should be aligned justify.
  bool? get isJustify;

  /// Optional badge type.
  String? get badgeType;

  /// Whether it is a action/contact block item.
  bool? get isActionItem;

  /// Optional image URL to display next to content value.
  String? get imageUrl;

  CardInfoBadgeEntityV2? get badge;

  /// List of detail icons or actions.
  List<CardInfoDetailIconEntityV2>? get icon;
}

/// Interface representing the model entity used in [CardInfoV2].
abstract class CardInfoEntityV2<T extends CardInfoDetailEntityV2> {
  /// The header title.
  String? get title;

  /// The header subTitle.
  String? get subTitle;

  /// The header content (acts as subtitle fallback).
  String? get content;

  /// The header image URL.
  String? get imageUrl;

  /// Whether tapping the card navigates to a detail page.
  bool? get isNext;

  /// List of info entries.
  List<T>? get details;

  /// Optional badge.
  CardInfoBadgeEntityV2? get badge;

  /// Optional bottom action block.
  CardInfoBottomInfoEntityV2? get bottomInfo;

  /// Optional avatar URL.
  String? get avatarUrl;

  /// Optional avatar name.
  String? get avatarName;

  /// Whether entity has avatar.
  bool? get hasAvatar => null;

  /// Whether to show a divider under the card title.
  bool? get showDivider => null;
}

/// Data representing a group of card info entries, optionally including a title and an avatar.
class CardInfoGroupData {
  /// Creates a [CardInfoGroupData] with the given [items], [title], and [avatar].
  const CardInfoGroupData({
    required this.items,
    this.title,
    this.avatar,
  });

  /// The list of info entries to display in the group.
  final List<CardInfoEntry> items;

  /// Optional title for the group header.
  final String? title;

  /// Optional avatar URL for the group header.
  final String? avatar;
}

@Deprecated('Use CardInfoGroupData instead')
typedef RegistrationInfoRowData = CardInfoGroupData;

/// Loại card info dùng để phân loại hiển thị trong [CardInfoV2].
enum CardInfoType {
  /// No specific card info type.
  none,

  /// Card info type for registration details.
  registrationInfo,

  /// Card info type for fee details.
  fee,
}

/// Dữ liệu badge hiển thị trong header của [CardInfoV2].
///
/// [label] là nội dung văn bản của badge.
/// [status] quy định màu sắc và kiểu hiển thị.
class CardInfoBadgeData {
  /// Creates a [CardInfoBadgeData] with the given [label] and [status].
  const CardInfoBadgeData({
    required this.label,
    this.status = AppBadgeStatus.defaultBadge,
    this.showIcon = true,
  });

  /// The text label displayed inside the badge.
  final String label;

  /// The visual status configuration for the badge.
  final AppBadgeStatus status;

  /// Whether to render the leading status icon in the badge.
  final bool showIcon;
}

/// A card layout component featuring structured info rows and contact actions.
class CardInfoV2 extends StatelessWidget {
  /// Creates a [CardInfoV2] with customized styling parameters and information rows.
  const CardInfoV2({
    super.key,
    this.entity,
    this.title,
    this.subtitle,
    this.rows,
    this.borderRadius,
    this.padding,
    this.backgroundOpacity = 0,
    this.rowSpacing = DimensV2.d12,
    this.headerSpacing = DimensV2.d12,
    this.itemSpacing = DimensV2.d12,
    this.boxShadow,
    this.badge,
    this.onTap,
    this.icon,
    this.avatar,
    this.avatarName,
    this.avatarUrl,
    this.hasAvatar,
    this.onPhoneTap,
    this.onChatTap,
    this.onActionTap,
    this.isImageHeader = false,
    this.onImageTap,
    this.enableImageTap = true,
    this.hasBorder = true,
    this.hasShadow = true,
    this.colorBackground,
    this.showDivider,
  });

  /// Optional entity model containing all details.
  final CardInfoEntityV2<CardInfoDetailEntityV2>? entity;

  /// Callback khi nhấn nút gọi điện.
  final ValueChanged<String>? onPhoneTap;

  /// Callback khi nhấn nút nhắn tin.
  final VoidCallback? onChatTap;

  /// Callback khi nhấn nút hành động bất kỳ.
  final void Function(CardInfoActionType action, String value)? onActionTap;

  /// Badge hiển thị ở header.
  final CardInfoBadgeData? badge;

  /// Callback khi nhấn vào phần tiêu đề (nếu có, sẽ hiển thị icon mũi tên).
  final VoidCallback? onTap;

  /// Tiêu đề hiển thị phía trên cùng của card.
  final String? title;

  /// Nội dung phụ đề nổi bật dưới title, ví dụ số tiền.
  final String? subtitle;

  /// Danh sách các nhóm dữ liệu thông tin hiển thị trên card.
  final List<CardInfoGroupData>? rows;

  /// Border radius của card. Mặc định [AppRadiusV2.x3l].
  final double? borderRadius;

  /// Padding bên trong card. Mặc định `EdgeInsets.all(DimensV2.d20)`.
  final EdgeInsetsGeometry? padding;

  /// Độ trong suốt của ảnh nền. Mặc định `0.1`.
  final double backgroundOpacity;

  /// Khoảng cách giữa các hàng. Mặc định [DimensV2.d12].
  final double rowSpacing;

  /// Khoảng cách giữa tiêu đề và hàng đầu tiên khi có subtitle.
  /// Mặc định [DimensV2.d12].
  final double headerSpacing;

  /// Khoảng cách giữa các item trong cùng một hàng.
  final double itemSpacing;

  /// Shadow của card.
  final List<BoxShadow>? boxShadow;
  final bool hasShadow;

  /// Icon hiển thị ở header.
  final String? icon;

  /// URL ảnh avatar hiển thị ở header.
  final String? avatar;

  /// Tên hiển thị cạnh avatar ở cuối card.
  final String? avatarName;

  /// URL ảnh avatar hiển thị ở cuối card.
  final String? avatarUrl;

  /// Cờ hiển thị avatar/icon (từ API).
  final bool? hasAvatar;

  /// Cờ đánh dấu card info hiển thị hình ảnh lớn.
  final bool isImageHeader;

  /// Callback khi nhấn vào ảnh/icon thức ăn.
  final VoidCallback? onImageTap;

  /// Cho phép nhấn vào ảnh để phóng to hay không.
  final bool enableImageTap;

  /// Có hiển thị viền (border) hay không.
  final bool hasBorder;

  /// Màu nền của card.
  final Color? colorBackground;

  /// Hiển thị đường kẻ phân cách ở dưới title hay không.
  final bool? showDivider;

  bool _isNetworkIcon(String? value) {
    if (value == null || value.trim().isEmpty) return false;
    final uri = Uri.tryParse(value);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  String _extractPhoneNumberFromRows(List<CardInfoGroupData> groups, String fallbackValue) {
    final cleanVal = fallbackValue.trim();

    ///
    bool isPhone(String s) {
      final clean = s.replaceAll(RegExp(r'[\s\+\-\(\)]'), '');
      return clean.length >= 8 && int.tryParse(clean) != null;
    }

    if (isPhone(cleanVal)) {
      return cleanVal;
    }

    for (final group in groups) {
      for (final item in group.items) {
        final content = item.value.trim();
        if (content.isNotEmpty && content != '--' && isPhone(content)) {
          final label = item.label.toLowerCase();
          if (item.isCopy ||
              label.contains('điện thoại') ||
              label.contains('sđt') ||
              label.contains('phone') ||
              label.contains('liên hệ')) {
            return content;
          }
        }
      }
    }

    for (final group in groups) {
      for (final item in group.items) {
        final content = item.value.trim();
        if (content.isNotEmpty && content != '--' && isPhone(content)) {
          return content;
        }
      }
    }

    return cleanVal;
  }

  /// Builds the card info layout with an optional header and structured rows.
  @override
  Widget build(BuildContext context) {
    final resolvedTitle = title ?? entity?.title ?? '';
    final resolvedSubtitle = subtitle ?? entity?.subTitle ?? entity?.content;

    final List<CardInfoGroupData> resolvedRows;
    if (rows != null) {
      resolvedRows = rows!;
    } else if (entity != null) {
      final List<CardInfoEntry> entries = [];
      if (entity!.details != null) {
        for (final detail in entity!.details!) {
          final actions = detail.icon
              ?.map((ico) => CardInfoAction(
                    url: ico.url ?? '',
                    action: CardInfoActionType.fromCode(ico.action),
                  ))
              .toList();

          CardInfoAction? copyAction;
          final isValValid = (detail.content ?? '').isNotEmpty && (detail.content ?? '') != '--';
          if (actions != null && isValValid) {
            for (final a in actions) {
              if (a.action == CardInfoActionType.copy) {
                copyAction = a;
                break;
              }
            }
          }

          entries.add(CardInfoEntry(
            label: detail.title ?? '',
            value: detail.content ?? '',
            showDivider: detail.showDivider ?? false,
            isFullRow: detail.isBreakLine ?? false,
            isJustify: detail.isJustify ?? false,
            isActionItem: detail.isActionItem ?? false,
            imageUrl:
                (detail.imageUrl != null && detail.imageUrl!.isNotEmpty) ? detail.imageUrl : null,
            isCopy: copyAction != null,
            iconUrl: copyAction?.url,
            onCopyTap: copyAction != null
                ? () => onActionTap?.call(CardInfoActionType.copy, detail.content ?? '')
                : null,
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

    final resolvedIcon = icon ?? entity?.imageUrl;
    final resolvedAvatar = avatar ?? entity?.imageUrl;
    final rawBottomAvatarName = (avatarName ?? entity?.avatarName)?.trim() ?? '';
    final rawBottomAvatarUrl = (avatarUrl ?? entity?.avatarUrl)?.trim() ?? '';
    final hasSwappedBottomAvatarValues =
        _isNetworkIcon(rawBottomAvatarName) && !_isNetworkIcon(rawBottomAvatarUrl);
    final resolvedBottomAvatarName =
        hasSwappedBottomAvatarValues ? rawBottomAvatarUrl : rawBottomAvatarName;
    final resolvedBottomAvatarUrl =
        hasSwappedBottomAvatarValues ? rawBottomAvatarName : rawBottomAvatarUrl;
    final hasBottomAvatar =
        resolvedBottomAvatarName.isNotEmpty || resolvedBottomAvatarUrl.isNotEmpty;
    final bool isSvg = resolvedAvatar != null && resolvedAvatar.toLowerCase().contains('.svg');
    final bool isExplicitlyNoAvatar =
        (hasAvatar == false) || (hasAvatar == null && entity?.hasAvatar == false);

    final resolvedHasAvatar = !isExplicitlyNoAvatar &&
        ((hasAvatar == true) ||
            (entity?.hasAvatar == true) ||
            (entity?.imageUrl != null && !isSvg));

    final resolvedOnTap = onTap;
    final showArrow = resolvedOnTap != null || entity?.isNext == true;

    final hasSubtitle = resolvedSubtitle != null && resolvedSubtitle.isNotEmpty;
    final colors = context.mayColors;

    final localHasIcon = !isExplicitlyNoAvatar &&
        (isSvg || icon != null) &&
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

    // Kiểm tra tính hợp lệ của icon từ BE gửi về (không null và không rỗng)
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

    final hasContentBeforeBottomAvatar = processedRows.isNotEmpty || showContactBlock;

    final resolvedShowDivider = showDivider ?? entity?.showDivider ?? false;
    final useLargeSubtitleHeader = hasSubtitle && !isImageHeader;
    final resolvedCardHasAvatar = useLargeSubtitleHeader
        ? null
        : (isImageHeader
            ? false
            : (resolvedHasAvatar
                ? true
                : (localHasIcon
                    ? null
                    : (hasAvatar == false || entity?.hasAvatar == false ? false : null))));
    final headerLeading = isImageHeader && localHasIcon
        ? GestureDetector(
            onTap: _handleImageTap(context, resolvedIcon, resolvedTitle),
            child: Container(
              width: DimensV2.d60,
              height: DimensV2.d60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadiusV2.md),
              ),
              clipBehavior: Clip.antiAlias,
              child: _buildFoodImage(context, resolvedIcon),
            ),
          )
        : null;

    return CardV2(
      shadowColor: hasShadow ? null : AppColorsV2.transparent,
      title: useLargeSubtitleHeader ? null : resolvedTitle,
      subtitle: hasSubtitle && isImageHeader ? resolvedSubtitle : null,
      headerLeading: useLargeSubtitleHeader ? null : headerLeading,
      headerBodyGap: hasSubtitle && resolvedShowDivider ? 0 : headerSpacing,
      padding: padding ?? const EdgeInsets.all(DimensV2.d20),
      borderRadius: borderRadius ?? AppRadiusV2.x3l,
      icon: useLargeSubtitleHeader ? null : (!isImageHeader && localHasIcon ? resolvedIcon : null),
      avatar: useLargeSubtitleHeader
          ? null
          : (!isImageHeader && resolvedHasAvatar ? resolvedAvatar : null),
      hasAvatar: resolvedCardHasAvatar,
      onTap: resolvedOnTap,
      isShowArrow: showArrow,
      borderColor: hasBorder ? null : AppColorsV2.transparent,
      colorBackground: colorBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (useLargeSubtitleHeader) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStylesV2.text14Medium.copyWith(
                          color: colors.txContentSecondaryDefault,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacingV2.x2s),
                Text(
                  resolvedSubtitle,
                  style: AppTextStylesV2.title20SemiBold.copyWith(
                    color: colors.txContentPrimaryDefault,
                  ),
                ),
              ],
            ),
            if (resolvedShowDivider)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: DimensV2.d12),
                child: CommonDividerV2(),
              )
            else
              SizedBox(height: headerSpacing),
          ] else if (resolvedShowDivider && resolvedTitle.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.only(
                top: hasSubtitle ? DimensV2.d12 : 0,
                bottom: DimensV2.d12,
              ),
              child: CommonDividerV2(),
            ),
          ],
          for (var i = 0; i < processedRows.length; i++) ...[
            if (i > 0) SizedBox(height: rowSpacing),
            CardInfoRowV2(
              items: processedRows[i].items,
              itemSpacing: itemSpacing,
              isSingleItem: processedRows.length == 1 &&
                  processedRows[i].items.length == 1 &&
                  !showContactBlock,
            ),
          ],
          if (showContactBlock) ...[
            if (contactEntry.showDivider)
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
                            var actionValue = contactEntry!.value;
                            if (actionItem.action == CardInfoActionType.phone) {
                              actionValue =
                                  _extractPhoneNumberFromRows(resolvedRows, contactEntry.value);
                            }
                            onActionTap?.call(actionItem.action, actionValue);
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
                              final phoneNumber =
                                  _extractPhoneNumberFromRows(resolvedRows, contactEntry!.value);
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
          if (hasBottomAvatar) ...[
            if (hasContentBeforeBottomAvatar) SizedBox(height: rowSpacing),
            Row(
              children: [
                SizedBox(
                  width: DimensV2.d24,
                  height: DimensV2.d24,
                  child: CommonAvatarV2(
                    imageUrl: resolvedBottomAvatarUrl,
                    radius: DimensV2.d24,
                  ),
                ),
                const SizedBox(width: AppSpacingV2.xs),
                Expanded(
                  child: Text(
                    resolvedBottomAvatarName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStylesV2.text13Medium.copyWith(
                      color: colors.txContentSecondaryDefault,
                    ),
                  ),
                ),
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

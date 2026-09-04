import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../may_uikit.dart';
import '../../resources/generated/assets.gen.dart';

/// A generic card widget for displaying a profile's status, including an avatar, name, and badge.
class StudentCardV2 extends StatelessWidget {
  const StudentCardV2({
    super.key,
    required this.name,
    this.subTitle,
    this.avatarUrl,
    this.onTap,
    this.cardData = const [],
    this.reportFields,
    this.showTrailingArrow = true,
    this.redDot = false,
  });

  final String name;

  /// Optional subtitle shown below the name (e.g., class and student code).
  final String? subTitle;

  final String? avatarUrl;
  final VoidCallback? onTap;
  final bool showTrailingArrow;
  final bool redDot;

  /// Additional data rows to render as subtitles (e.g., class, room, start date, etc.)
  final List<CardDataV2> cardData;

  /// List of report fields to render at the bottom of the card.
  final List<ReportFieldDataV2>? reportFields;

  /// Builds the widget tree for this card using [context].
  @override
  Widget build(BuildContext context) {
    final infoItems = cardData
        .where((e) => e.isCustomContent || e.label.trim().isNotEmpty || e.content.trim().isNotEmpty)
        .map(_ProfileStatusInfoItem.data)
        .toList();

    final card = CardV2(
      onTap: onTap,
      padding: const EdgeInsets.all(DimensV2.d20),
      borderRadius: AppRadiusV2.x3l,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    CommonAvatarV2(
                      imageUrl: avatarUrl ?? '',
                      radius: DimensV2.d40,
                    ),
                    const SizedBox(width: DimensV2.d8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStylesV2.text16Semibold.copyWith(
                              color: context.mayColors.txContentPrimaryDefault,
                            ),
                          ),
                          if (subTitle != null && subTitle!.trim().isNotEmpty) ...[
                            const SizedBox(height: DimensV2.d2),
                            Text(
                              subTitle!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStylesV2.text13Medium.copyWith(
                                color: context.mayColors.txContentTertiary,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (onTap != null && showTrailingArrow) ...[
                const SizedBox(width: DimensV2.d12),
                _ProfileStatusTrailingArrow(onTap: onTap),
              ],
            ],
          ),
          if (infoItems.isNotEmpty) ...[
            const SizedBox(height: DimensV2.d12),
            ..._buildInfoRows(infoItems),
          ],
          if (reportFields != null &&
              reportFields!
                  .any((e) => e.title.trim().isNotEmpty || e.content.trim().isNotEmpty)) ...[
            const SizedBox(height: DimensV2.d16),
            ReportFieldV2(
              items: reportFields!
                  .where((e) => e.title.trim().isNotEmpty || e.content.trim().isNotEmpty)
                  .toList(),
            ),
          ],
        ],
      ),
    );

    if (redDot) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          card,
          const Positioned(
            right: AppSpacingV2.md,
            bottom: AppSpacingV2.md,
            child: _RedDot(),
          ),
        ],
      );
    }

    return card;
  }

  List<Widget> _buildInfoRows(List<_ProfileStatusInfoItem> items) {
    final rows = <Widget>[];

    for (var index = 0; index < items.length;) {
      if (rows.isNotEmpty) {
        rows.add(const SizedBox(height: DimensV2.d12));
      }

      final leading = items[index];

      if (leading.isFullRow) {
        rows.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _ProfileStatusInfoCell(item: leading)),
            ],
          ),
        );
        index++;
      } else {
        final trailing =
            (index + 1 < items.length && !items[index + 1].isFullRow) ? items[index + 1] : null;

        rows.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _ProfileStatusInfoCell(item: leading)),
              const SizedBox(width: DimensV2.d12),
              Expanded(
                child: trailing != null
                    ? _ProfileStatusInfoCell(item: trailing)
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        );
        index += (trailing != null) ? 2 : 1;
      }
    }

    return rows;
  }
}

class _ProfileStatusTrailingArrow extends StatelessWidget {
  const _ProfileStatusTrailingArrow({this.onTap});

  final VoidCallback? onTap;

  /// Builds the trailing arrow widget using the provided [context].
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: DimensV2.d28,
        height: DimensV2.d28,
        decoration: BoxDecoration(
          color: context.mayColors.bgIcon,
          borderRadius: BorderRadius.circular(AppRadiusV2.full),
        ),
        child: Center(
          child: SvgPicture.asset(
            Assets.icons.icArrowRight.keyName,
            width: DimensV2.d12,
            height: DimensV2.d12,
            colorFilter: ColorFilter.mode(
              context.mayColors.icColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileStatusInfoItem {
  const _ProfileStatusInfoItem._({
    required this.label,
    this.value = '',
    this.badgeStatus,
    this.customContent,
    this.iconSvgPath,
    this.iconUrl,
    this.isCustomContent = false,
    this.isBadge = false,
    this.isFullRow = false,
  });

  factory _ProfileStatusInfoItem.data(CardDataV2 data) {
    return _ProfileStatusInfoItem._(
      label: data.label,
      value: data.content,
      customContent: data.customContent,
      iconSvgPath: data.iconSvgPath,
      iconUrl: data.iconUrl,
      isCustomContent: data.isCustomContent,
      badgeStatus: data.badgeStatus,
      isBadge: data.isBadge,
      isFullRow: data.isFullRow,
    );
  }

  final String label;
  final String value;
  final AppBadgeStatus? badgeStatus;
  final Widget? customContent;
  final String? iconSvgPath;
  final String? iconUrl;
  final bool isCustomContent;
  final bool isBadge;
  final bool isFullRow;
}

class _ProfileStatusInfoCell extends StatelessWidget {
  const _ProfileStatusInfoCell({required this.item});

  final _ProfileStatusInfoItem item;

  /// Builds the information cell widget using the provided [context].
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    if (item.isCustomContent && item.customContent != null) {
      return item.customContent!;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.label,
          style: AppTextStylesV2.text13Medium.copyWith(
            color: colors.txContentSecondaryDefault,
          ),
        ),
        const SizedBox(height: DimensV2.d2),
        if (item.isBadge && item.badgeStatus != null)
          AppBadgeV2(
            status: item.badgeStatus!,
            label: item.value,
          )
        else if ((item.iconUrl?.isNotEmpty ?? false) || (item.iconSvgPath?.isNotEmpty ?? false))
          Row(
            children: [
              if (item.iconUrl?.isNotEmpty ?? false)
                CommonImageV2.network(
                  url: item.iconUrl!,
                  width: DimensV2.d16,
                  height: DimensV2.d16,
                  fit: BoxFit.contain,
                )
              else
                CommonImageV2.svg(
                  path: item.iconSvgPath!,
                  width: DimensV2.d16,
                  height: DimensV2.d16,
                ),
              const SizedBox(width: DimensV2.d4),
              Expanded(
                child: CommonSelectableTextV2(
                  item.value,
                  style: AppTextStylesV2.text14Semibold.copyWith(
                    color: colors.txContentPrimaryDefault,
                  ),
                ),
              ),
            ],
          )
        else
          CommonSelectableTextV2(
            item.value,
            style: AppTextStylesV2.text14Semibold.copyWith(
              color: colors.txContentPrimaryDefault,
            ),
          ),
      ],
    );
  }
}

class _RedDot extends StatelessWidget {
  const _RedDot();

  @override
  ///
  Widget build(BuildContext context) {
    return Container(
      width: DimensV2.d16,
      height: DimensV2.d16,
      decoration: const BoxDecoration(
        color: AppColorsV2.semanticRed600,
        shape: BoxShape.circle,
      ),
    );
  }
}

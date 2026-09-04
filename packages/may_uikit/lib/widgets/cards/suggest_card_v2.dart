import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// Card widget for displaying suggestion/feedback content with response.
///
/// Designed to show one or more content blocks from a [PHXSectionEntity]:
/// - **Suggestion block** (item 0): title, datetime subtitle, description, avatar info
/// - **Response block** (item 1): title, datetime subtitle, description or badge, avatar info
///
/// Each block is rendered from a [PHXSectionItemEntity] with the same layout structure.
/// Blocks are separated by a divider when [PHXSectionItemEntity.showDivider] is `true`.
///
class SuggestCardV2 extends StatelessWidget {
  /// Creates a [SuggestCardV2].
  const SuggestCardV2({
    super.key,
    required this.section,
    this.onTap,
  });

  /// The section entity containing suggestion and response items.
  final PHXSectionEntity section;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  /// Builds the suggest card.
  @override
  Widget build(BuildContext context) {
    final items = section.items ?? [];
    if (items.isEmpty) return const SizedBox.shrink();

    return CardV2(
      borderRadius: AppRadiusV2.x3l,
      padding: const EdgeInsets.all(AppSpacingV2.lg),
      onTap: onTap,
      isShowArrow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < items.length; i++) ...[
            // Divider between blocks (controlled by the previous item's showDivider).
            if (i > 0 && items[i - 1].showDivider == true) ...[
              const SizedBox(height: AppSpacingV2.sm),
              const CommonDividerV2(),
              const SizedBox(height: AppSpacingV2.sm),
            ] else if (i > 0)
              const SizedBox(height: AppSpacingV2.sm),
            _SuggestSectionBlock(item: items[i]),
          ],
        ],
      ),
    );
  }
}

/// Internal widget that renders a single section block (suggestion or response).
class _SuggestSectionBlock extends StatelessWidget {
  const _SuggestSectionBlock({required this.item});

  final PHXSectionItemEntity item;

  bool get _hasTitle => item.title?.isNotEmpty == true;

  bool get _hasSubTitle => item.subTitle?.isNotEmpty == true;

  bool get _hasDescription =>
      item.description != null &&
      item.description!.isNotEmpty &&
      item.description!.first.isNotEmpty;

  bool get _hasAvatar =>
      (item.avatarName?.isNotEmpty == true) || (item.avatarUrl?.isNotEmpty == true);

  bool get _hasBadge =>
      item.badge != null &&
      (item.badge!.title?.isNotEmpty == true || item.badge!.content?.isNotEmpty == true);

  /// Builds the section block widget tree.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Title (e.g. "Nội dung góp ý", "Phản hồi của nhà trường")
        if (_hasTitle)
          Text(
            item.title!,
            style: AppTextStylesV2.text18Semibold.copyWith(
              color: colors.txContentPrimaryDefault,
            ),
          ),

        // Subtitle datetime (e.g. "T5, 06/08/2026 15:41")
        if (_hasSubTitle) ...[
          if (_hasTitle) const SizedBox(height: AppSpacingV2.xs),
          Text(
            item.subTitle!,
            style: AppTextStylesV2.text14Medium.copyWith(
              color: colors.txContentTertiary,
            ),
          ),
        ],

        // Description content
        if (_hasDescription) ...[
          const SizedBox(height: AppSpacingV2.sm),
          Text(
            item.description!.first,
            style: AppTextStylesV2.text16Medium.copyWith(
              color: colors.txContentSecondaryDefault,
            ),
          ),
        ],

        // Badge (shown when there is no description, e.g. "Chưa có phản hồi")
        if (_hasBadge && !_hasDescription) ...[
          const SizedBox(height: AppSpacingV2.xs),
          AppBadgeV2(
            status: AppBadgeStatus.fromCode(item.badge!.badgeType),
            label: item.badge!.title ?? item.badge!.content ?? '',
          ),
        ],

        // Avatar info row
        if (_hasAvatar) ...[
          const SizedBox(height: AppSpacingV2.sm),
          _AvatarInfoRow(item: item),
        ],
      ],
    );
  }
}

/// Internal widget that renders the avatar row with name and subtitle.
///
/// Layout: [Avatar 38px] [8px gap] [Name / Subtitle]
///
/// The subtitle (e.g. "SĐT: 0362501459") is split on ": " to style
/// the label part in medium and the value part in semibold.
class _AvatarInfoRow extends StatelessWidget {
  const _AvatarInfoRow({required this.item});

  final PHXSectionItemEntity item;

  /// Builds the avatar info row.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return Row(
      children: [
        SizedBox(
          width: DimensV2.d38,
          height: DimensV2.d38,
          child: CommonAvatarV2(
            imageUrl: item.avatarUrl ?? '',
            radius: DimensV2.d38,
          ),
        ),
        const SizedBox(width: AppSpacingV2.xs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar name (e.g. "PH. Hồ Ngọc Trang (Demo)")
              if (item.avatarName?.isNotEmpty == true)
                Text(
                  item.avatarName!,
                  style: AppTextStylesV2.text13Semibold.copyWith(
                    color: colors.txContentPrimaryDefault,
                  ),
                ),
              // Avatar subtitle (e.g. "SĐT: 0362501459")
              if (item.avatarSubtitle?.isNotEmpty == true) ...[
                const SizedBox(height: DimensV2.d4),
                _buildAvatarSubtitle(context),
              ],
            ],
          ),
        ),
      ],
    );
  }

  /// Builds a styled subtitle with optional label prefix from [PHXExtraEntity.subLable].
  ///
  /// When `extra.subLable` is present (e.g. "SĐT: "), it is rendered in medium weight
  /// and the `avatarSubtitle` value is rendered in semibold.
  Widget _buildAvatarSubtitle(BuildContext context) {
    final colors = context.mayColors;
    final subtitle = item.avatarSubtitle!;
    final subLable = item.extra?.subLable;

    // When subLable is provided by backend, use it as the label prefix.
    if (subLable != null && subLable.isNotEmpty) {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: subLable,
              style: AppTextStylesV2.text12Medium.copyWith(
                color: colors.txContentTertiary,
              ),
            ),
            TextSpan(
              text: subtitle,
              style: AppTextStylesV2.text12Medium.copyWith(
                color: colors.txContentPrimaryDefault,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return Text(
      subtitle,
      style: AppTextStylesV2.text12Medium.copyWith(
        color: colors.txContentTertiary,
      ),
    );
  }
}


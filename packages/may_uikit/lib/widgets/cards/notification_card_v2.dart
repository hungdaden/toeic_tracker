import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:may_uikit/may_uikit.dart';

import '../../resources/generated/assets.gen.dart';

/// Card for displaying notification items built from [PHXSectionItemEntity].
class NotificationCardV2 extends StatelessWidget {
  /// Creates a notification card from a single [PHXSectionItemEntity].
  const NotificationCardV2({
    super.key,
    required this.entity,
    this.onTap,
  });

  /// The section item entity containing notification details.
  final PHXSectionItemEntity entity;

  /// Callback when the card is tapped.
  final VoidCallback? onTap;

  /// Size of the trailing arrow action button container.
  static const double _arrowContainerSize = DimensV2.d28;

  @override
  /// Builds the notification card layout widget.
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    final avatarUrl = entity.avatarUrl?.trim() ?? '';
    final avatarName = entity.avatarName?.trim() ?? '';
    final avatarSubtitle = entity.avatarSubtitle?.trim() ?? '';
    final hasAvatar = avatarUrl.isNotEmpty || avatarName.isNotEmpty;

    final title = entity.title?.trim() ?? '';
    final subTitle = entity.subTitle?.trim() ?? '';
    final descriptions = entity.description ?? const [];
    final multiBadges = entity.multiBadge ?? const [];
    final showRedDot = entity.redDot ?? false;
    final isNext = entity.isNext ?? (onTap != null);

    final card = PressableCardContainerV2(
      color: colors.bgCard,
      borderColor: colors.bdDefault,
      shadowColor: colors.sdDefault,
      borderRadius: DimensV2.d28,
      onTap: onTap,
      padding: const EdgeInsets.all(DimensV2.d16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Row: Avatar + Avatar Name + Subtitle + Action Arrow
          if (hasAvatar || isNext) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (hasAvatar) ...[
                  CommonAvatarV2(
                    imageUrl: avatarUrl,
                    radius: DimensV2.d24,
                  ),
                  const SizedBox(width: DimensV2.d8),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (avatarName.isNotEmpty)
                        Text(
                          avatarName,
                          style: AppTextStylesV2.text13Semibold.copyWith(
                            color: colors.txContentSecondaryDefault,
                          ),
                          maxLines: 2,
                        ),
                      if (avatarSubtitle.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: DimensV2.d4),
                          child: Text(
                            avatarSubtitle,
                            style: AppTextStylesV2.text12Medium.copyWith(
                              color: colors.txContentTertiary,
                            ),
                            maxLines: 2,
                          ),
                        ),
                    ],
                  ),
                ),
                if (isNext) ...[
                  const SizedBox(width: DimensV2.d8),
                  const _ArrowButton(),
                ],
              ],
            ),
            const SizedBox(height: DimensV2.d8),
          ],

          // Multi Badges Row
          if (multiBadges.isNotEmpty) ...[
            Wrap(
              spacing: DimensV2.d8,
              runSpacing: DimensV2.d4,
              children: multiBadges.map((badge) {
                final text = badge.content ?? badge.title ?? '';
                if (text.isEmpty) return const SizedBox.shrink();

                return AppMultiBadgeV2(
                  label: text,
                  badgeType: badge.badgeType,
                );
              }).toList(),
            ),
            const SizedBox(height: DimensV2.d12),
          ],

          // Title
          if (title.isNotEmpty) ...[
            Text(
              title,
              style: AppTextStylesV2.text15Semibold.copyWith(
                color: colors.txContentPrimaryDefault,
              ),
              maxLines: 10,
            ),
            const SizedBox(height: DimensV2.d4),
          ],

          // Timestamp Subtitle
          if (subTitle.isNotEmpty) ...[
            Text(
              subTitle,
              style: AppTextStylesV2.text12Medium.copyWith(
                color: colors.txContentTertiary,
              ),
            ),
            const SizedBox(height: DimensV2.d8),
          ],

          // Description lines
          if (descriptions.isNotEmpty) ...[
            ...descriptions.map((desc) {
              if (desc.trim().isEmpty) return const SizedBox.shrink();
              return Padding(
                padding: EdgeInsets.only(
                  right:  DimensV2.d20 ,
                  bottom: DimensV2.d4,
                ),
                child: Text(
                  desc,
                  style: AppTextStylesV2.text13Medium.copyWith(
                    color: colors.txContentSecondaryDefault,
                  ),
                ),
              );
            }),
          ],
        ],
      ),
    );

    if (showRedDot) {
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
}

/// Internal widget to render a red dot unread indicator badge.
class _RedDot extends StatelessWidget {
  /// Creates a [_RedDot].
  const _RedDot();

  @override
  /// Builds the red dot container widget.
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

/// Internal widget to render a trailing arrow navigation icon button.
class _ArrowButton extends StatelessWidget {
  /// Creates an [_ArrowButton].
  const _ArrowButton();

  @override
  /// Builds the arrow icon button widget layout.
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final arrowColor = colors.icColor;

    return Container(
      width: NotificationCardV2._arrowContainerSize,
      height: NotificationCardV2._arrowContainerSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors.bgIcon,
      ),
      child: Center(
        child: SvgPicture.asset(
          Assets.icons.icArrowRight.keyName,
          width: DimensV2.d12,
          height: DimensV2.d12,
          colorFilter: ColorFilter.mode(arrowColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:may_uikit/may_uikit.dart';

import '../../resources/generated/assets.gen.dart';

/// Card for a backend-driven content item with icon, text summary, and optional badge.
class ContentStatusCardV2 extends StatelessWidget {
  /// Creates a content status card.
  const ContentStatusCardV2({
    super.key,
    this.iconUrl = '',
    this.subtitle = '',
    this.title = '',
    this.descriptions = const [],
    this.badgeStatus,
    this.badgeLabel,
    this.avatarUrl,
    this.avatarName,
    this.onTap,
    this.redDot = false,
  });

  /// Backend icon URL. Supports SVG, PNG, JPG, and other raster formats.
  /// Falls back to the default content status icon when empty.
  final String iconUrl;

  /// Small text shown above [title]. Hidden when empty.
  final String subtitle;

  /// Main title text. Hidden when empty.
  final String title;

  /// Description lines shown below [title].
  final List<String> descriptions;

  /// Badge visual status mapped by the caller from backend theme/code.
  final AppBadgeStatus? badgeStatus;

  /// Badge text returned by backend.
  final String? badgeLabel;

  /// Optional avatar URL shown below the badge.
  final String? avatarUrl;

  /// Optional avatar name shown below the badge next to the avatar image.
  final String? avatarName;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  /// Whether to display a red dot indicator at the bottom-right corner.
  final bool redDot;

  static const double _arrowContainerSize = DimensV2.d28;

  bool get _hasBadge => badgeStatus != null && (badgeLabel?.isNotEmpty ?? false);

  bool get _hasAvatar =>
      (avatarUrl != null && avatarUrl!.trim().isNotEmpty) ||
      (avatarName != null && avatarName!.trim().isNotEmpty);

  bool get _hasSubtitle => subtitle.trim().isNotEmpty;

  bool get _hasTitle => title.trim().isNotEmpty;

  bool get _hasIcon => iconUrl.trim().isNotEmpty;

  /// Builds the content status card.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final titleColor = colors.txContentPrimaryDefault;
    final supportingTextColor = colors.txContentSecondaryDefault;

    final rightPadding = onTap != null ? (_arrowContainerSize + AppSpacingV2.sm) : 0.0;

    final card = CardV2(
      borderRadius: AppRadiusV2.x3l,
      padding: const EdgeInsets.all(AppSpacingV2.lg),
      onTap: onTap,
      isShowArrow: false,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_hasIcon) ...[
                _ContentStatusIcon(iconUrl: iconUrl),
                const SizedBox(width: AppSpacingV2.sm),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_hasSubtitle)
                      Padding(
                        padding: EdgeInsets.only(right: rightPadding),
                        child: Text(
                          subtitle,
                          style: AppTextStylesV2.text13Medium.copyWith(color: supportingTextColor),
                        ),
                      ),
                    if (_hasSubtitle && _hasTitle) const SizedBox(height: AppSpacingV2.x2s),
                    if (_hasTitle)
                      Padding(
                        padding: EdgeInsets.only(right: rightPadding),
                        child: Text(
                          title,
                          style: AppTextStylesV2.text16Semibold.copyWith(color: titleColor),
                        ),
                      ),
                    if (descriptions.isNotEmpty) ...[
                      const SizedBox(height: AppSpacingV2.xs),
                      for (var index = 0; index < descriptions.length; index++) ...[
                        Text(
                          descriptions[index],
                          style: AppTextStylesV2.text14Medium.copyWith(color: supportingTextColor),
                        ),
                        if (index < descriptions.length - 1)
                          const SizedBox(height: AppSpacingV2.x2s),
                      ],
                    ],
                    if (_hasBadge) ...[
                      const SizedBox(height: AppSpacingV2.xs),
                      AppBadgeV2(
                        status: badgeStatus!,
                        label: badgeLabel!,
                      ),
                    ],
                    if (_hasAvatar) ...[
                      const SizedBox(height: AppSpacingV2.xs),
                      Row(
                        children: [
                          CommonAvatarV2(
                            imageUrl: avatarUrl ?? '',
                            radius: DimensV2.d24,
                          ),
                          const SizedBox(width: AppSpacingV2.xs),
                          Expanded(
                            child: Text(
                              avatarName ?? '',
                              style: AppTextStylesV2.text13Medium
                                  .copyWith(color: colors.txContentSecondaryDefault),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (onTap != null)
            Positioned(
              top: AppSpacingV2.none,
              right: AppSpacingV2.none,
              child: const _ArrowButton(),
            ),
        ],
      ),
    );

    if (redDot) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          card,
          Positioned(
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

class _ContentStatusIcon extends StatelessWidget {
  const _ContentStatusIcon({required this.iconUrl});

  final String iconUrl;

  /// Builds the leading icon container.
  @override
  Widget build(BuildContext context) {
    return ThemedIconCircleV2(
      variant: ThemedIconCircleVariant.icon,
      url: iconUrl,
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton();

  /// Builds the top-right arrow button.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final arrowColor = colors.icColor;

    return Container(
      width: ContentStatusCardV2._arrowContainerSize,
      height: ContentStatusCardV2._arrowContainerSize,
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

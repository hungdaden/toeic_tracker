import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:may_uikit/may_uikit.dart';

/// Card that displays a subject review and reviewer information.
class SubjectReviewCardV2 extends StatelessWidget {
  /// Creates a subject review card.
  const SubjectReviewCardV2({
    super.key,
    required this.title,
    required this.subtitle,
    required this.descriptions,
    this.reviewerName,
    this.reviewerRole,
    this.reviewerAvatarUrl,
    this.isShowPhone = false,
    this.isShowMessage = false,
    this.phoneIconUrl,
    this.messageIconUrl,
    this.actionIcons,
    this.onTapPhone,
    this.onTapMessage,
    this.onTap,
  });

  /// Main review title.
  final String title;

  /// Secondary review text, usually the review time.
  final String subtitle;

  /// Review description lines.
  final List<String> descriptions;

  /// Reviewer display name.
  final String? reviewerName;

  /// Reviewer role or subtitle.
  final String? reviewerRole;

  /// Reviewer avatar URL returned by backend.
  final String? reviewerAvatarUrl;

  /// Whether to show the phone action button.
  final bool isShowPhone;

  /// Whether to show the message action button.
  final bool isShowMessage;

  /// URL for the phone action icon (svg or png). If null or empty, uses default icon.
  final String? phoneIconUrl;

  /// URL for the message action icon (svg or png). If null or empty, uses default icon.
  final String? messageIconUrl;

  /// List of action icons from BE to automatically resolve URLs based on actions ('CHAT', 'PHONE').
  final List<ReviewActionIcon>? actionIcons;

  /// Called when the phone action is tapped.
  final VoidCallback? onTapPhone;

  /// Called when the message action is tapped.
  final VoidCallback? onTapMessage;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  static const double _avatarSize = DimensV2.d38;

  /// Builds the subject review card.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    final resolvedPhoneIconUrl =
        phoneIconUrl ?? actionIcons?.where((e) => e.action == 'PHONE').firstOrNull?.url;
    final resolvedMessageIconUrl =
        messageIconUrl ?? actionIcons?.where((e) => e.action == 'CHAT').firstOrNull?.url;

    final bool hasReviewer = (reviewerName != null && reviewerName!.isNotEmpty) ||
        (reviewerRole != null && reviewerRole!.isNotEmpty) ||
        (reviewerAvatarUrl != null && reviewerAvatarUrl!.isNotEmpty);

    return CardV2(
      borderRadius: AppRadiusV2.x3l,
      padding: const EdgeInsets.all(AppSpacingV2.lg),
      isShowArrow: false,
      width: double.infinity,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTextStylesV2.text18Semibold.copyWith(
              color: colors.txContentPrimaryDefault,
            ),
          ),
          const SizedBox(height: AppSpacingV2.xs),
          Text(
            subtitle,
            style: AppTextStylesV2.text14Medium.copyWith(
              color: colors.txModalDescription,
            ),
          ),
          if (descriptions.isNotEmpty) ...[
            const SizedBox(height: AppSpacingV2.sm),
            for (var index = 0; index < descriptions.length; index++) ...[
              CommonTextV2(
                descriptions[index],
                style: AppTextStylesV2.text14Medium.copyWith(
                  color: colors.txContentSecondaryDefault,
                ),
              ),
              if (index < descriptions.length - 1) const SizedBox(height: AppSpacingV2.x2s),
            ],
          ],
          if (hasReviewer) ...[
            const SizedBox(height: AppSpacingV2.sm),
            CommonDividerV2(dividerColor: AppColorsV2.neutral200),
            const SizedBox(height: AppSpacingV2.sm),
            _SubjectReviewFooter(
              avatarUrl: reviewerAvatarUrl ?? '',
              name: reviewerName ?? '',
              role: reviewerRole ?? '',
              isShowPhone: isShowPhone,
              isShowMessage: isShowMessage,
              phoneIconUrl: resolvedPhoneIconUrl,
              messageIconUrl: resolvedMessageIconUrl,
              onTapPhone: onTapPhone,
              onTapMessage: onTapMessage,
            ),
          ],
        ],
      ),
    );
  }
}

class _SubjectReviewFooter extends StatelessWidget {
  const _SubjectReviewFooter({
    required this.avatarUrl,
    required this.name,
    required this.role,
    this.isShowPhone = false,
    this.isShowMessage = false,
    this.phoneIconUrl,
    this.messageIconUrl,
    this.onTapPhone,
    this.onTapMessage,
  });

  final String avatarUrl;
  final String name;
  final String role;
  final bool isShowPhone;
  final bool isShowMessage;
  final String? phoneIconUrl;
  final String? messageIconUrl;
  final VoidCallback? onTapPhone;
  final VoidCallback? onTapMessage;

  /// Builds the reviewer footer.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonAvatarV2(
          imageUrl: avatarUrl,
          radius: SubjectReviewCardV2._avatarSize,
        ),
        const SizedBox(width: AppSpacingV2.xs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStylesV2.text13Semibold.copyWith(
                  color: colors.txContentPrimaryDefault,
                ),
              ),
              const SizedBox(height: AppSpacingV2.x3s),
              Text(
                role,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStylesV2.subHeadRegular.copyWith(
                  color: colors.txContentSecondaryDefault,
                ),
              ),
            ],
          ),
        ),
        if ((isShowMessage && messageIconUrl != null && messageIconUrl!.isNotEmpty) ||
            (isShowPhone && phoneIconUrl != null && phoneIconUrl!.isNotEmpty)) ...[
          const SizedBox(width: AppSpacingV2.xs),
          if (isShowPhone && phoneIconUrl != null && phoneIconUrl!.isNotEmpty) ...[
            _ReviewPressIconButton(
              iconUrl: phoneIconUrl,
              defaultIcon: Icons.phone_outlined,
              onTap: onTapPhone,
            ),
          ],
          if (isShowMessage &&
              messageIconUrl != null &&
              messageIconUrl!.isNotEmpty &&
              isShowPhone &&
              phoneIconUrl != null &&
              phoneIconUrl!.isNotEmpty)
            const SizedBox(width: AppSpacingV2.xs),
          if (isShowMessage && messageIconUrl != null && messageIconUrl!.isNotEmpty) ...[
            _ReviewPressIconButton(
              iconUrl: messageIconUrl,
              defaultIcon: Icons.chat_bubble_outline_rounded,
              onTap: onTapMessage,
            ),
          ],
        ],
      ],
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String? iconUrl,
    required IconData defaultIcon,
    VoidCallback? onTap,
  }) {
    return _ReviewPressIconButton(
      iconUrl: iconUrl,
      defaultIcon: defaultIcon,
      onTap: onTap,
    );
  }
}

class _ReviewPressIconButton extends StatefulWidget {
  const _ReviewPressIconButton({
    this.iconUrl,
    required this.defaultIcon,
    this.onTap,
  });

  final String? iconUrl;
  final IconData defaultIcon;
  final VoidCallback? onTap;

  /// Creates the state for [_ReviewPressIconButton].
  @override
  State<_ReviewPressIconButton> createState() => _ReviewPressIconButtonState();
}

class _ReviewPressIconButtonState extends State<_ReviewPressIconButton> {
  bool _isPressed = false;

  /// Builds the widget tree for [_ReviewPressIconButton] using the provided [context].
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final active = widget.onTap != null;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = active ? colors.bgIconTertiary : colors.disabledButton;
    final pressedColor = isDark ? AppColorsV2.neutral600 : AppColorsV2.neutral200;
    final iconColor = active ? colors.tertiaryText : colors.disabledText;

    Widget iconWidget;
    if (widget.iconUrl != null && widget.iconUrl!.isNotEmpty) {
      final isSvg = widget.iconUrl!.toLowerCase().endsWith('.svg');
      if (isSvg) {
        iconWidget = SvgPicture.network(
          widget.iconUrl!,
          width: DimensV2.d18,
          height: DimensV2.d18,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        );
      } else {
        iconWidget = CommonImageV2.network(
          url: widget.iconUrl!,
          width: DimensV2.d18,
          height: DimensV2.d18,
          fit: BoxFit.contain,
        );
      }
    } else {
      iconWidget = Icon(
        widget.defaultIcon,
        size: DimensV2.d18,
        color: iconColor,
      );
    }

    return GestureDetector(
      onTapDown: active ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: active
          ? (_) async {
              widget.onTap!();
              await Future.delayed(const Duration(milliseconds: 120));
              if (mounted) {
                setState(() => _isPressed = false);
              }
            }
          : null,
      onTapCancel: active ? () => setState(() => _isPressed = false) : null,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: Duration(milliseconds: _isPressed ? 20 : 180),
        width: DimensV2.d34,
        height: DimensV2.d34,
        decoration: BoxDecoration(
          color: _isPressed ? pressedColor : baseColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: iconWidget,
        ),
      ),
    );
  }
}

/// Action icon configuration for review cards.
class ReviewActionIcon {
  /// The action identifier (e.g. 'CHAT', 'PHONE').
  final String action;

  /// The URL of the icon.
  final String url;

  /// Creates a [ReviewActionIcon].
  const ReviewActionIcon({
    required this.action,
    required this.url,
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../may_uikit.dart';
import '../../resources/generated/assets.gen.dart';

/// Direct list card inspired by the Figma "Card direct" frame.
///
/// The card stacks [CardDirectItemV2] entries vertically inside a single
/// rounded outer container. Each item renders a leading avatar, a
/// title/description body, and a trailing green arrow button.
class CardDirectV2 extends StatelessWidget {
  /// Creates a direct list card populated with the supplied [items].
  const CardDirectV2({
    super.key,
    required this.items,
    this.itemGap = DimensV2.d12,
  });

  /// Child items rendered in declaration order.
  final List<CardDirectItemV2> items;

  /// Vertical gap between successive [CardDirectItemV2] children.
  final double itemGap;

  /// Builds the card by stacking the supplied [items] in a vertical column
  /// separated by [itemGap] of empty space.
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (int i = 0; i < items.length; i++) ...[
          if (i > 0) SizedBox(height: itemGap),
          items[i],
        ],
      ],
    );
  }

  /// Hiển thị [CardDirectV2] dưới dạng modal bottom sheet.
  ///
  /// [title] — tiêu đề hiển thị phía trên danh sách (tuỳ chọn).
  /// [items] — danh sách [CardDirectItemV2] cần hiển thị.
  static Future<void> show(
    BuildContext context, {
    String? title,
    required List<CardDirectItemV2> items,
    double itemGap = DimensV2.d12,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColorsV2.transparent,
      barrierColor: AppColorsV2.genericBlack.withValues(alpha: 0.4),
      builder: (ctx) {
        final colors = ctx.mayColors;

        return Padding(
          padding: const EdgeInsets.all(DimensV2.d16),
          child: Container(
            padding: const EdgeInsets.all(DimensV2.d20),
            decoration: BoxDecoration(
              color: colors.bgCard,
              borderRadius: BorderRadius.circular(DimensV2.d28),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null && title.isNotEmpty) ...[
                  Text(
                    title,
                    style: AppTextStylesV2.text16Semibold.copyWith(
                      color: colors.txContentPrimaryDefault,
                    ),
                  ),
                  const SizedBox(height: DimensV2.d12),
                ],
                CardDirectV2(items: items, itemGap: itemGap),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Single entry used by [CardDirectV2].
///
/// Mirrors the Figma "Teacher items" frame: an optional circular avatar on
/// the left, a two-line body (title + description) in the middle, and a
/// round green arrow button on the right. Each row is wrapped in an
/// [InkWell] so the whole item can be tapped independently.
class CardDirectItemV2 extends StatelessWidget {
  /// Creates a direct-list item.
  const CardDirectItemV2({
    super.key,
    this.avatarUrl,
    this.title = '',
    this.description,
    this.borderRadius = DimensV2.d20,
    this.onTap,
  });

  /// URL of the leading avatar image. When null, an initials fallback is
  /// rendered with [title].
  final String? avatarUrl;

  /// Primary label shown in the body.
  final String title;

  /// Optional secondary label shown below [title].
  final String? description;

  /// Border radius of the row's ink response and (optional) border.
  final double borderRadius;

  /// Optional callback invoked when the item is tapped.
  final VoidCallback? onTap;

  /// Builds a single row consisting of the leading avatar, the body, and
  /// the trailing arrow button wrapped in a [PressableCardContainerV2].
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    Widget content = PressableCardContainerV2(
      pressedOffset: 0,
      borderColor: colors.bdDefault,
      borderRadius: borderRadius,
      child: Padding(
        padding: const EdgeInsets.all(DimensV2.d12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonAvatarV2(
              imageUrl: avatarUrl ?? '',
              radius: DimensV2.d42,
            ),
            SizedBox(width: DimensV2.d8),
            Expanded(
              child: _Body(title: title, description: description),
            ),
            const _ArrowButton(),
          ],
        ),
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: content,
      );
    }

    return content;
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.title, required this.description});

  final String title;
  final String? description;

  /// Renders the optional title and description text in a left-aligned
  /// column with a 2px gap between them when a description is provided.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final hasDescription = description != null && description!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStylesV2.text13Semibold.copyWith(
            color: colors.txContentPrimaryDefault,
          ),
        ),
        if (hasDescription) ...[
          const SizedBox(height: DimensV2.d2),
          Text(
            description!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStylesV2.footNoteRegular.copyWith(
              color: colors.txContentSecondaryDefault,
            ),
          ),
        ],
      ],
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
      width: DimensV2.d28,
      height: DimensV2.d28,
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../may_uikit.dart';
import '../../resources/generated/assets.gen.dart';

/// Single pressable item shown inside [ActionListV2] for the student
/// activity list. Mirrors the Figma node `40019388-7556` body content —
/// badge + title + subtitle + timestamp.
///
/// Arrow/trailing is rendered by [StudentActivityCardListV2] when the item
/// is wrapped, so this widget stays a plain content row that follows the
/// ActionListV2 "child is free" contract.
class StudentActivityItemV2 extends StatelessWidget {
  const StudentActivityItemV2({
    super.key,
    required this.title,
    required this.description,
    this.badgeLabel,
    this.badgeColor,
    this.badgeTextColor,
  });

  final String title;
  final List<String> description;
  final String? badgeLabel;
  final Color? badgeColor;
  final Color? badgeTextColor;

  /// Builds the inner content row for one activity entry.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final titleStyle = AppTextStylesV2.text13Semibold.copyWith(
      color: colors.txContentSecondaryDefault,
    );
    final metaStyle = AppTextStylesV2.subHeadRegular.copyWith(
      color: colors.txContentTertiary,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (badgeLabel != null && badgeLabel!.isNotEmpty) ...[
          _Badge(
            label: badgeLabel!,
            background: badgeColor ?? colors.bgIcon,
            foreground: badgeTextColor ?? colors.icColor,
          ),
          const SizedBox(width: AppSpacingV2.xs),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: titleStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              for (final desc in description) ...[
                const SizedBox(height: AppSpacingV2.x3s),
                Text(
                  desc,
                  style: metaStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.label,
    required this.background,
    required this.foreground,
  });

  final String label;
  final Color background;
  final Color foreground;

  /// Builds the pill badge shown on the left of each item.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacingV2.xs,
        vertical: AppSpacingV2.x2s,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadiusV2.full),
      ),
      child: Text(
        label,
        style: AppTextStylesV2.text13Semibold.copyWith(color: foreground),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _TrailingArrow extends StatelessWidget {
  const _TrailingArrow({required this.background, required this.iconColor});

  final Color background;
  final Color iconColor;

  /// Builds the trailing green icon container with chevron.
  @override
  Widget build(BuildContext context) {
    return Container(
      width: DimensV2.d28,
      height: DimensV2.d28,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadiusV2.full),
      ),
      child: Center(
        child: SvgPicture.asset(
          Assets.icons.icArrowRight.keyName,
          width: DimensV2.d12,
          height: DimensV2.d12,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}

/// Data row for [StudentActivityCardListV2].
class StudentActivityData {
  const StudentActivityData({
    required this.title,
    required this.description,
    this.badgeLabel,
    this.badgeColor,
    this.badgeTextColor,
  });

  final String title;
  final List<String> description;
  final String? badgeLabel;
  final Color? badgeColor;
  final Color? badgeTextColor;
}

/// Data model representing a single student activity card (header + activities list).
class StudentActivityCardData {
  const StudentActivityCardData({
    required this.avatarUrl,
    required this.name,
    required this.classLabel,
    required this.items,
  });

  final String avatarUrl;
  final String name;
  final String classLabel;
  final List<StudentActivityData> items;
}

/// All children (header, divider, items) render inside [ActionListV2].
class StudentActivityCardListV2 extends StatefulWidget {
  const StudentActivityCardListV2({
    super.key,
    required this.cards,
    this.title,
    this.actionLabel,
    this.onActionTap,
    this.emptyIconUrl,
    this.emptyLabel,
    this.onItemTap,
    this.listPadding = const EdgeInsets.all(AppSpacingV2.xs),
    this.borderWidth = DimensV2.d_05,
    this.borderRadius = AppRadiusV2.xl,
  });

  final List<StudentActivityCardData> cards;
  final String? title;
  final String? actionLabel;
  final VoidCallback? onActionTap;
  final String? emptyIconUrl;
  final String? emptyLabel;
  final void Function(int cardIndex, int itemIndex)? onItemTap;
  final EdgeInsetsGeometry listPadding;
  final double borderWidth;
  final double borderRadius;

  /// Creates the state for this student activity card list.
  @override
  State<StudentActivityCardListV2> createState() => _StudentActivityCardListV2State();
}

class _CardRenderInfo {
  _CardRenderInfo({
    required this.data,
    this.isRemoving = false,
  });

  final StudentActivityCardData data;
  bool isRemoving;
}

class _StudentActivityCardListV2State extends State<StudentActivityCardListV2> {
  final List<_CardRenderInfo> _renderedCards = [];

  /// Initializes the state, filtering active cards with non-empty items.
  @override
  void initState() {
    super.initState();
    final activeCards = widget.cards.where((c) => c.items.isNotEmpty).toList();
    _renderedCards.addAll(activeCards.map((c) => _CardRenderInfo(data: c)));
  }

  /// Synchronizes cards when the widget updates with new [oldWidget] configuration.
  @override
  void didUpdateWidget(covariant StudentActivityCardListV2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncCards();
  }

  void _syncCards() {
    final activeCards = widget.cards.where((c) => c.items.isNotEmpty).toList();
    final newNames = activeCards.map((c) => c.name).toList();

    // 1. Mark cards that are no longer present as removing
    for (final cardInfo in _renderedCards) {
      if (!newNames.contains(cardInfo.data.name)) {
        if (!cardInfo.isRemoving) {
          setState(() {
            cardInfo.isRemoving = true;
          });
        }
      }
    }

    // 2. Insert/update new cards
    for (var i = 0; i < activeCards.length; i++) {
      final newCard = activeCards[i];
      final renderedIndex = _renderedCards.indexWhere((c) => c.data.name == newCard.name);

      if (renderedIndex == -1) {
        setState(() {
          _renderedCards.insert(i, _CardRenderInfo(data: newCard));
        });
      } else {
        setState(() {
          _renderedCards[renderedIndex] = _CardRenderInfo(
            data: newCard,
            isRemoving: _renderedCards[renderedIndex].isRemoving,
          );
        });
      }
    }
  }

  /// Builds the widget tree with animated size transitions and a list header.
  @override
  Widget build(BuildContext context) {
    final hasHeader =
        widget.title != null || (widget.actionLabel != null && widget.onActionTap != null);
    final colors = context.mayColors;
    final hasActiveCards = widget.cards.any((c) => c.items.isNotEmpty);

    final content = AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOutCubic,
        switchOutCurve: Curves.easeInOutCubic,
        transitionBuilder: (child, animation) {
          return _NoClipSizeTransition(
            sizeFactor: animation,
            axisAlignment: -1.0,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, -0.15),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          );
        },
        child: !hasActiveCards
            ? RowTabPillListV2(
                key: const ValueKey('student_activity_empty'),
                emptyIconUrl: widget.emptyIconUrl,
                emptyLabel: widget.emptyLabel ?? widget.title,
                emptyOnTap: widget.onActionTap,
              )
            : _buildCardContent(context, colors),
      ),
    );

    if (!hasHeader) return content;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.title != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacingV2.screenHorizontal),
                child: Text(
                  widget.title!,
                  style: AppTextStylesV2.title3SemiBold,
                ),
              ),
            if (widget.actionLabel != null && widget.onActionTap != null)
              GestureContainerV2(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacingV2.screenHorizontal,
                  vertical: AppSpacingV2.sm,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DimensV2.d16),
                ),
                onTap: widget.onActionTap,
                child: Text(
                  widget.actionLabel!,
                  style: AppTextStylesV2.bodyRegular.copyWith(
                    color: colors.icColor,
                  ),
                ),
              ),
          ],
        ),
        content,
      ],
    );
  }

  Widget _buildCardContent(BuildContext context, MayThemeColorsV2 colors) {
    return Padding(
      key: const ValueKey('student_activity_card_content'),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacingV2.screenHorizontal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < _renderedCards.length; i++) ...[
            _buildAnimatedCardItem(context, colors, _renderedCards[i], i),
          ],
        ],
      ),
    );
  }

  Widget _buildAnimatedCardItem(
    BuildContext context,
    MayThemeColorsV2 colors,
    _CardRenderInfo cardInfo,
    int indexInRendered,
  ) {
    final card = cardInfo.data;
    final cardIdx = widget.cards.indexWhere((c) => c.name == card.name);
    final isLastInRendered = indexInRendered == _renderedCards.length - 1;

    return TweenAnimationBuilder<double>(
      key: ValueKey(card.name),
      tween: Tween<double>(
        begin: cardInfo.isRemoving ? 1.0 : 0.0,
        end: cardInfo.isRemoving ? 0.0 : 1.0,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      onEnd: () {
        if (cardInfo.isRemoving) {
          setState(() {
            _renderedCards.remove(cardInfo);
          });
        }
      },
      builder: (context, value, child) {
        if (value == 0.0 && cardInfo.isRemoving) {
          return const SizedBox.shrink();
        }
        return _NoClipSizeTransition(
          sizeFactor: AlwaysStoppedAnimation(value),
          axisAlignment: -1.0,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, -0.15),
              end: Offset.zero,
            ).animate(AlwaysStoppedAnimation(value)),
            child: FadeTransition(
              opacity: AlwaysStoppedAnimation(value),
              child: child,
            ),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ActionListV2(
            padding: widget.listPadding,
            outerPadding: const EdgeInsets.all(AppSpacingV2.md),
            ignorePaddingForFirstChild: true,
            ignorePressForFirstChild: true,
            onTap: widget.onItemTap == null || cardIdx == -1
                ? null
                : (childIndex) =>
                    childIndex >= 1 ? widget.onItemTap!(cardIdx, childIndex - 1) : null,
            children: [
              _Header(
                avatarUrl: card.avatarUrl,
                name: card.name,
                classLabel: card.classLabel,
                padding: const EdgeInsets.all(AppSpacingV2.md),
              ),
              for (var itemIdx = 0; itemIdx < card.items.length; itemIdx++)
                _EntryAnimationWrapper(
                  key: ValueKey(card.items[itemIdx].title),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: StudentActivityItemV2(
                          title: card.items[itemIdx].title,
                          description: card.items[itemIdx].description,
                          badgeLabel: card.items[itemIdx].badgeLabel,
                          badgeColor: card.items[itemIdx].badgeColor,
                          badgeTextColor: card.items[itemIdx].badgeTextColor,
                        ),
                      ),
                      _TrailingArrow(
                        background: colors.bgIcon,
                        iconColor: colors.icColor,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          if (!isLastInRendered) const SizedBox(height: AppSpacingV2.md),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.avatarUrl,
    required this.name,
    required this.classLabel,
    required this.padding,
  });

  final String avatarUrl;
  final String name;
  final String classLabel;
  final EdgeInsetsGeometry padding;

  /// Builds the header row (avatar + name + class label).
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final resolvedPadding = padding.resolve(Directionality.of(context));
    return Column(
      children: [
        Padding(
          padding: resolvedPadding.copyWith(bottom: AppSpacingV2.xs),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonAvatarV2(imageUrl: avatarUrl, radius: DimensV2.d30),
              const SizedBox(width: AppSpacingV2.xs),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        style: AppTextStylesV2.text13Semibold.copyWith(
                          color: colors.txContentPrimaryDefault,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        classLabel,
                        style: AppTextStylesV2.subHeadRegular.copyWith(
                          color: colors.txContentTertiary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacingV2.md),
          child: const CommonDividerV2(),
        ),
      ],
    );
  }
}

class _NoClipSizeTransition extends AnimatedWidget {
  const _NoClipSizeTransition({
    required Animation<double> sizeFactor,
    this.axisAlignment = -1.0,
    this.child,
  }) : super(listenable: sizeFactor);

  final double axisAlignment;
  final Widget? child;

  /// Builds the Align widget using the animated height factor.
  @override
  Widget build(BuildContext context) {
    final Animation<double> sizeFactor = listenable as Animation<double>;
    return Align(
      alignment: AlignmentDirectional(-1.0, axisAlignment),
      heightFactor: sizeFactor.value,
      child: child,
    );
  }
}

class _EntryAnimationWrapper extends StatefulWidget {
  const _EntryAnimationWrapper({required this.child, super.key});

  final Widget child;

  /// Creates the state for the entry animation wrapper.
  @override
  State<_EntryAnimationWrapper> createState() => _EntryAnimationWrapperState();
}

class _EntryAnimationWrapperState extends State<_EntryAnimationWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  /// Initializes the controller and starts the entry animation.
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );
    _controller.forward();
  }

  /// Disposes the animation controller resources.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Builds the slide-in, size-gaining, and fade-in entry animation.
  @override
  Widget build(BuildContext context) {
    return _NoClipSizeTransition(
      sizeFactor: _animation,
      axisAlignment: -1.0,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, -0.15),
          end: Offset.zero,
        ).animate(_animation),
        child: FadeTransition(
          opacity: _animation,
          child: widget.child,
        ),
      ),
    );
  }
}

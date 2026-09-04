import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../may_uikit.dart';
import '../../resources/generated/assets.gen.dart';

/// Per-item data for [DragAndDropListV2] — bundles the label and its leading icon.
class DragAndDropItemData {
  const DragAndDropItemData({
    required this.id,
    required this.label,
    this.leadingIconUrl,
    this.defaultIconUrl,
  });

  /// Stable identifier shared with [RowPinData.id] for the same logical item.
  final String id;

  /// Main label (e.g. "Thứ 2 - 13/04").
  final String label;

  /// Optional URL (svg/png) for the leading icon (next to label).
  final String? leadingIconUrl;

  /// Optional local asset fallback/placeholder URL.
  final String? defaultIconUrl;
}

/// Vertical reorderable list of [DragAndDropItem] cards.
///
/// Long-press the trailing menu icon to drag; tap anywhere else on the card
/// to invoke [DragAndDropItem.onTap].
class DragAndDropListV2 extends StatefulWidget {
  const DragAndDropListV2({
    super.key,
    required this.items,
    required this.onReorder,
    this.totalItemsCount,
    this.headerText,
    this.onTapItem,
    this.onTapClose,
    this.isPinned = true,
    this.isReorderable = true,
    this.showCloseButton = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSpacingV2.screenHorizontal,
    ),
    this.spacing = AppSpacingV2.sm,
  });

  /// Optional total count of items before filtering.
  /// If provided, used to evaluate minimum pin limit (> 4).
  final int? totalItemsCount;

  /// Optional header text rendered above the list
  final String? headerText;

  /// List of tab configurations. Reorder this list from [onReorder] to
  /// persist the new order.
  final List<DragAndDropItemData> items;

  /// Whether to show the close button. If the item count is <= 4,
  /// close buttons are automatically hidden.
  final bool showCloseButton;

  /// Pinned (default) shows the close + drag-handle/menu chips on every item.
  /// Unpinned hides them and renders a trailing arrow instead.
  final bool isPinned;

  /// Whether items can be reordered by dragging.
  /// When false, hides the drag handle icon and disables reordering.
  final bool isReorderable;

  /// Called when the user reorders items. Update the source list in this
  /// callback to persist the new order.
  final ReorderCallback onReorder;

  /// Optional callback fired when a card body (outside the close/menu chips)
  /// is tapped.
  final ValueChanged<int>? onTapItem;

  /// Optional callback fired when the close chip is tapped. The list is the
  /// owner's responsibility to update.
  final ValueChanged<int>? onTapClose;

  /// Outer padding around the list.
  final EdgeInsetsGeometry padding;

  /// Gap between tabs.
  final double spacing;

  /// Returns the state object backing this widget.
  @override
  State<DragAndDropListV2> createState() => _DragAndDropListV2State();
}

class _DragAndDropListV2State extends State<DragAndDropListV2>
    with AutomaticKeepAliveClientMixin<DragAndDropListV2> {
  late List<DragAndDropItemData> _displayItems;
  // Ids that should animate in this frame. Cleared by _EnteringItem onEnd.
  final Set<String> _enteringIds = <String>{};
  final Set<String> _removingIds = <String>{};
  late final ScrollController _innerScrollController;

  bool _isDragging = false;
  double _scrollDirection = 0.0;
  double _scrollIntensity = 0.0;
  bool _isAutoScrolling = false;

  @override
  bool get wantKeepAlive => true;

  /// Marks all current item ids as entering on first build so they animate in.
  @override
  void initState() {
    super.initState();
    _innerScrollController = ScrollController();
    _displayItems = List<DragAndDropItemData>.from(widget.items);
  }

  /// Disposes of the resources used by this state, including the inner scroll controller.
  @override
  void dispose() {
    _stopAutoScroll();
    _innerScrollController.dispose();
    super.dispose();
  }

  void _handlePointerMove(PointerMoveEvent event) {
    if (!_isDragging) return;
    final ScrollableState? scrollable = Scrollable.maybeOf(context);
    if (scrollable == null || !scrollable.mounted) return;
    final RenderBox? renderBox = scrollable.context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final Offset localOffset = renderBox.globalToLocal(event.position);
    final double viewportHeight = renderBox.size.height;
    final double y = localOffset.dy;

    final double threshold = 80.0;
    if (y < threshold) {
      _scrollDirection = -1.0;
      _scrollIntensity = ((threshold - y) / threshold).clamp(0.0, 1.0);
      _startAutoScroll(scrollable);
    } else if (y > viewportHeight - threshold) {
      _scrollDirection = 1.0;
      _scrollIntensity = ((y - (viewportHeight - threshold)) / threshold).clamp(0.0, 1.0);
      _startAutoScroll(scrollable);
    } else {
      _stopAutoScroll();
    }
  }

  void _handlePointerUpOrCancel(PointerEvent event) {
    if (_isDragging) {
      setState(() {
        _isDragging = false;
      });
    }
    _stopAutoScroll();
  }

  void _startAutoScroll(ScrollableState scrollable) {
    if (_isAutoScrolling) return;
    _isAutoScrolling = true;
    _runAutoScroll(scrollable);
  }

  void _runAutoScroll(ScrollableState scrollable) {
    if (!_isDragging || !_isAutoScrolling || _scrollDirection == 0) {
      _isAutoScrolling = false;
      return;
    }

    try {
      final position = scrollable.position;
      final double maxSpeed = 1200.0;
      final double currentSpeed = maxSpeed * _scrollIntensity;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_isAutoScrolling || !scrollable.mounted) return;
        try {
          final currentPosition = position.pixels;
          final double delta = _scrollDirection * currentSpeed * 0.016;
          final double targetPosition = (currentPosition + delta).clamp(
            position.minScrollExtent,
            position.maxScrollExtent,
          );

          if (targetPosition != currentPosition) {
            position.jumpTo(targetPosition);
          }
        } catch (_) {}
        _runAutoScroll(scrollable);
      });
    } catch (_) {
      _isAutoScrolling = false;
    }
  }

  void _stopAutoScroll() {
    _scrollDirection = 0.0;
    _scrollIntensity = 0.0;
    _isAutoScrolling = false;
  }

  /// Flags any newly added item ids as entering so they animate in on update.
  @override
  void didUpdateWidget(covariant DragAndDropListV2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldIds = oldWidget.items.map((e) => e.id).toSet();
    final newIds = widget.items.map((e) => e.id).toSet();

    for (final item in widget.items) {
      if (!oldIds.contains(item.id)) {
        _enteringIds.add(item.id);
      }
      _removingIds.remove(item.id);
    }

    for (final item in oldWidget.items) {
      if (!newIds.contains(item.id)) {
        _removingIds.add(item.id);
        _enteringIds.remove(item.id);
      }
    }

    final nextDisplayItems = List<DragAndDropItemData>.from(widget.items);
    for (int i = 0; i < _displayItems.length; i++) {
      final item = _displayItems[i];
      if (_removingIds.contains(item.id)) {
        nextDisplayItems.insert(i.clamp(0, nextDisplayItems.length), item);
      }
    }
    _displayItems = nextDisplayItems;
  }

  void _handleTapClose(String id, int index) {
    final targetIndex = widget.items.indexWhere((e) => e.id == id);
    if (targetIndex != -1) {
      widget.onTapClose?.call(targetIndex);
    }
  }

  void _onRemoveAnimationEnd(String id) {
    if (!mounted) return;
    setState(() {
      _displayItems.removeWhere((e) => e.id == id);
      _removingIds.remove(id);
    });
  }

  void _onEnterAnimationEnd(String id) {
    if (!mounted) return;
    setState(() => _enteringIds.remove(id));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: widget.padding is EdgeInsets ? widget.padding as EdgeInsets : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.headerText != null) ...[
            Text(
              widget.headerText!,
              style: AppTextStylesV2.title16SemiBold.copyWith(
                color: context.mayColors.primaryText,
              ),
            ),
            const SizedBox(height: DimensV2.d12),
          ],
          ExcludeSemantics(
            excluding: _isDragging,
            child: Listener(
              onPointerMove: _handlePointerMove,
              onPointerUp: _handlePointerUpOrCancel,
              onPointerCancel: _handlePointerUpOrCancel,
              child: ReorderableListView.builder(
                scrollController: _innerScrollController,
                scrollDirection: Axis.vertical,
                buildDefaultDragHandles: false,
                onReorder: widget.isPinned
                    ? (displayOldIndex, displayNewIndex) {
                        if (displayOldIndex < 0 || displayOldIndex >= _displayItems.length) return;
                        final item = _displayItems[displayOldIndex];
                        final widgetOldIndex = widget.items.indexWhere((e) => e.id == item.id);
                        if (widgetOldIndex == -1) return;

                        int widgetNewIndex = 0;
                        for (int i = 0; i < displayNewIndex; i++) {
                          if (i < _displayItems.length &&
                              !_removingIds.contains(_displayItems[i].id)) {
                            widgetNewIndex++;
                          }
                        }
                        widget.onReorder(widgetOldIndex, widgetNewIndex);
                      }
                    : (a, b) {},
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                proxyDecorator: (child, index, animation) {
                  return Material(
                    type: MaterialType.transparency,
                    child: child,
                  );
                },
                itemCount: _displayItems.length,
                itemBuilder: (context, index) {
                  final item = _displayItems[index];
                  final isRemoving = _removingIds.contains(item.id);
                  final isEntering = _enteringIds.contains(item.id);
                  return Padding(
                    key: ValueKey('item-tab-${item.id}'),
                    padding: EdgeInsets.only(bottom: widget.spacing),
                    child: _AnimatedListItem(
                      isEntering: isEntering,
                      isRemoving: isRemoving,
                      showCloseButton: widget.showCloseButton &&
                          (widget.totalItemsCount ?? widget.items.length) > 4,
                      onEnterEnd: () => _onEnterAnimationEnd(item.id),
                      onRemoveEnd: () => _onRemoveAnimationEnd(item.id),
                      childBuilder: (context, closeAnimation) => DragAndDropItem(
                        label: item.label,
                        leadingIconUrl: item.leadingIconUrl,
                        defaultIconUrl: item.defaultIconUrl,
                        closeIconUrl: Assets.icons.icX.keyName,
                        dragIndex:
                            (widget.isPinned && widget.isReorderable && !isRemoving) ? index : null,
                        isPinned: widget.isPinned,
                        isReorderable: widget.isReorderable,
                        closeAnimation: closeAnimation,
                        onDragStart: () {
                          setState(() {
                            _isDragging = true;
                          });
                        },
                        onTap: widget.onTapItem == null
                            ? null
                            : () {
                                final targetIndex = widget.items.indexWhere((e) => e.id == item.id);
                                if (targetIndex != -1) widget.onTapItem!(targetIndex);
                              },
                        onTapClose: (isRemoving || widget.onTapClose == null)
                            ? null
                            : () => _handleTapClose(item.id, index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Wraps a list item so it fades + height-reveals on enter, and collapses
/// on exit. Both phases share a single [AnimationController]; direction is
/// picked from [isEntering] / [isRemoving].
class _AnimatedListItem extends StatefulWidget {
  const _AnimatedListItem({
    required this.isEntering,
    required this.isRemoving,
    required this.showCloseButton,
    required this.onEnterEnd,
    required this.onRemoveEnd,
    required this.childBuilder,
  });

  final bool isEntering;
  final bool isRemoving;
  final bool showCloseButton;
  final VoidCallback onEnterEnd;
  final VoidCallback onRemoveEnd;
  final Widget Function(BuildContext context, Animation<double> closeAnimation) childBuilder;

  // ponytail: 200ms is the snappiest "feels instant" duration for list items.
  // Push to 150 if users still feel lag; pull to 250 if motion looks too sharp.
  static const Duration _duration = Duration(milliseconds: 200);

  /// Returns the state object backing this widget.
  @override
  State<_AnimatedListItem> createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<_AnimatedListItem> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late AnimationController _closeController;
  late Animation<double> _closeAnimation;
  bool _firedEnterEnd = false;
  bool _firedRemoveEnd = false;

  /// Initializes the shared animation controllers and starts the enter
  /// animation when [isEntering] is true.
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _AnimatedListItem._duration);
    _opacityAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic);
    if (widget.isEntering) {
      _controller.forward().whenComplete(_onEnterComplete);
    } else {
      _controller.value = 1.0;
    }

    _closeController = AnimationController(vsync: this, duration: _AnimatedListItem._duration);
    _closeAnimation = CurvedAnimation(parent: _closeController, curve: Curves.easeInOutCubic);
    if (widget.showCloseButton) {
      _closeController.value = 1.0;
    }
  }

  /// Starts the enter or remove animation when the corresponding flag
  /// transitions to true; snaps back to fully visible otherwise.
  @override
  void didUpdateWidget(covariant _AnimatedListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    final startedEntering = widget.isEntering && !oldWidget.isEntering;
    final startedRemoving = widget.isRemoving && !oldWidget.isRemoving;
    if (startedEntering) {
      _firedEnterEnd = false;
      _controller.stop();
      _controller.forward(from: 0).whenComplete(_onEnterComplete);
    } else if (startedRemoving) {
      _firedRemoveEnd = false;
      _controller.animateBack(0, curve: Curves.easeInCubic).whenComplete(_onRemoveComplete);
    } else if (!widget.isEntering && !widget.isRemoving && _controller.value != 1.0) {
      // Snap back to fully visible if neither flag is set (e.g. first build
      // with no enter animation requested).
      _controller.value = 1.0;
    }

    if (widget.showCloseButton != oldWidget.showCloseButton) {
      if (widget.showCloseButton) {
        _closeController.forward();
      } else {
        _closeController.reverse();
      }
    }
  }

  void _onEnterComplete() {
    if (!mounted || _firedEnterEnd) return;
    _firedEnterEnd = true;
    widget.onEnterEnd();
  }

  void _onRemoveComplete() {
    if (!mounted || _firedRemoveEnd) return;
    _firedRemoveEnd = true;
    widget.onRemoveEnd();
  }

  /// Disposes the animation controllers to release ticker resources.
  @override
  void dispose() {
    _controller.dispose();
    _closeController.dispose();
    super.dispose();
  }

  /// Returns [childBuilder] built with the closeAnimation,
  /// wrapped in enter/remove layout animations if needed.
  @override
  Widget build(BuildContext context) {
    final child = widget.childBuilder(context, _closeAnimation);
    if (!widget.isEntering && !widget.isRemoving) return child;
    // Inert while collapsing so a late tap can't setState an unmounting child.
    final ignoreInput = widget.isRemoving && _controller.value < 0.99;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        final opacity = _opacityAnimation.value;
        return IgnorePointer(
          ignoring: ignoreInput,
          child: Opacity(
            opacity: opacity,
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: t,
              child: child,
            ),
          ),
        );
      },
      child: child,
    );
  }
}

class _LeadingIcon extends StatelessWidget {
  const _LeadingIcon({
    required this.url,
    this.defaultIconUrl,
    required this.iconSize,
  });

  final String? url;
  final String? defaultIconUrl;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final hasUrl = url != null && url!.trim().isNotEmpty;
    final hasDefault = defaultIconUrl != null && defaultIconUrl!.trim().isNotEmpty;

    ///
    Widget buildDefaultIcon(String path) {
      return AdaptiveImageV2(
        url: path,
        width: iconSize,
        height: iconSize,
      );
    }

    if (hasUrl) {
      return AdaptiveImageV2(
        url: url!,
        width: iconSize,
        height: iconSize,
        placeholderBuilder: hasDefault ? (_) => buildDefaultIcon(defaultIconUrl!) : null,
        errorBuilder: hasDefault ? (_, __) => buildDefaultIcon(defaultIconUrl!) : null,
      );
    } else if (hasDefault) {
      return buildDefaultIcon(defaultIconUrl!);
    } else {
      return AdaptiveImageV2(
        url: Assets.icons.iconTab.keyName,
        width: iconSize,
        height: iconSize,
      );
    }
  }
}

class _IconChip extends StatelessWidget {
  const _IconChip({
    required this.url,
    required this.iconSize,
    required this.size,
    required this.fallbackIcon,
    this.backgroundColor,
    this.onTap,
    this.iconColor,
  });

  final String? url;
  final double iconSize;
  final double size;
  final IconData fallbackIcon;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final Color? iconColor;

  /// Renders the chip: a [GestureContainerV2] with the provided icon
  /// (or [fallbackIcon]) on a rounded tinted background.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    final iconWidget = url != null && url!.trim().isNotEmpty
        ? AdaptiveImageV2(url: url!, width: iconSize, height: iconSize, tintColor: iconColor)
        : Icon(
            fallbackIcon,
            size: iconSize,
            color: iconColor ?? colors.tertiaryText,
          );

    return GestureContainerV2(
      padding: EdgeInsets.all(AppSpacingV2.xs),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(DimensV2.d24)),
      ),
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(AppSpacingV2.x2s),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(DimensV2.d16)),
        ),
        child: iconWidget,
      ),
    );
  }
}

/// A single item in the [DragAndDropListV2] reorder list.
///
/// Tap the card body to invoke [onTap]. Long-press the trailing menu icon
/// to drag (only when [dragIndex] is supplied). Tap the leading close icon
/// to invoke [onTapClose].
class DragAndDropItem extends StatelessWidget {
  const DragAndDropItem({
    super.key,
    required this.label,
    required this.leadingIconUrl,
    this.defaultIconUrl,
    required this.closeAnimation,
    this.closeIconUrl,
    this.menuIconUrl,
    this.onTap,
    this.onTapClose,
    this.onTapMenu,
    this.dragIndex,
    this.isPinned = true,
    this.isReorderable = true,
    this.onDragStart,
  });

  /// Main label (e.g. "Thứ 2 - 13/04").
  final String label;

  /// Optional URL (svg/png) for the leading icon (next to label).
  final String? leadingIconUrl;

  /// Optional local asset fallback/placeholder URL.
  final String? defaultIconUrl;

  /// Close button animation.
  final Animation<double> closeAnimation;

  /// Optional override for the close (X) icon. Defaults to `Icons.close`.
  final String? closeIconUrl;

  /// Optional override for the menu (burger) icon. Defaults to `Icons.menu`.
  final String? menuIconUrl;

  /// Tap on the card body (anywhere except the close/menu chips).
  final VoidCallback? onTap;

  /// Tap on the close icon.
  final VoidCallback? onTapClose;

  /// Tap on the menu icon. Ignored when [dragIndex] is supplied — the chip
  /// then becomes a drag handle.
  final VoidCallback? onTapMenu;

  /// When supplied, the menu chip becomes a long-press drag handle for a
  /// `ReorderableListView` at this index. Clears [onTapMenu] from the menu
  /// chip to keep semantics distinct.
  final int? dragIndex;

  /// Pinned (default) shows the close + drag-handle/menu chips.
  /// Unpinned hides them and renders a trailing arrow instead.
  final bool isPinned;

  /// Whether reordering is enabled. If false, hides the drag handle icon.
  final bool isReorderable;

  /// Callback fired when the drag handle is pressed down.
  final VoidCallback? onDragStart;

  static const double _iconSize = DimensV2.d20;
  static const double _iconBtnSize = DimensV2.d28;
  static const double _leadingIconSize = DimensV2.d48;
  static final _menuIconUrl = Assets.icons.icDrag.keyName;

  /// Builds the pressable card: leading icon + label on the left,
  /// trailing close + menu/drag-handle (or arrow when unpinned) on the right.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return AnimatedBuilder(
      animation: closeAnimation,
      builder: (context, _) {
        final animVal = isPinned ? closeAnimation.value : 0.0;
        final leftPadding = AppSpacingV2.md + (AppSpacingV2.sm - AppSpacingV2.md) * animVal;

        return PressableCardContainerV2(
          padding: const EdgeInsets.only(
            top: AppSpacingV2.sm,
            bottom: AppSpacingV2.sm,
            right: DimensV2.d4,
          ),
          borderRadius: AppRadiusV2.x3l,
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(
              left: leftPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        widthFactor: animVal,
                        child: Opacity(
                          opacity: animVal,
                          child: _IconChip(
                            url: closeIconUrl,
                            iconSize: DimensV2.d9,
                            size: _iconBtnSize,
                            backgroundColor: AppColorsV2.semanticCritical100,
                            fallbackIcon: Icons.close,
                            iconColor: AppColorsV2.semanticCritical600,
                            onTap: onTapClose,
                          ),
                        ),
                      ),
                      _LeadingIcon(
                        url: leadingIconUrl,
                        defaultIconUrl: defaultIconUrl,
                        iconSize: _leadingIconSize,
                      ),
                      const SizedBox(width: AppSpacingV2.xs),
                      Flexible(
                        child: Text(
                          label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStylesV2.text14Medium.copyWith(
                            color: colors.txContentSecondaryDefault,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (dragIndex != null)
                  Listener(
                    onPointerDown: (_) => onDragStart?.call(),
                    child: ReorderableDragStartListener(
                      index: dragIndex!,
                      child: _IconChip(
                        url: _menuIconUrl,
                        iconSize: _iconSize,
                        size: _iconBtnSize,
                        fallbackIcon: Icons.drag_handle_rounded,
                      ),
                    ),
                  )
                else if (isPinned && isReorderable)
                  _IconChip(
                    url: _menuIconUrl,
                    iconSize: _iconSize,
                    size: _iconBtnSize,
                    fallbackIcon: Icons.drag_handle_rounded,
                    onTap: onTapMenu,
                  )
                else if (!isPinned)
                  Padding(
                    padding: const EdgeInsets.only(right: AppSpacingV2.sm),
                    child: const _ArrowButton(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton();

  /// Renders the circular trailing arrow used when [DragAndDropItem.isPinned]
  /// is false and no drag handle is requested.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    return Container(
      width: DragAndDropItem._iconBtnSize,
      height: DragAndDropItem._iconBtnSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors.bgIcon,
      ),
      child: Center(
        child: SvgPicture.asset(
          Assets.icons.icArrowRight.keyName,
          width: DimensV2.d12,
          height: DimensV2.d12,
          colorFilter: ColorFilter.mode(colors.icColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}

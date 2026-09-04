import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// Tab bar view with support for multi-line tab content and custom styling.
class TabBarViewMultiLineV2 extends StatefulWidget {
  const TabBarViewMultiLineV2({
    super.key,
    required this.tabs,
    required this.contentTabBars,
    this.useExpandablePage = false,
    this.initialIndex = 0,
    this.isScrollable = true,
    this.isScrollableTabBar,
    this.onChange,
    this.backgroundColor = AppColorsV2.transparent,
    this.padding = const EdgeInsets.only(
      left: DimensV2.d20,
      right: DimensV2.d20,
      bottom: DimensV2.d16,
    ),
    this.labelPadding,
    this.tabController,
    this.isLoading = false,
    // New UI customization options
    this.tabContainerColor,
    this.tabContainerRadius,
    this.tabContainerPadding,
    this.selectedTabColor,
    this.selectedTabRadius,
    this.selectedTabShadow,
    this.selectedLabelColor,
    this.unselectedLabelColor,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.indicatorColor,
    this.customIndicator,
    this.skipIntermediateAnimation = true,
    this.header,
    this.forceFillWidth = false,
  });

  final List<ContentTabBarMultiLine> tabs;
  final List<Widget> contentTabBars;
  final bool useExpandablePage;
  final int initialIndex;
  final bool isScrollable;
  final bool? isScrollableTabBar;
  final void Function(int index)? onChange;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? labelPadding;
  final TabController? tabController;
  final bool isLoading;

  // New UI customization options
  final Color? tabContainerColor;
  final double? tabContainerRadius;
  final EdgeInsetsGeometry? tabContainerPadding;
  final Color? selectedTabColor;
  final double? selectedTabRadius;
  final BoxShadow? selectedTabShadow;
  final Color? selectedLabelColor;
  final Color? unselectedLabelColor;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final Color? indicatorColor;
  final BoxDecoration? customIndicator;
  final bool skipIntermediateAnimation;
  final Widget? header;
  final bool forceFillWidth;

  @override

  /// Creates the state used by [TabBarViewMultiLineV2].
  State<TabBarViewMultiLineV2> createState() => _TabBarViewMultiLineV2State();
}

class _TabBarViewMultiLineV2State extends State<TabBarViewMultiLineV2>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final bool _isExternalController;
  late TabController _controller;
  late final ValueNotifier<double> _leftFadeOpacity;
  late final ValueNotifier<double> _rightFadeOpacity;
  late final ScrollController _tabScrollController;
  late final PageController _pageController;
  final List<GlobalKey> _tabKeys = [];
  int _activeIndex = 0;
  int? _preloadedIndex;
  double _lastAnimationValue = 0.0;
  bool _isLayoutSyncComplete = false;
  static const double _edgeFadeWidth = DimensV2.d24;

  @override

  /// Initializes the tab controller and listeners.
  void initState() {
    super.initState();
    _isExternalController = widget.tabController != null;
    _controller = widget.tabController ??
        TabController(
          length: widget.tabs.length,
          vsync: this,
          initialIndex: widget.initialIndex,
        );

    _activeIndex = _controller.index;
    _preloadedIndex = _controller.index;
    _tabScrollController = ScrollController();
    _pageController = PageController(initialPage: widget.initialIndex);
    _leftFadeOpacity = ValueNotifier(_controller.index > 0 ? 1.0 : 0.0);
    _rightFadeOpacity = ValueNotifier(_controller.index < widget.tabs.length - 1 ? 1.0 : 0.0);

    _controller.addListener(_handleTabChange);
    _controller.animation?.addListener(_handleTabAnimation);
    // Check if initial index is the last item
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _lastAnimationValue = _controller.index.toDouble();
      _isLayoutSyncComplete = true;
      _checkScrollPosition();
      _ensureSelectedTabVisible();
    });
  }

  void _updateTabKeys() {
    if (_tabKeys.length != widget.tabs.length) {
      _tabKeys.clear();
      _tabKeys.addAll(List.generate(widget.tabs.length, (_) => GlobalKey()));
    }
  }

  void _ensureSelectedTabVisible() {
    if (!_tabScrollController.hasClients || _tabKeys.isEmpty || _activeIndex >= _tabKeys.length) {
      return;
    }

    final key = _tabKeys[_activeIndex];
    final context = key.currentContext;
    if (context == null) return;

    final box = context.findRenderObject() as RenderBox?;
    if (box == null) return;

    final scrollableBox =
        _tabScrollController.position.context.storageContext.findRenderObject() as RenderBox?;
    if (scrollableBox == null) return;

    final position = box.localToGlobal(Offset.zero, ancestor: scrollableBox);
    final tabWidth = box.size.width;
    final viewportWidth = scrollableBox.size.width;

    final double targetOffset =
        _tabScrollController.offset + position.dx - (viewportWidth - tabWidth) / 2;
    final double clampedOffset = targetOffset.clamp(
      0.0,
      _tabScrollController.position.maxScrollExtent,
    );

    _tabScrollController.animateTo(
      clampedOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  void _updateActiveIndex(int index) {
    if (_activeIndex != index) {
      _activeIndex = index;
      _checkScrollPosition();
      setState(() {});
      if (_preloadedIndex != index) {
        _preloadedIndex = index;
        widget.onChange?.call(index);
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _ensureSelectedTabVisible();
      });
    }
  }

  void _handleTabChange() {
    if (!_isLayoutSyncComplete) {
      return;
    }
    if (_controller.index != _controller.previousIndex) {
      _updateActiveIndex(_controller.index);
      if (widget.useExpandablePage && _pageController.hasClients) {
        if (_pageController.page?.round() != _controller.index) {
          _pageController.jumpToPage(_controller.index);
        }
      }
    }
  }

  void _handleTabAnimation() {
    if (!_isLayoutSyncComplete) {
      return;
    }
    if (_controller.indexIsChanging) {
      return;
    }
    if (_controller.animation != null) {
      final double value = _controller.animation!.value;
      final double delta = value - _lastAnimationValue;
      _lastAnimationValue = value;

      final int preloadTargetIndex = _calculateTargetIndex(value, delta);
      if (_preloadedIndex != preloadTargetIndex) {
        _preloadedIndex = preloadTargetIndex;
        widget.onChange?.call(preloadTargetIndex);
      }

      final int newIndex = value.round();
      if (_activeIndex != newIndex) {
        _activeIndex = newIndex;
        _checkScrollPosition();
        setState(() {});
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _ensureSelectedTabVisible();
        });
      }
    }
  }

  int _calculateTargetIndex(double value, double delta) {
    final int floorVal = value.floor();
    final double fraction = value - floorVal;

    if (delta > 0) {
      return (fraction > 0.15 ? floorVal + 1 : floorVal).clamp(0, widget.tabs.length - 1);
    } else if (delta < 0) {
      return (fraction < 0.85 ? floorVal : floorVal + 1).clamp(0, widget.tabs.length - 1);
    }
    return _preloadedIndex ?? value.round().clamp(0, widget.tabs.length - 1);
  }

  @override

  /// Recreates the internal controller when the tab count changes.
  void didUpdateWidget(covariant TabBarViewMultiLineV2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_isExternalController) {
      if (widget.tabController != oldWidget.tabController && widget.tabController != null) {
        _controller.removeListener(_handleTabChange);
        _controller.animation?.removeListener(_handleTabAnimation);
        _controller = widget.tabController!;
        _activeIndex = _controller.index;
        _preloadedIndex = _controller.index;
        _controller.addListener(_handleTabChange);
        _controller.animation?.addListener(_handleTabAnimation);
        _leftFadeOpacity.value = _controller.index > 0 ? 1.0 : 0.0;
        _rightFadeOpacity.value = _controller.index < widget.tabs.length - 1 ? 1.0 : 0.0;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _ensureSelectedTabVisible();
        });
      }
    } else if (widget.tabs.length != oldWidget.tabs.length) {
      _controller.removeListener(_handleTabChange);
      _controller.animation?.removeListener(_handleTabAnimation);
      _controller.dispose();
      _controller = TabController(
        length: widget.tabs.length,
        vsync: this,
        initialIndex: widget.initialIndex,
      );
      _activeIndex = widget.initialIndex;
      _preloadedIndex = _controller.index;
      _controller.addListener(_handleTabChange);
      _controller.animation?.addListener(_handleTabAnimation);
      _leftFadeOpacity.value = widget.initialIndex > 0 ? 1.0 : 0.0;
      _rightFadeOpacity.value = widget.initialIndex < widget.tabs.length - 1 ? 1.0 : 0.0;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _ensureSelectedTabVisible();
      });
    }
  }

  @override

  /// Disposes listeners and the internal controller when needed.
  void dispose() {
    if (!_isExternalController) {
      _controller.dispose();
    } else {
      _controller.removeListener(_handleTabChange);
    }
    _controller.animation?.removeListener(_handleTabAnimation);
    _leftFadeOpacity.dispose();
    _rightFadeOpacity.dispose();
    _tabScrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.metrics.axis == Axis.horizontal) {
      _checkScrollPosition(notification.metrics);
    }
    return false;
  }

  void _checkScrollPosition([ScrollMetrics? metrics]) {
    final ScrollMetrics? activeMetrics =
        metrics ?? (_tabScrollController.hasClients ? _tabScrollController.position : null);

    if (activeMetrics != null) {
      final double maxScroll = activeMetrics.maxScrollExtent;
      final double currentScroll = activeMetrics.pixels;

      final double leftOpacity =
          maxScroll > 0 ? (currentScroll / _edgeFadeWidth).clamp(0.0, 1.0) : 0.0;
      final double rightOpacity =
          maxScroll > 0 ? ((maxScroll - currentScroll) / _edgeFadeWidth).clamp(0.0, 1.0) : 0.0;

      if (_leftFadeOpacity.value != leftOpacity) {
        _leftFadeOpacity.value = leftOpacity;
      }
      if (_rightFadeOpacity.value != rightOpacity) {
        _rightFadeOpacity.value = rightOpacity;
      }
    } else {
      if (_leftFadeOpacity.value != 0.0) {
        _leftFadeOpacity.value = 0.0;
      }
      if (_rightFadeOpacity.value != 0.0) {
        _rightFadeOpacity.value = 0.0;
      }
    }
  }

  bool _shouldScrollTabBar(BuildContext context) {
    if (widget.isScrollableTabBar != null) {
      return widget.isScrollableTabBar!;
    }

    final double screenWidth = MediaQuery.of(context).size.width;
    final padding = widget.padding ?? const EdgeInsets.symmetric(horizontal: DimensV2.d16);
    final double availableWidth = screenWidth - padding.horizontal;

    double totalWidth = 0.0;
    for (int i = 0; i < widget.tabs.length; i++) {
      final tab = widget.tabs[i];
      final titlePainter = TextPainter(
        text: TextSpan(text: tab.title, style: AppTextStylesV2.text15Semibold),
        textDirection: TextDirection.ltr,
      )..layout();

      double textWidth = titlePainter.width;
      if (tab.subtitle != null && tab.subtitle!.isNotEmpty) {
        final subtitlePainter = TextPainter(
          text: TextSpan(text: tab.subtitle, style: AppTextStylesV2.text13Medium),
          textDirection: TextDirection.ltr,
        )..layout();
        if (subtitlePainter.width > textWidth) {
          textWidth = subtitlePainter.width;
        }
      }

      totalWidth +=
          DimensV2.d28 + textWidth + (i < widget.tabs.length - 1 ? DimensV2.d6 : DimensV2.d0);
    }

    if (totalWidth > availableWidth) {
      return true;
    }

    if (!widget.forceFillWidth) {
      return true;
    }

    return widget.tabs.length > 5;
  }

  @override

  /// Builds the tab bar and its matching tab content.
  Widget build(BuildContext context) {
    super.build(context);
    _updateTabKeys();
    final bool isScrollableTabBar = _shouldScrollTabBar(context);
    final colors = context.mayColors;

    final Widget tabRow = Row(
      mainAxisSize: isScrollableTabBar ? MainAxisSize.min : MainAxisSize.max,
      children: widget.tabs.asMap().entries.map((entry) {
        final int index = entry.key;
        final e = entry.value;
        final bool isSelected = _activeIndex == index;
        final hasSubtitle = e.subtitle != null && e.subtitle!.isNotEmpty;
        final Color tabBgColor = isSelected
            ? (widget.selectedTabColor ?? colors.bgTabActive)
            : (e.isToday ? (e.todayBgColor ?? colors.bgTabToday) : colors.bgTabInactive);
        final Color tabBorderColor = isSelected
            ? AppColorsV2.transparent
            : (e.isToday ? (e.todayBorderColor ?? colors.bdTabToday) : colors.bdDefault);
        final Color tabShadowColor = isSelected
            ? (widget.selectedTabColor != null ? AppColorsV2.transparent : colors.sdTabActive)
            : (e.isToday ? (e.todayBorderColor ?? colors.bdTabToday) : colors.sdDefault);
        final Color tabTextColor = isSelected
            ? (widget.selectedLabelColor ?? colors.txTabActive)
            : (e.isToday ? colors.txTabToday : colors.txContentPrimaryDefault);

        final Widget card = PressableCardContainerV2(
          key: _tabKeys[index],
          color: tabBgColor,
          borderColor: tabBorderColor,
          shadowColor: tabShadowColor,
          borderRadius: DimensV2.d20,
          pressedOffset: DimensV2.d4,
          width: isScrollableTabBar ? null : double.infinity,
          margin: EdgeInsets.only(
            bottom: DimensV2.d4,
            right: index < widget.tabs.length - 1 ? 6.0 : 0.0,
          ),
          padding: EdgeInsets.symmetric(
            vertical: DimensV2.d12,
            horizontal: isScrollableTabBar ? DimensV2.d14 : DimensV2.d8,
          ),
          onTap: () {
            if (widget.skipIntermediateAnimation) {
              _controller.animateTo(index, duration: Duration.zero);
            } else {
              _controller.animateTo(index);
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                e.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStylesV2.text15Semibold.copyWith(
                  color: tabTextColor,
                ),
              ),
              if (hasSubtitle)
                Text(
                  e.subtitle!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStylesV2.text13Medium.copyWith(
                    color: tabTextColor,
                  ),
                ),
            ],
          ),
        );

        final int? rawCount = e.count ?? e.badgeCount;
        final bool hasCount = rawCount != null && rawCount > 0;

        Widget tabWidget = card;
        if (hasCount) {
          final String displayCount = rawCount > 99 ? '99+' : '$rawCount';
          tabWidget = Stack(
            clipBehavior: Clip.none,
            children: [
              card,
              Positioned(
                top: -10.0,
                right: 4.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7.0,
                    vertical: 2.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColorsV2.semanticRed600,
                    borderRadius: BorderRadius.circular(99.0),
                  ),
                  child: Text(
                    displayCount,
                    style: AppTextStylesV2.text12Medium.copyWith(
                      color: AppColorsV2.genericWhite,
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        return isScrollableTabBar ? tabWidget : Expanded(child: tabWidget);
      }).toList(),
    );

    final bool hasAnyBadge = widget.tabs.any((e) {
      final c = e.count ?? e.badgeCount;
      return c != null && c > 0;
    });

    final EdgeInsetsGeometry basePadding =
        widget.padding ?? const EdgeInsets.symmetric(horizontal: DimensV2.d16);

    final EdgeInsetsGeometry resolvedPadding;
    if (hasAnyBadge) {
      if (basePadding is EdgeInsets) {
        resolvedPadding = basePadding.top < 10.0 ? basePadding.copyWith(top: 10.0) : basePadding;
      } else {
        resolvedPadding = basePadding.add(const EdgeInsets.only(top: 10.0));
      }
    } else {
      resolvedPadding = basePadding;
    }

    final Widget tabBar = isScrollableTabBar
        ? SingleChildScrollView(
            controller: _tabScrollController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: resolvedPadding,
            child: tabRow,
          )
        : Padding(
            padding: resolvedPadding,
            child: tabRow,
          );

    final Widget mainTabBar = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isLoading)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: DimensV2.d16),
            child: ShimmerTabV2(),
          )
        else
          ClipRect(
            child: isScrollableTabBar
                ? NotificationListener<ScrollNotification>(
                    onNotification: _handleScrollNotification,
                    child: AnimatedBuilder(
                      animation: Listenable.merge([_leftFadeOpacity, _rightFadeOpacity]),
                      builder: (context, child) {
                        return ShaderMask(
                          shaderCallback: (Rect bounds) {
                            final backgroundColor =
                                widget.tabContainerColor ?? AppColorsV2.neutral125;
                            final fadeStop = (_edgeFadeWidth / bounds.width).clamp(0.0, 0.5);

                            return LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.lerp(backgroundColor, AppColorsV2.transparent,
                                    _leftFadeOpacity.value)!,
                                backgroundColor,
                                backgroundColor,
                                Color.lerp(backgroundColor, AppColorsV2.transparent,
                                    _rightFadeOpacity.value)!,
                              ],
                              stops: [0.0, fadeStop, 1 - fadeStop, 1.0],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstIn,
                          child: child,
                        );
                      },
                      child: tabBar,
                    ),
                  )
                : tabBar,
          ),
        if (widget.useExpandablePage)
          Container(
            color: widget.backgroundColor,
            child: AppExpandablePageViewV2(
              controller: _pageController,
              onPageChanged: (index) {
                if (_controller.index != index) {
                  _controller.animateTo(index);
                }
              },
              children: widget.contentTabBars,
            ),
          )
        else
          Expanded(
            child: Container(
              color: widget.backgroundColor,
              child: TabBarView(
                physics: widget.isScrollable
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                controller: _controller,
                children: widget.contentTabBars,
              ),
            ),
          ),
      ],
    );

    if (widget.header != null) {
      return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: widget.header!,
            ),
          ];
        },
        body: mainTabBar,
      );
    }

    return mainTabBar;
  }

  @override
  bool get wantKeepAlive => true;
}

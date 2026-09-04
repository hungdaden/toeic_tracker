import 'package:flutter/material.dart';
import '../../may_uikit_internal.dart';

const Widget defaultLoadingIndicator = Padding(
  padding: EdgeInsets.only(
    top: DimensV2.d8,
    bottom: DimensV2.d12,
  ),
  child: CommonLoadingIndicatorV2(
    showLabel: false,
    size: DimensV2.d24,
  ),
);

/// List layout that supports lazy loading (pagination).
class LazyLoadingList extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  /// Called when the [child] reaches the end of the list
  final Function()? onEndOfPage;

  /// The percentage offset to take into account when triggering [onEndOfPage] in pixels
  final double scrollOffset;

  /// Used to determine if loading of new data has finished.
  /// You should use set this if you aren't using a FutureBuilder or StreamBuilder
  final bool isLoading;

  /// Prevented update nested listview with other axis direction
  final Axis scrollDirection;

  /// The widget to show when loading new data
  final Widget loadingIndicator;

  /// Flag to show widget indicate that there is no more data to load
  final bool noMoreData;

  /// Widget to show when there is no more data to load at the end of the list
  final Widget? noMoreDataWidget;

  final bool shrinkWrap;

  final ScrollPhysics? physics;

  final Future<void> Function()? onPullRefresh;

  final ScrollController? scrollController;

  final Widget? separator;

  final EdgeInsetsGeometry? padding;

  final bool showScrollbar;

  const LazyLoadingList({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.onEndOfPage,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.isLoading = false,
    this.scrollOffset = 1,
    this.loadingIndicator = defaultLoadingIndicator,
    this.noMoreData = false,
    this.noMoreDataWidget,
    this.shrinkWrap = false,
    this.physics,
    this.onPullRefresh,
    this.separator,
    this.padding,
    this.showScrollbar = false,
  }) : super(key: key);

  /// Creates the state for [LazyLoadingList].
  @override
  State<LazyLoadingList> createState() => _LazyLoadingListState();
}

class _LazyLoadingListState extends State<LazyLoadingList> {
  /// Initializes the state.
  @override
  void initState() {
    super.initState();
  }

  /// Disposes resources used by the state.
  @override
  void dispose() {
    super.dispose();
  }

  /// Builds the widget tree for the list.
  @override
  Widget build(BuildContext context) {
    Widget child = ListView.separated(
      controller: widget.scrollController,
      padding: widget.padding,
      physics: widget.physics ?? const BouncingScrollPhysics(),
      shrinkWrap: widget.shrinkWrap,
      itemCount: widget.itemCount + 1,
      itemBuilder: (context, index) {
        if (index == widget.itemCount) {
          return widget.isLoading
              ? widget.loadingIndicator
              : widget.noMoreData
                  ? widget.noMoreDataWidget ?? const SizedBox()
                  : const SizedBox();
        }
        return widget.itemBuilder(context, index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return widget.separator ?? const SizedBox(height: DimensV2.d16);
      },
    );

    if (widget.showScrollbar) {
      child = Scrollbar(child: child);
    }

    if (widget.onPullRefresh != null) {
      child = RefreshIndicator(
        onRefresh: widget.onPullRefresh!,
        color: AppColorsV2.genericWhite,
        backgroundColor: AppColorsV2.primaryButtonColor,
        child: child,
      );
    }
    return LazyScrollListener(
      onScrollOffset: widget.onEndOfPage ?? () {},
      scrollDirection: widget.scrollDirection,
      isLoading: widget.isLoading,
      noMoreData: widget.noMoreData,
      scrollOffset: widget.scrollOffset,
      child: child,
    );
  }
}

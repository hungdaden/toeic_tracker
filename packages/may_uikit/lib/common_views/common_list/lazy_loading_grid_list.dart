import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../may_uikit_internal.dart';

const Widget defaultMasonryLoadingIndicator = Padding(
  padding: EdgeInsets.only(
    top: DimensV2.d8,
  ),
  child: CommonLoadingIndicatorV2(
    showLabel: false,
    size: DimensV2.d24,
  ),
);

/// Grid layout that supports lazy loading (pagination) with custom delegate.
class LazyLoadingGrid extends StatefulWidget {
  const LazyLoadingGrid({
    super.key,
    this.onEndOfPage,
    this.scrollOffset = 1,
    this.gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1.0,
    ),
    this.loadingIndicator = defaultLoadingIndicator,
    this.noMoreData = false,
    this.noMoreDataWidget,
    this.shrinkWrap = false,
    this.physics,
    this.itemCount = 0,
    required this.itemBuilder,
    this.isLoading = false,
  });

  final VoidCallback? onEndOfPage;
  final double scrollOffset;
  final SliverGridDelegate gridDelegate;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final Widget loadingIndicator;
  final bool noMoreData;
  final Widget? noMoreDataWidget;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final bool isLoading;

  /// Creates the state for [LazyLoadingGrid].
  @override
  State<LazyLoadingGrid> createState() => _LazyLoadingGridState();
}

class _LazyLoadingGridState extends State<LazyLoadingGrid> {
  /// Builds the widget tree for the state.
  @override
  Widget build(BuildContext context) {
    return LazyScrollListener(
      onScrollOffset: widget.onEndOfPage ?? () {},
      scrollOffset: widget.scrollOffset,
      child: GridView.builder(
        physics: widget.physics ?? const BouncingScrollPhysics(),
        gridDelegate: widget.gridDelegate,
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
        itemCount: widget.itemCount + 1,
      ),
    );
  }
}

/// Masonry grid layout that supports lazy loading (pagination).
class LazyLoadingGridMasonry extends StatefulWidget {
  const LazyLoadingGridMasonry({
    super.key,
    this.onEndOfPage,
    this.scrollOffset = 1,
    this.gridDelegate = const SliverSimpleGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    this.loadingIndicator = defaultMasonryLoadingIndicator,
    this.loadingIndicatorNumber = 1,
    this.noMoreData = false,
    this.noMoreDataWidget,
    this.shrinkWrap = false,
    this.physics,
    this.itemCount = 0,
    required this.itemBuilder,
    this.isLoading = false,
    this.mainAxisSpacing = 0,
    this.crossAxisSpacing = 0,
    this.padding,
    this.scrollController,
  });

  final VoidCallback? onEndOfPage;
  final double scrollOffset;
  final SliverSimpleGridDelegate gridDelegate;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final Widget loadingIndicator;
  final int loadingIndicatorNumber;
  final bool noMoreData;
  final Widget? noMoreDataWidget;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final bool isLoading;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsets? padding;
  final ScrollController? scrollController;

  /// Creates the state for [LazyLoadingGridMasonry].
  @override
  State<LazyLoadingGridMasonry> createState() => _LazyLoadingGridMasonryState();
}

class _LazyLoadingGridMasonryState extends State<LazyLoadingGridMasonry> {
  late final ScrollController _scrollController = widget.scrollController ?? ScrollController();

  /// Disposes resources used by the state.
  @override
  void dispose() {
    // Only dispose if we created it internally
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  /// Builds the widget tree for the masonry grid.
  @override
  Widget build(BuildContext context) {
    return LazyScrollListener(
      onScrollOffset: widget.onEndOfPage ?? () {},
      scrollOffset: widget.scrollOffset,
      isLoading: widget.isLoading,
      noMoreData: widget.noMoreData,
      child: SingleChildScrollView(
        controller: _scrollController,
        physics: widget.physics ?? const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: (widget.padding ?? EdgeInsets.zero).copyWith(bottom: DimensV2.d0),
              child: MasonryGridView.custom(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: widget.mainAxisSpacing,
                crossAxisSpacing: widget.crossAxisSpacing,
                gridDelegate: widget.gridDelegate,
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => widget.itemBuilder(context, index),
                  childCount: widget.itemCount,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: widget.padding?.left ?? 0,
                right: widget.padding?.right ?? 0,
                top: (widget.isLoading || widget.noMoreData) ? widget.mainAxisSpacing : 0,
                bottom: widget.padding?.bottom ?? 0,
              ),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: widget.isLoading
                    ? widget.loadingIndicator
                    : widget.noMoreData
                        ? (widget.noMoreDataWidget ?? const SizedBox())
                        : const SizedBox(
                            height: 50,
                            width: double.infinity,
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

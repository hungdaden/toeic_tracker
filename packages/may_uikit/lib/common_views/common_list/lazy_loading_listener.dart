library;

import 'package:flutter/widgets.dart';

/// Status indicating whether the scroll listener is loading or stable.
enum LoadingStatus { loading, stable }

/// A widget that wraps a [Widget] and will trigger [onScrollOffset] when it
/// reaches the bottom of the list
class LazyScrollListener extends StatefulWidget {
  /// The [Widget] that this widget watches for changes on
  final Widget child;

  /// Called when the [child] reaches the scroll offset from the bottom
  final VoidCallback onScrollOffset;

  /// The offset to take into account when triggering [onScrollOffset] in pixels
  final double scrollOffset;

  /// Khi đã hết data, không trigger thêm callback nữa
  final bool noMoreData;

  /// Used to determine if loading of new data has finished.
  /// You should use set this if you aren't using a FutureBuilder or StreamBuilder
  final bool isLoading;

  /// Prevented update nested listview with other axis direction
  final Axis scrollDirection;

  /// Creates the state for [LazyScrollListener].
  @override
  State<StatefulWidget> createState() => LazyScrollListenerState();

  const LazyScrollListener({
    super.key,
    required this.child,
    required this.onScrollOffset,
    this.scrollDirection = Axis.vertical,
    this.isLoading = false,
    this.scrollOffset = 1,
    this.noMoreData = false,
  });
}

/// State class for [LazyScrollListener] to manage loading status.
class LazyScrollListenerState extends State<LazyScrollListener> {
  LoadingStatus loadMoreStatus = LoadingStatus.stable;

  /// Checks if loading status should be reset when widget updates.
  @override
  void didUpdateWidget(LazyScrollListener oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Chỉ reset khi loading vừa kết thúc (true → false), không reset khi đang ổn định
    if (oldWidget.isLoading && !widget.isLoading) {
      loadMoreStatus = LoadingStatus.stable;
    }
  }

  /// Builds the notification listener wrapping child.
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      child: widget.child,
      onNotification: (notification) => _onNotification(notification, context),
    );
  }

  bool _onNotification(ScrollNotification notification, BuildContext context) {
    if (widget.scrollDirection != notification.metrics.axis) return false;

    if (notification is ScrollUpdateNotification) {
      final max = notification.metrics.maxScrollExtent;
      final current = notification.metrics.pixels;

      if (max > 0 && current >= max * 0.85) {
        _loadMore();
      }
      return false;
    }

    return false;
  }

  void _loadMore() {
    // Không load thêm khi đã hết data
    if (widget.noMoreData) return;
    if (loadMoreStatus == LoadingStatus.stable) {
      loadMoreStatus = LoadingStatus.loading;
      widget.onScrollOffset();
    }
  }
}

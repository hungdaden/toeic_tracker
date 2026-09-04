// ignore_for_file: missing_golden_test
import 'package:flutter/widgets.dart';

import '../../resources/spacing.dart';
import 'callback_debouncer.dart';
import 'defaults.dart';
import 'sliver_centralized.dart';

/// The sliver version of [InfiniteGridV2].
///
/// {@macro infinite_grid}
///
/// As a infinite grid, it is supposed to be the last sliver in the current
/// [ScrollView]. Otherwise, re-fetching data will have an unintuitive behavior.
class SliverInfiniteGridV2 extends StatefulWidget {
  /// Constructs a [SliverInfiniteGridV2].
  const SliverInfiniteGridV2({
    required this.itemCount,
    required this.onFetchData,
    required this.itemBuilder,
    required this.gridDelegate,
    super.key,
    this.debounceDuration = defaultDebounceDuration,
    this.isLoading = false,
    this.hasError = false,
    this.hasReachedMax = false,
    this.centerLoading = false,
    this.centerError = false,
    this.centerEmpty = false,
    this.loadingBuilder,
    this.errorBuilder,
    this.error,
    this.onError,
    this.emptyBuilder,
    this.findChildIndexCallback,
  });

  /// {@macro debounce_duration}
  final Duration debounceDuration;

  /// {@macro item_count}
  final int itemCount;

  /// {@macro is_loading}
  final bool isLoading;

  /// {@macro has_error}
  final bool hasError;

  /// {@macro has_reached_max}
  final bool hasReachedMax;

  /// {@macro on_fetch_data}
  final VoidCallback onFetchData;

  /// {@macro empty_builder}
  final WidgetBuilder? emptyBuilder;

  /// {@macro loading_builder}
  final WidgetBuilder? loadingBuilder;

  /// {@macro error_builder}
  final InfiniteListErrorBuilder? errorBuilder;

  /// Optional [AppException] passed to [errorBuilder] when [hasError] is true.
  final Object? error;

  /// Optional callback passed when [hasError] is true.
  final void Function(Object error)? onError;

  /// {@macro item_builder}
  final ItemBuilder itemBuilder;

  /// {@macro center_loading}
  final bool centerLoading;

  /// {@macro center_error}
  final bool centerError;

  /// {@macro center_empty}
  final bool centerEmpty;

  /// {@macro find_child_index_callback}
  final int? Function(Key)? findChildIndexCallback;

  /// {@macro grid_delegate}
  final SliverGridDelegate gridDelegate;

  @override

  /// Creates the fetch-aware state for [SliverInfiniteGridV2].
  State<SliverInfiniteGridV2> createState() => _SliverInfiniteGridState();
}

class _SliverInfiniteGridState extends State<SliverInfiniteGridV2> {
  late final CallbackDebouncer debounce;

  int? _lastFetchedIndex;

  @override

  /// Initializes debouncing and triggers the first fetch attempt if list is empty.
  void initState() {
    super.initState();
    debounce = CallbackDebouncer(widget.debounceDuration);
    if (widget.itemCount == 0) {
      attemptFetch();
    }
  }

  @override

  /// Reacts to widget updates and refetches when pagination can continue.
  void didUpdateWidget(SliverInfiniteGridV2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.itemCount == 0 && oldWidget.itemCount > 0) {
      _lastFetchedIndex = null;
      attemptFetch();
    } else if (!widget.hasReachedMax && oldWidget.hasReachedMax) {
      attemptFetch();
    }
  }

  @override
  void dispose() {
    super.dispose();
    debounce.dispose();
  }

  void attemptFetch() {
    if (!widget.hasReachedMax && !widget.isLoading && !widget.hasError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        debounce(widget.onFetchData);
      });
    }
  }

  void onBuiltLast(int lastItemIndex) {
    if (_lastFetchedIndex != lastItemIndex) {
      _lastFetchedIndex = lastItemIndex;
      attemptFetch();
    }
  }

  WidgetBuilder get loadingBuilder => widget.loadingBuilder ?? defaultInfiniteListLoadingBuilder;

  /// Builds the loading indicator widget.
  ///
  /// If [isLoadMore] is true, additional top padding is applied using the [context].
  Widget buildLoadingWidget(BuildContext context, {required bool isLoadMore}) {
    final widgetChild = loadingBuilder(context);
    if (isLoadMore) {
      return Padding(
        padding: const EdgeInsets.only(top: AppSpacingV2.x2l),
        child: widgetChild,
      );
    }
    return widgetChild;
  }

  Widget buildErrorWidget(BuildContext context) {
    final builder = widget.errorBuilder ?? defaultInfiniteListErrorBuilder;
    return builder(context, widget.error);
  }

  WidgetBuilder get emptyBuilder => widget.emptyBuilder ?? defaultInfiniteListEmptyBuilder;

  @override
  Widget build(BuildContext context) {
    final hasItems = widget.itemCount != 0;

    final showEmpty = !widget.isLoading && widget.itemCount == 0;
    final showBottomWidget = showEmpty || widget.isLoading || widget.hasError;

    final effectiveItemCount = (!hasItems ? 0 : widget.itemCount) + (showBottomWidget ? 1 : 0);
    final lastItemIndex = effectiveItemCount - 1;

    Widget? centeredSliver;

    if (widget.centerLoading && widget.isLoading && effectiveItemCount == 1) {
      centeredSliver = SliverCentralizedV2(child: buildLoadingWidget(context, isLoadMore: false));
    } else if (widget.centerError && widget.hasError) {
      centeredSliver = SliverCentralizedV2(child: buildErrorWidget(context));
    } else if (widget.centerEmpty && showEmpty) {
      centeredSliver = SliverCentralizedV2(child: emptyBuilder(context));
    }

    if (centeredSliver != null) return centeredSliver;

    if (!hasItems) {
      return SliverToBoxAdapter(
        child: Builder(
          builder: (context) {
            onBuiltLast(0);
            if (widget.hasError) {
              return buildErrorWidget(context);
            } else if (widget.isLoading) {
              return buildLoadingWidget(context, isLoadMore: false);
            } else {
              return emptyBuilder(context);
            }
          },
        ),
      );
    }

    final gridSliver = SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: widget.itemCount,
        findChildIndexCallback: widget.findChildIndexCallback,
        (context, index) {
          if (index == widget.itemCount - 1 && !showBottomWidget) {
            onBuiltLast(index);
          }
          return widget.itemBuilder(context, index);
        },
      ),
      gridDelegate: widget.gridDelegate,
    );

    if (!showBottomWidget) {
      return gridSliver;
    }

    final bottomSliver = SliverToBoxAdapter(
      child: Builder(
        builder: (context) {
          onBuiltLast(lastItemIndex);
          if (widget.hasError) {
            return buildErrorWidget(context);
          } else if (widget.isLoading) {
            return buildLoadingWidget(context, isLoadMore: hasItems);
          } else {
            return emptyBuilder(context);
          }
        },
      ),
    );

    return SliverMainAxisGroup(
      slivers: [
        gridSliver,
        bottomSliver,
      ],
    );
  }
}

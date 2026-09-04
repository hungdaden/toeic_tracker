// ignore_for_file: missing_golden_test
import 'package:flutter/widgets.dart';

import '../../resources/spacing.dart';
import 'callback_debouncer.dart';
import 'defaults.dart';
import 'sliver_centralized.dart';

/// The sliver version of [InfiniteListV2].
///
/// {@macro infinite_list}
///
/// As a infinite list, it is supposed to be the last sliver in the current
/// [ScrollView]. Otherwise, re-fetching data will have an unintuitive behavior.
class SliverInfiniteListV2 extends StatefulWidget {
  /// Constructs a [SliverInfiniteListV2].
  const SliverInfiniteListV2({
    required this.itemCount,
    required this.onFetchData,
    required this.itemBuilder,
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
    this.separatorBuilder,
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

  /// {@macro separator_builder}
  final IndexedWidgetBuilder? separatorBuilder;

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

  @override

  /// Creates the fetch-aware state for [SliverInfiniteListV2].
  State<SliverInfiniteListV2> createState() => _SliverInfiniteListState();
}

class _SliverInfiniteListState extends State<SliverInfiniteListV2> {
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
  void didUpdateWidget(SliverInfiniteListV2 oldWidget) {
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
    final showSeparator = widget.separatorBuilder != null;
    final separatorCount = !showSeparator ? 0 : widget.itemCount - 1;

    final effectiveItemCount =
        (!hasItems ? 0 : widget.itemCount + separatorCount) + (showBottomWidget ? 1 : 0);
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

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: effectiveItemCount,
        findChildIndexCallback: widget.findChildIndexCallback,
        (context, index) {
          if (index == lastItemIndex) {
            onBuiltLast(lastItemIndex);
          }
          if (index == lastItemIndex && showBottomWidget) {
            if (widget.hasError) {
              return buildErrorWidget(context);
            } else if (widget.isLoading) {
              return buildLoadingWidget(context, isLoadMore: hasItems);
            } else {
              return emptyBuilder(context);
            }
          } else {
            final itemIndex = !showSeparator ? index : (index / 2).floor();
            if (showSeparator && index.isOdd) {
              return widget.separatorBuilder!(context, itemIndex);
            } else {
              return widget.itemBuilder(context, itemIndex);
            }
          }
        },
      ),
    );
  }
}

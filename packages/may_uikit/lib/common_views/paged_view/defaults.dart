// ignore_for_file: missing_golden_test
import 'package:flutter/material.dart';

import '../../may_uikit.dart';

/// The type definition for the [InfiniteListV2.itemBuilder].
typedef ItemBuilder = Widget Function(BuildContext context, int index);

/// The type definition for the [InfiniteListV2.errorBuilder].
typedef InfiniteListErrorBuilder = Widget Function(BuildContext context, Object? exception);

/// Default value to [InfiniteListV2.loadingBuilder].
Widget defaultInfiniteListLoadingBuilder(BuildContext buildContext) {
  return const Center(
    child: CommonLoadingIndicatorV2(
      showLabel: false,
    ),
  );
}

/// Default value to [InfiniteListV2.errorBuilder].
// ignore: prefer_named_parameters
Widget defaultInfiniteListErrorBuilder(BuildContext context, Object? exception) {
  return Center(
    child: CommonTextV2(
      exception?.toString() ?? 'Error'.hardcoded,
      style: AppTextStylesV2.bodyRegular.copyWith(color: AppColorsV2.badgeRed500),
    ),
  );
}

/// Default value to [InfiniteListV2.emptyBuilder].
Widget defaultInfiniteListEmptyBuilder(BuildContext buildContext) {
  return const EmptyStateWidgetV2();
}

/// Default value to [InfiniteListV2.debounceDuration].
const defaultDebounceDuration = Duration(milliseconds: 100);

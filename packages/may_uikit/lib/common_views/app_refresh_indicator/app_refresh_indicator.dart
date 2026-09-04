import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// A custom RefreshIndicator that uses the app's primary button color
/// and generic white color by default. It also handles the app bar content top offset.
class AppRefreshIndicator extends StatelessWidget {
  /// Creates an app-styled refresh indicator around [child].
  const AppRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
    this.color,
    this.backgroundColor,
    this.edgeOffset,
    this.notificationPredicate = defaultScrollNotificationPredicate,
  });

  /// A function that's called when the user has dragged the refresh indicator
  /// far enough to demonstrate that they want the app to refresh.
  final RefreshCallback onRefresh;

  /// The widget below this widget in the tree.
  final Widget child;

  /// The color of the refresh indicator.
  final Color? color;

  /// The background color of the refresh indicator.
  final Color? backgroundColor;

  /// The offset where the refresh indicator appears.
  final double? edgeOffset;

  /// A check that specifies whether a [ScrollNotification] should be
  /// handled by this widget.
  final ScrollNotificationPredicate notificationPredicate;

  /// Builds the refresh indicator with app-specific default colors and offset.
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        HapticUtil.mediumImpact();
        return onRefresh();
      },
      strokeWidth: 3,
      color: color ?? AppColorsV2.genericWhite,
      backgroundColor: backgroundColor ?? context.mayColors.btnPrimaryDefault,
      edgeOffset: edgeOffset ?? AppDimenV2.of(context).paddingTop,
      notificationPredicate: notificationPredicate,
      child: child,
    );
  }
}

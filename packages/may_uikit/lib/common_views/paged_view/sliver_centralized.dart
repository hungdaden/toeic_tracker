// ignore_for_file: missing_golden_test
import 'package:flutter/material.dart';

/// {@template sliver_centralized}
/// A sliver that centers its child and fills the remaining space.
///
/// This is useful for centering a child in a [CustomScrollView].
/// {@endtemplate}
class SliverCentralizedV2 extends StatefulWidget {
  /// Constructs a [SliverCentralizedV2].
  /// {@macro sliver_centralized}
  const SliverCentralizedV2({
    required this.child,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  /// Creates the state for [SliverCentralizedV2].
  State<SliverCentralizedV2> createState() => _SliverCentralizedState();
}

class _SliverCentralizedState extends State<SliverCentralizedV2> {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: widget.child,
      ),
    );
  }
}

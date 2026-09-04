// ignore_for_file: missing_golden_test
import 'package:flutter/material.dart';

import '../../may_uikit.dart';
import '../../utils/object_util.dart';

/// Hosts a moving shimmer gradient for descendant loading placeholders.
class ShimmerV2 extends StatefulWidget {
  const ShimmerV2({
    this.child,
    super.key,
  });

  final Widget? child;
  static _ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<_ShimmerState>();
  }

  @override
  /// Creates the animated shimmer state.
  _ShimmerState createState() => _ShimmerState();
}

class _ShimmerState extends State<ShimmerV2> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  static const _shimmerGradient = LinearGradient(
    colors: [
      AppColorsV2.neutral125,
      AppColorsV2.neutral150,
      AppColorsV2.neutral125,
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  LinearGradient get gradient => LinearGradient(
        colors: _shimmerGradient.colors,
        stops: _shimmerGradient.stops,
        begin: _shimmerGradient.begin,
        end: _shimmerGradient.end,
        transform: _SlidingGradientTransform(slidePercent: _shimmerController.value),
      );

  bool get isSized => context.findRenderObject()?.safeCast<RenderBox>()?.hasSize == true;

  Size get size => context.findRenderObject()?.safeCast<RenderBox>()?.size ?? Size.zero;
  Listenable get shimmerChanges => _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject()?.safeCast<RenderBox>();

    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// Full-view loading indicator with InkDrop animation style.
class CommonLoadingIndicatorV2 extends StatefulWidget {
  /// Creates a large loading indicator for view-level loading states.
  ///
  /// Always displays a hardcoded "Đang tải dữ liệu" label with three
  /// animated trailing dots.
  const CommonLoadingIndicatorV2({
    super.key,
    this.color,
    this.label,
    this.showLabel = true,
    this.size,
    this.labelColor,
  });

  /// Custom color for the loading indicator. If null, uses the theme's primary button color.
  final Color? color;
  final String? label;
  final bool showLabel;
  final double? size;
  final Color? labelColor;

  /// Hardcoded label shown below the indicator.
  static const String _label = 'Đang tải dữ liệu ';

  static const double _size = DimensV2.d32;
  static const String _semanticsLabel = 'Loading';

  /// Creates state for [CommonLoadingIndicatorV2].
  @override
  State<CommonLoadingIndicatorV2> createState() => _CommonLoadingIndicatorV2State();
}

class _CommonLoadingIndicatorV2State extends State<CommonLoadingIndicatorV2>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  /// Initializes animation controller for InkDrop cycle.
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    )..repeat();
  }

  /// Disposes animation controller.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Builds centered loading indicator.
  @override
  Widget build(BuildContext context) {
    final effectiveColor = widget.color ?? context.mayColors.primaryButton;
    final effectiveSize = widget.size ?? CommonLoadingIndicatorV2._size;

    final indicator = Semantics(
      label: CommonLoadingIndicatorV2._semanticsLabel,
      child: RepaintBoundary(
        child: SizedBox.square(
          dimension: effectiveSize,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return CustomPaint(
                painter: _CommonLoadingIndicatorPainter(
                  progress: _controller.value,
                  color: effectiveColor,
                  strokeWidth: effectiveSize / 5,
                ),
              );
            },
          ),
        ),
      ),
    );

    final body = widget.showLabel
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              indicator,
              const SizedBox(height: AppSpacingV2.md),
              _AnimatedDotsLabel(
                base: CommonLoadingIndicatorV2._label,
                controller: _controller,
                color: widget.labelColor ?? context.mayColors.secondaryText,
              ),
            ],
          )
        : indicator;

    return Center(
      child: body,
    );
  }
}

/// Three trailing dots whose opacity follows a sine wave, synced to the
/// parent's [AnimationController].
class _AnimatedDotsLabel extends StatelessWidget {
  const _AnimatedDotsLabel({
    required this.base,
    required this.controller,
    required this.color,
  });

  final String base;
  final AnimationController controller;
  final Color color;

  static const int _dotCount = 3;

  ///
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final t = controller.value;
        final children = <Widget>[
          Text(
            base,
            style: AppTextStylesV2.title15Medium.copyWith(color: color),
          ),
        ];
        for (var i = 0; i < _dotCount; i++) {
          final phase = (t + i / _dotCount) % 1.0;
          // Sine wave 0 → 1, lifted to 0.2..1.0 so dots stay faintly visible.
          final opacity = 0.2 + 0.8 * (0.5 - 0.5 * math.cos(phase * 2 * math.pi));
          children.add(Text(
            '󠁯󠁯.',
            style: AppTextStylesV2.labelMedium.copyWith(
              color: color.withValues(alpha: opacity),
            ),
          ));
        }
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: children,
        );
      },
    );
  }
}

class _CommonLoadingIndicatorPainter extends CustomPainter {
  const _CommonLoadingIndicatorPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  final double progress;
  final Color color;
  final double strokeWidth;

  /// Paints InkDrop arcs for current [progress].
  @override
  void paint(Canvas canvas, Size size) {
    final ringColor = color.withValues(alpha: 0.1);

    _drawArc(canvas, size, ringColor, math.pi / 2, 2 * math.pi);

    if (progress <= 0.9) {
      final offset = _evalOffset(
        begin: Offset(0, -size.shortestSide),
        end: Offset.zero,
        curve: const Interval(0.05, 0.4, curve: Curves.easeInCubic),
      );
      canvas.save();
      canvas.translate(offset.dx, offset.dy);
      _drawArc(
        canvas,
        size,
        color,
        -3 * math.pi / 2,
        _evalDouble(
            from: math.pi / (size.shortestSide * size.shortestSide),
            to: math.pi / 1.13,
            begin: 0.38,
            end: 0.9),
      );
      _drawArc(
        canvas,
        size,
        color,
        -3 * math.pi / 2,
        _evalDouble(
            from: math.pi / (size.shortestSide * size.shortestSide),
            to: -math.pi / 1.13,
            begin: 0.38,
            end: 0.9),
      );
      canvas.restore();
    }

    if (progress >= 0.9) {
      _drawArc(canvas, size, color, -math.pi / 4,
          _evalDouble(from: -math.pi / 7.4, to: -math.pi / 4, begin: 0.9, end: 0.96));
      _drawArc(canvas, size, color, -3 * math.pi / 4,
          _evalDouble(from: math.pi / 7.4, to: math.pi / 4, begin: 0.9, end: 0.96));
      _drawArc(canvas, size, color, -math.pi / 3.5,
          _evalDouble(from: math.pi / 1.273, to: math.pi / 28, begin: 0.9));
      _drawArc(canvas, size, color, math.pi / 0.778,
          _evalDouble(from: -math.pi / 1.273, to: -math.pi / 27, begin: 0.9));
    }
  }

  void _drawArc(Canvas canvas, Size size, Color color, double startAngle, double sweepAngle) {
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: math.min(size.width, size.height) / 2,
    );
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  Offset _evalOffset({required Offset begin, required Offset end, required Curve curve}) {
    final curvedProgress = curve.transform(progress);
    return Offset.lerp(begin, end, curvedProgress) ?? Offset.zero;
  }

  double _evalDouble({
    double from = 0,
    double to = 1,
    double begin = 0,
    double end = 1,
    Curve curve = Curves.linear,
  }) {
    final curvedProgress = Interval(begin, end, curve: curve).transform(progress);
    return from + (to - from) * curvedProgress;
  }

  /// Repaints when animation or visual inputs change.
  @override
  bool shouldRepaint(covariant _CommonLoadingIndicatorPainter oldDelegate) {
    return progress != oldDelegate.progress ||
        color != oldDelegate.color ||
        strokeWidth != oldDelegate.strokeWidth;
  }
}

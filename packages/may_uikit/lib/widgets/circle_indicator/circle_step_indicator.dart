import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

/// Widget hiển thị circular progress indicator dạng vòng tròn đầy đủ 360°.
///
/// - Track (phần còn lại): Semantic/Success/100 (#D4F7D4)
/// - Progress (phần hoàn thành): Semantic/Success/600 (#0EAA10)
/// - [progress]: 0.0 → 1.0
/// - [icon]: widget hiển thị ở giữa vòng tròn (tuỳ chọn)
///
/// Ví dụ:
/// ```dart
/// CircleStepIndicatorV2(
///   progress: 0.66,
///   size: 52,
///   strokeWidth: 4.5,
///   icon: Icon(Icons.check, color: Color(0xFF0EAA10)),
/// )
/// ```
class CircleStepIndicatorV2 extends StatelessWidget {
  const CircleStepIndicatorV2({
    super.key,
    required this.progress,
    this.size = DimensV2.d46,
    this.strokeWidth = DimensV2.d6,
    this.icon,
  }) : assert(progress >= 0.0 && progress <= 1.0, 'progress phải trong [0.0, 1.0]');

  /// Tiến độ từ 0.0 (0%) đến 1.0 (100%).
  final double progress;

  /// Đường kính vòng tròn (px).
  final double size;

  /// Độ dày đường arc (px).
  final double strokeWidth;

  /// Widget hiển thị ở giữa vòng tròn.
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CircleProgressPainter(
          progress: progress,
          strokeWidth: strokeWidth,
        ),
        child: icon != null ? Center(child: icon) : null,
      ),
    );
  }
}

class _CircleProgressPainter extends CustomPainter {
  const _CircleProgressPainter({
    required this.progress,
    required this.strokeWidth,
  });

  final double progress;
  final double strokeWidth;

  /// Semantic/Success/600 — phần đã hoàn thành.
  static const _progressColor = Color(0xFF0EAA10);

  /// Semantic/Success/100 — phần còn lại (track).
  static const _trackColor = Color(0xFFD4F7D4);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    // Bắt đầu từ đỉnh (-90°), vẽ ngược chiều kim đồng hồ.
    const startAngle = -math.pi / 2;

    final trackPaint = Paint()
      ..color = _trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    final progressPaint = Paint()
      ..color = _progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // 1. Track — vẽ vòng tròn đầy đủ 360°
    canvas.drawCircle(center, radius, trackPaint);

    // 2. Progress — vẽ arc ngược chiều kim đồng hồ (sweepAngle âm)
    if (progress > 0) {
      final sweepAngle = -2 * math.pi * progress.clamp(0.0, 1.0);
      canvas.drawArc(rect, startAngle, sweepAngle, false, progressPaint);
    }
  }

  @override
  bool shouldRepaint(_CircleProgressPainter old) => old.progress != progress;
}

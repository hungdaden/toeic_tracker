import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../resources/dimens.dart';
import '../../../resources/styles/app_color.dart';

/// Container bo góc tròn phía trên phục vụ cho Bottom Sheet.
class RoundUpperCornerContainerV2 extends StatelessWidget {
  /// Khởi tạo [RoundUpperCornerContainerV2].
  const RoundUpperCornerContainerV2({
    required this.child,
    super.key,
    this.height,
    this.hasShadow = true,
    this.circularBorderRadius = DimensV2.d20,
    this.syncBottomCircularBorderRadius = false,
    this.mainAxisSize = MainAxisSize.min,
    this.padding,
    this.border,
    this.backgroundColor = AppColorsV2.genericWhite,
    this.margin,
    this.constraint,
    this.smoothRadius,
  });

  /// Chiều cao của container.
  final double? height;

  /// Widget con bên trong.
  final Widget child;

  /// Có hiển thị shadow hay không. Mặc định là true.
  final bool hasShadow;

  /// Bán kính bo góc. Mặc định là 20.
  final double circularBorderRadius;

  /// Có áp dụng bo góc cho cả hai góc bên dưới hay không. Mặc định là false.
  final bool syncBottomCircularBorderRadius;

  /// Padding bên trong.
  final EdgeInsetsGeometry? padding;

  /// Border xung quanh container.
  final Border? border;

  /// Màu nền. Mặc định là [AppColorsV2.genericWhite].
  final Color? backgroundColor;

  /// Kích thước trục chính.
  final MainAxisSize? mainAxisSize;

  /// Margin bên ngoài container.
  final EdgeInsetsGeometry? margin;

  /// Box constraints ràng buộc kích thước.
  final BoxConstraints? constraint;

  /// Bán kính bo góc mềm (SmoothRadiusV2).
  /// Nếu truyền vào sẽ ghi đè [circularBorderRadius].
  final SmoothRadiusV2? smoothRadius;

  @override
  /// Xây dựng giao diện cho container sử dụng [context].
  Widget build(BuildContext context) {
    final effectiveSmoothRadius = smoothRadius ??
        SmoothRadiusV2(
          cornerRadius: circularBorderRadius,
          cornerSmoothing: 0.6,
        );
    return Container(
      margin: margin,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: effectiveSmoothRadius,
          topRight: SmoothRadiusV2(
            cornerRadius: circularBorderRadius,
            cornerSmoothing: 0.6,
          ),
          bottomLeft: syncBottomCircularBorderRadius ? effectiveSmoothRadius : Radius.zero,
          bottomRight: syncBottomCircularBorderRadius ? effectiveSmoothRadius : Radius.zero,
        ),
        border: border,
        boxShadow: hasShadow
            ? [
                const BoxShadow(
                  color: AppColorsV2.neutral100,
                  blurRadius: 20,
                  spreadRadius: 8,
                  blurStyle: BlurStyle.normal,
                ),
              ]
            : null,
      ),
      constraints: constraint ??
          BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height,
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(circularBorderRadius),
        child: Container(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

/// Lớp Radius hỗ trợ bo góc mịn (Squircle) cho iOS.
class SmoothRadiusV2 extends Radius {
  /// Khởi tạo [SmoothRadiusV2] với độ mịn bo góc [cornerSmoothing].
  const SmoothRadiusV2({
    required double cornerRadius,
    required this.cornerSmoothing,
  }) : super.circular(cornerRadius);

  /// Độ mịn của bo góc.
  final double cornerSmoothing;

  /// Bán kính góc bo.
  double get cornerRadius => x;

  /// Bán kính bo góc bằng 0.
  static const zero = SmoothRadiusV2(
    cornerRadius: 0,
    cornerSmoothing: 0,
  );

  @override
  Radius operator -() => SmoothRadiusV2(
        cornerRadius: -cornerRadius,
        cornerSmoothing: cornerSmoothing,
      );

  @override
  Radius operator -(Radius other) {
    if (other is SmoothRadiusV2) {
      return SmoothRadiusV2(
        cornerRadius: cornerRadius - other.cornerRadius,
        cornerSmoothing: (cornerSmoothing + other.cornerSmoothing) / 2,
      );
    }
    return SmoothRadiusV2(
      cornerRadius: cornerRadius - other.x,
      cornerSmoothing: cornerSmoothing,
    );
  }

  @override
  Radius operator +(Radius other) {
    if (other is SmoothRadiusV2) {
      return SmoothRadiusV2(
        cornerRadius: cornerRadius + other.cornerRadius,
        cornerSmoothing: (cornerSmoothing + other.cornerSmoothing) / 2,
      );
    }
    return SmoothRadiusV2(
      cornerRadius: cornerRadius + other.x,
      cornerSmoothing: cornerSmoothing,
    );
  }

  @override
  SmoothRadiusV2 operator *(double operand) => SmoothRadiusV2(
        cornerRadius: cornerRadius * operand,
        cornerSmoothing: cornerSmoothing * operand,
      );

  @override
  SmoothRadiusV2 operator /(double operand) => SmoothRadiusV2(
        cornerRadius: cornerRadius / operand,
        cornerSmoothing: cornerSmoothing / operand,
      );

  @override
  SmoothRadiusV2 operator ~/(double operand) => SmoothRadiusV2(
        cornerRadius: (cornerRadius ~/ operand).toDouble(),
        cornerSmoothing: (cornerSmoothing ~/ operand).toDouble(),
      );

  @override
  SmoothRadiusV2 operator %(double operand) => SmoothRadiusV2(
        cornerRadius: cornerRadius % operand,
        cornerSmoothing: cornerSmoothing % operand,
      );

  /// Nội suy tuyến tính (lerp) giữa hai [SmoothRadiusV2].
  static SmoothRadiusV2? lerp(SmoothRadiusV2? a, SmoothRadiusV2? b, double t) {
    if (b == null) {
      if (a == null) {
        return null;
      } else {
        final double k = 1.0 - t;
        return SmoothRadiusV2(
          cornerRadius: a.cornerRadius * k,
          cornerSmoothing: a.cornerSmoothing * k,
        );
      }
    } else {
      if (a == null) {
        return SmoothRadiusV2(
          cornerRadius: b.cornerRadius * t,
          cornerSmoothing: b.cornerSmoothing * t,
        );
      } else {
        return SmoothRadiusV2(
          cornerRadius: lerpDouble(a.cornerRadius, b.cornerRadius, t) ?? 0,
          cornerSmoothing: lerpDouble(a.cornerSmoothing, b.cornerSmoothing, t) ?? 0,
        );
      }
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;

    return other is SmoothRadiusV2 &&
        other.cornerRadius == cornerRadius &&
        other.cornerSmoothing == cornerSmoothing;
  }

  @override
  int get hashCode => Object.hash(cornerRadius, cornerSmoothing);

  @override
  /// Trả về chuỗi mô tả thông tin của [SmoothRadiusV2].
  String toString() {
    return 'SmoothRadiusV2('
        'cornerRadius: ${cornerRadius.toStringAsFixed(2)},'
        'cornerSmoothing: ${cornerSmoothing.toStringAsFixed(2)},'
        ')';
  }
}

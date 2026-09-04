import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

class PrimaryContainerV2 extends StatelessWidget {
  const PrimaryContainerV2({
    super.key,
    this.child,
    this.padding = const EdgeInsets.all(DimensV2.d16),
    this.margin,
    this.width,
    this.height,
    this.color,
    this.radius = AppRadiusV2.xl,
    this.border,
    this.borderRadius,
    this.boxShadow,
  }) : _themeBorderWidth = null;

  /// Private constructor dùng để defer resolve border color theo theme.
  /// [_themeBorderWidth] != null → dùng `colors.border` tại build time.
  const PrimaryContainerV2._themed({
    super.key,
    // ignore: unused_element_parameter
    this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.color,
    this.radius = AppRadiusV2.md,
    this.border,
    this.borderRadius,
    this.boxShadow,
    required double? themeBorderWidth,
  }) : _themeBorderWidth = themeBorderWidth;

  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? color;
  final double radius;
  final double? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;

  /// Nếu != null, border sẽ dùng `colors.border` (từ theme) với độ dày này,
  /// trừ khi [border] được truyền vào tường minh.
  final double? _themeBorderWidth;

  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final resolvedRadius = BorderRadius.circular(borderRadius ?? radius);

    // Resolve border: ưu tiên border truyền vào, sau đó theme border (nếu có),
    // mặc định null.
    final resolvedBorder = border ??
        (_themeBorderWidth != null
            ? Border.all(width: _themeBorderWidth!, color: colors.border)
            : null);

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? colors.bgAppSurface,
        borderRadius: resolvedRadius,
        border: resolvedBorder,
        boxShadow: boxShadow,
      ),
      child: ClipRRect(
        borderRadius: resolvedRadius,
        child: Container(
          width: width,
          height: height,
          color: color ?? colors.bgCard,
          padding: padding ?? const EdgeInsets.all(DimensV2.d16),
          child: child,
        ),
      ),
    );
  }

  /// Container với viền mỏng theo theme (dark/light mode tự động).
  static PrimaryContainerV2 bodered({
    Key? key,
    Widget? child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    Color? color,
    double? radius,
    double? borderRadius,
    Border? border,
    List<BoxShadow>? boxShadow,
  }) =>
      PrimaryContainerV2._themed(
        key: key,
        padding: padding,
        margin: margin,
        width: width,
        height: height,
        color: color,
        radius: radius ?? const PrimaryContainerV2().radius,
        borderRadius: borderRadius,
        border: border,
        boxShadow: boxShadow,
        themeBorderWidth: DimensV2.d1 / 2,
        child: child,
      );

  static PrimaryContainerV2 field({
    Key? key,
    Widget? child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    Color? color,
    double? radius,
    double? borderRadius,
    Border? border,
    List<BoxShadow>? boxShadow,
  }) =>
      PrimaryContainerV2._themed(
        key: key,
        padding: padding,
        margin: margin,
        width: width,
        height: height,
        color: color,
        radius: radius ?? const PrimaryContainerV2().radius,
        borderRadius: borderRadius,
        border: border,
        boxShadow: boxShadow,
        themeBorderWidth: DimensV2.d1,
        child: child,
      );

  static PrimaryContainerV2 fieldDisable({
    Key? key,
    Widget? child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    Color? color,
    double? radius,
    double? borderRadius,
    Border? border,
    List<BoxShadow>? boxShadow,
  }) =>
      PrimaryContainerV2(
        key: key,
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: DimensV2.d12,
              horizontal: DimensV2.d20,
            ),
        margin: margin,
        width: width,
        height: height,
        color: color ?? AppColorsV2.neutral50,
        radius: radius ?? const PrimaryContainerV2().radius,
        borderRadius: borderRadius,
        border: border ?? Border.all(width: DimensV2.d1, color: AppColorsV2.neutral100),
        boxShadow: boxShadow,
        child: child,
      );

  static PrimaryContainerV2 attention({
    Key? key,
    String? text,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    Color? color,
    double? radius,
    double? borderRadius,
    Border? border,
    List<BoxShadow>? boxShadow,
  }) =>
      PrimaryContainerV2(
        key: key,
        padding: const EdgeInsets.symmetric(
          vertical: DimensV2.d12,
          horizontal: DimensV2.d16,
        ),
        margin: margin,
        width: width,
        height: height,
        radius: radius ?? const PrimaryContainerV2().radius,
        borderRadius: borderRadius,
        border: Border.all(color: AppColorsV2.semanticAttention700),
        color: AppColorsV2.semanticAttention50,
        boxShadow: boxShadow,
        child: Text(
          text ?? '',
          style: AppTextStylesV2.labelSemiBold.copyWith(color: AppColorsV2.semanticAttention900),
        ),
      );
}

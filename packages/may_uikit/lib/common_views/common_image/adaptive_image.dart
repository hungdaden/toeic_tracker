import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'common_image.dart';

/// Ảnh tự động chọn loader theo [url]:
/// - chuỗi raw SVG (`<svg`) → [SvgPicture.string]
/// - `.svg` + asset path → [CommonImageV2.svg]
/// - `.svg` network → [CommonImageV2.network] (SvgPicture.network bên trong)
/// - asset path khác → [CommonImageV2.asset]
/// - còn lại → [CommonImageV2.network]
///
/// Thay thế helper `_buildImage` từng copy-paste ở nhiều widget, dùng chung
/// cho cả leading icon, trailing icon, button icon — đầy đủ param của
/// [CommonImageV2] hay dùng nhất.
class AdaptiveImageV2 extends StatelessWidget {
  const AdaptiveImageV2({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.tintColor,
    this.fit = BoxFit.contain,
    this.package,
    this.enableCache = true,
    this.autoResizeMemory = true,
    this.borderRadius,
    this.placeholderBuilder,
    this.errorBuilder,
  });

  /// URL hoặc asset path. Tự detect theo extension / prefix.
  final String url;

  /// Kích thước w; null = intrinsic.
  final double? width;

  /// Kích thước h; null = intrinsic.
  final double? height;

  /// Tint màu (cho SVG / icon). Null = giữ màu gốc.
  final Color? tintColor;

  /// BoxFit mặc định = contain.
  final BoxFit fit;

  /// Package cho asset path (vd: asset từ package khác).
  final String? package;

  /// Bật cached network image khi load remote. Mặc định false cho khớp
  /// hành vi CommonImageV2.network gốc.
  final bool enableCache;

  /// Khi [autoResizeMemory] là `false`, ảnh giữ nguyên tỉ lệ decode gốc.
  final bool autoResizeMemory;

  /// Bo góc cho hình ảnh.
  final BorderRadiusGeometry? borderRadius;

  /// Widget hiển thị trong lúc tải ảnh mạng.
  final Widget Function(BuildContext context)? placeholderBuilder;

  /// Error widget builder when loading fails.
  final Widget Function(BuildContext context, dynamic error)? errorBuilder;

  bool get _isRawSvg => url.trim().toLowerCase().startsWith('<svg');
  bool get _isSvg => _isRawSvg || url.toLowerCase().endsWith('.svg');
  bool get _isAsset =>
      url.startsWith('assets/') || url.startsWith('./') || url.startsWith('packages/');

  /// Routes [url] to the appropriate image loader based on content, extension,
  /// and prefix (raw svg, svg asset, svg network, asset, network).
  @override
  Widget build(BuildContext context) {
    late final Widget image;

    if (_isRawSvg) {
      image = SvgPicture.string(
        url,
        width: width,
        height: height,
        fit: fit,
        colorFilter: tintColor != null ? ColorFilter.mode(tintColor!, BlendMode.srcIn) : null,
      );
    } else if (_isSvg && _isAsset) {
      String assetPath = url;
      String? pkg = package;
      if (url.startsWith('packages/')) {
        final parts = url.split('/');
        if (parts.length > 2) {
          pkg = parts[1];
          assetPath = parts.sublist(2).join('/');
        }
      }
      image = CommonImageV2.svg(
        path: assetPath,
        package: pkg,
        width: width,
        height: height,
        foregroundColor: tintColor,
        fit: fit,
      );
    } else if (_isSvg) {
      image = CommonImageV2.network(
        url: url,
        width: width,
        height: height,
        foregroundColor: tintColor,
        fit: fit,
        placeholderBuilder: placeholderBuilder,
        errorBuilder: errorBuilder,
      );
    } else if (_isAsset) {
      String assetPath = url;
      String? pkg = package;
      if (url.startsWith('packages/')) {
        final parts = url.split('/');
        if (parts.length > 2) {
          pkg = parts[1];
          assetPath = parts.sublist(2).join('/');
        }
      }
      image = CommonImageV2.asset(
        path: assetPath,
        package: pkg,
        width: width,
        height: height,
        foregroundColor: tintColor,
        fit: fit,
      );
    } else {
      image = CommonImageV2.network(
        url: url,
        width: width,
        height: height,
        fit: fit,
        enableCache: enableCache,
        autoResizeMemory: autoResizeMemory,
        placeholderBuilder: placeholderBuilder,
        errorBuilder: errorBuilder,
      );
    }

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }
}

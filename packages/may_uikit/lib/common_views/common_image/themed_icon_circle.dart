import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../may_uikit.dart';
import '../../resources/generated/assets.gen.dart';

/// Variant quyết định kích thước + asset fallback mặc định.
enum ThemedIconCircleVariant {
  /// Cover toàn khung, clip tròn, fallback = avatar.png.
  avatar,

  /// Contain ở giữa, fallback = icDefaultContentStatus.
  icon,
}

/// Hình tròn themed dùng để hiện avatar hoặc icon trong card.
class ThemedIconCircleV2 extends StatelessWidget {
  /// Khởi tạo [ThemedIconCircleV2].
  ///
  /// [variant] chọn `avatar` / `icon`. [url] dùng cho ảnh network; [svgPath]
  /// ưu tiên hơn [url] khi truyền. [fallbackAsset] dùng khi cả 2 đều rỗng.
  const ThemedIconCircleV2({
    super.key,
    required this.variant,
    this.url,
    this.svgPath,
    this.fallbackAsset,
    this.width,
    this.height,
    this.iconSize,
  });

  /// Variant quyết định kích thước + cách render.
  final ThemedIconCircleVariant variant;

  /// URL ảnh (jpg/png/svg) — dùng cho cả avatar và icon.
  final String? url;

  /// Path SVG trong assets — ưu tiên hơn [url] khi truyền.
  final String? svgPath;

  /// Asset fallback khi cả [url] và [svgPath] đều rỗng.
  final String? fallbackAsset;

  final double? width;
  final double? height;
  final double? iconSize;

  static const double _avatarSize = DimensV2.d40;
  static const double _iconContainerSize = DimensV2.d32;
  static const double _iconInnerSize = DimensV2.d20;

  String get _resolvedFallback {
    if (fallbackAsset != null) return fallbackAsset!;
    return switch (variant) {
      ThemedIconCircleVariant.avatar => Assets.icons.avatar.keyName,
      ThemedIconCircleVariant.icon => Assets.icons.icDefaultContentStatus.keyName,
    };
  }

  @override

  /// Builds the themed circle for the chosen [variant].
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    return switch (variant) {
      ThemedIconCircleVariant.avatar => _buildAvatar(colors),
      ThemedIconCircleVariant.icon => _buildIcon(context, colors),
    };
  }

  Widget _buildAvatar(MayThemeColorsV2 colors) {
    final hasUrl = url != null && url!.trim().isNotEmpty;
    final effectiveWidth = width ?? _avatarSize;
    final effectiveHeight = height ?? _avatarSize;

    return Container(
      width: effectiveWidth,
      height: effectiveHeight,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: hasUrl ? null : colors.bgIcon,
      ),
      child: hasUrl
          ? AdaptiveImageV2(
              url: url!,
              width: effectiveWidth,
              height: effectiveHeight,
              fit: BoxFit.cover,
            )
          : Image.asset(
              _resolvedFallback,
              width: effectiveWidth,
              height: effectiveHeight,
              fit: BoxFit.cover,
            ),
    );
  }

  Widget _buildIcon(BuildContext context, MayThemeColorsV2 colors) {
    final effectiveWidth = width ?? _iconContainerSize;
    final effectiveHeight = height ?? _iconContainerSize;

    return Container(
      width: effectiveWidth,
      height: effectiveHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors.bgIcon,
      ),
      child: Center(
        child: _buildInnerIcon(context),
      ),
    );
  }

  Widget _buildInnerIcon(BuildContext context) {
    final effectiveIconSize = iconSize ?? _iconInnerSize;

    if (svgPath != null && svgPath!.trim().isNotEmpty) {
      return SvgPicture.asset(
        svgPath!,
        width: effectiveIconSize,
        height: effectiveIconSize,
        fit: BoxFit.contain,
        colorFilter: ColorFilter.mode(
          context.mayColors.icColor,
          BlendMode.srcIn,
        ),
      );
    }
    if (url != null && url!.trim().isNotEmpty) {
      return AdaptiveImageV2(
        url: url!,
        width: effectiveIconSize,
        height: effectiveIconSize,
        fit: BoxFit.contain,
        tintColor: context.mayColors.icColor,
        errorBuilder: (context, error) => SvgPicture.asset(
          _resolvedFallback,
          width: effectiveIconSize,
          height: effectiveIconSize,
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(
            context.mayColors.icColor,
            BlendMode.srcIn,
          ),
        ),
      );
    }
    return SvgPicture.asset(
      _resolvedFallback,
      width: effectiveIconSize,
      height: effectiveIconSize,
      fit: BoxFit.contain,
      colorFilter: ColorFilter.mode(
        context.mayColors.icColor,
        BlendMode.srcIn,
      ),
    );
  }
}

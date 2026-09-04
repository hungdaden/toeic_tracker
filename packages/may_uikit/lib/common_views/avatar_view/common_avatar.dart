import 'package:flutter/material.dart';
import '../../may_uikit.dart';
import '../../resources/generated/assets.gen.dart';

/// Displays a circular network avatar with loading and fallback states.
class CommonAvatarV2 extends StatelessWidget {
  const CommonAvatarV2({
    super.key,
    required this.imageUrl,
    this.placeholder,
    this.errorWidget,
    this.radius,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double? radius;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  /// Builds the avatar widget.
  @override
  Widget build(BuildContext context) {
    /// Builds the fallback widget when the image fails to load.
    Widget buildFallback() {
      return errorWidget ??
          Assets.icons.avatar.image(
            width: radius,
            height: radius,
            fit: fit,
          );
    }

    final url = imageUrl.trim();
    if (url.isEmpty) {
      return ClipOval(
        child: Container(
          padding: const EdgeInsets.all(DimensV2.d1),
          color: AppColorsV2.neutral100,
          child: ClipOval(
            child: buildFallback(),
          ),
        ),
      );
    }

    return ClipOval(
      child: Container(
        padding: const EdgeInsets.all(DimensV2.d1),
        color: AppColorsV2.neutral100,
        child: ClipOval(
          child: AdaptiveImageV2(
            url: url,
            width: radius,
            height: radius,
            fit: fit,
            autoResizeMemory: false,
            placeholderBuilder: (_) =>
                placeholder ??
                ShimmerV2(
                  child: ShimmerLoadingV2(
                    isLoading: true,
                    child: CircleShimmerV2(diameter: radius),
                  ),
                ),
            errorBuilder: (context, error) => buildFallback(),
          ),
        ),
      ),
    );
  }
}

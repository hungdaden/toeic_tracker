import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

import '../resources/generated/assets.gen.dart';

/// Displays a product image with an aspect ratio of 1:1 on the top half
/// and the product title on the bottom half with [AppSpacingV2.sm] padding.
/// If no image is provided, it falls back to a neutral linear gradient with a placeholder icon.
/// Displays a badge overlay at the top-right corner if [detail.badge] is present.
/// Wraps [PressableCardContainerV2] to support tap animation and drop shadow.
class ProductItemV2 extends StatelessWidget {
  /// Creates a [ProductItemV2] widget.
  const ProductItemV2({
    super.key,
    required this.detail,
    this.onTap,
    this.aspectRatio = 1.0,
    this.imageFit = BoxFit.cover,
    this.borderRadius = AppRadiusV2.x3l,
  });

  /// The section item detail containing the product title, image url, and badge.
  final PHXSectionItemDetailEntity detail;

  /// Optional tap callback.
  final VoidCallback? onTap;

  /// Optional aspect ratio for the image container, defaults to 1.0.
  final double aspectRatio;

  /// Optional image fit behavior, defaults to [BoxFit.cover].
  final BoxFit imageFit;

  /// The border radius of the card, defaults to [AppRadiusV2.x3l] (28.0).
  final double borderRadius;

  /// Builds the product item card using the current [context].
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return PressableCardContainerV2(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: aspectRatio,
            child: _buildImageArea(context, colors),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacingV2.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.title ?? '',
                  style: AppTextStylesV2.text14Medium.copyWith(
                    color: colors.txContentPrimaryDefault,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (detail.content?.isNotEmpty == true) ...[
                  const SizedBox(height: AppSpacingV2.x2s),
                  Text(
                    detail.content!,
                    style: AppTextStylesV2.text14Semibold.copyWith(
                      color: colors.txContentPrimaryDefault,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context, MayThemeColorsV2 colors) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            colors.bgImagePlaceholderStart,
            colors.bgImagePlaceholderEnd,
          ],
        ),
      ),
      child: Center(
        child: AdaptiveImageV2(
          url: Assets.icons.emptyProduct.keyName,
          width: DimensV2.d38,
          height: DimensV2.d38,
        ),
      ),
    );
  }

  Widget _buildImageArea(BuildContext context, MayThemeColorsV2 colors) {
    final imageUrl = detail.imageUrl ?? '';

    Widget imageWidget;
    if (imageUrl.isNotEmpty) {
      imageWidget = AdaptiveImageV2(
        url: imageUrl,
        fit: imageFit,
        errorBuilder: (context, error) => _buildPlaceholder(context, colors),
      );
    } else {
      imageWidget = _buildPlaceholder(context, colors);
    }

    final badgeEntity = detail.badge;
    final showBadge = badgeEntity != null && (badgeEntity.title?.isNotEmpty ?? false);

    if (!showBadge) {
      return imageWidget;
    }

    return Stack(
      children: [
        Positioned.fill(child: imageWidget),
        Positioned.fill(
          child: Container(
            color: AppColorsV2.genericBlack.withValues(alpha: 0.4),
          ),
        ),
        Positioned(
          top: DimensV2.d8,
          right: DimensV2.d8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadiusV2.full),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DimensV2.d12,
                  vertical: DimensV2.d2,
                ),
                color: AppColorsV2.genericBlack.withValues(alpha: 0.35),
                child: Text(
                  badgeEntity.title!,
                  style: AppTextStylesV2.badgeLabelRegular.copyWith(
                    color: AppColorsV2.genericWhite,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

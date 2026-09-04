import 'package:flutter/foundation.dart' show listEquals;
import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';

import '../resources/generated/assets.gen.dart';

/// Displays a detailed product card featuring a large aspect ratio image area
/// at the top, a fallback placeholder when no image is available,
/// and a descriptive title plus a status badge at the bottom.
///
/// Wraps [PressableCardContainerV2] to support tap animation and drop shadow.
class ProductDetailV2 extends StatefulWidget {
  /// Creates a [ProductDetailV2] widget.
  const ProductDetailV2({
    super.key,
    required this.entity,
    this.onTap,
    this.aspectRatio = 1.0,
    this.imageFit = BoxFit.cover,
    this.borderRadius = AppRadiusV2.x3l,
  });

  /// The section item entity containing title, detail images, and badge details.
  final PHXSectionItemEntity entity;

  /// Optional tap callback.
  final VoidCallback? onTap;

  /// Optional aspect ratio for the image container, defaults to 1.0.
  final double aspectRatio;

  /// Optional image fit behavior, defaults to [BoxFit.cover].
  final BoxFit imageFit;

  /// The border radius of the card, defaults to [AppRadiusV2.x3l] (28.0).
  final double borderRadius;

  /// Creates the mutable state for this product detail card.
  @override
  State<ProductDetailV2> createState() => _ProductDetailV2State();
}

class _ProductDetailV2State extends State<ProductDetailV2> {
  static const _indicatorAnimationDuration = Duration(milliseconds: 300);

  final PageController _imagePageController = PageController();
  int _currentImagePage = 0;

  /// Resets the image gallery when [oldWidget] contains a different image list.
  @override
  void didUpdateWidget(covariant ProductDetailV2 oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldImageUrls = _resolveImageUrls(oldWidget.entity);
    final newImageUrls = _resolveImageUrls(widget.entity);
    if (listEquals(oldImageUrls, newImageUrls)) return;

    _currentImagePage = 0;
    if (_imagePageController.hasClients) {
      _imagePageController.jumpToPage(0);
    }
  }

  /// Releases the image page controller owned by this state.
  @override
  void dispose() {
    _imagePageController.dispose();
    super.dispose();
  }

  /// Builds the product detail card using the current [context].
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;
    final imageUrls = _resolveImageUrls(widget.entity);
    final badgeEntity = widget.entity.badge;
    final showBadge = badgeEntity != null && (badgeEntity.title?.isNotEmpty ?? false);

    return PressableCardContainerV2(
      onTap: widget.onTap,
      borderRadius: widget.borderRadius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImageGallery(colors, imageUrls),
          Padding(
            padding: const EdgeInsets.all(AppSpacingV2.cardLg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.entity.title ?? '',
                  style: AppTextStylesV2.text18Semibold.copyWith(
                    color: colors.txContentPrimaryDefault,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (showBadge) ...[
                  const SizedBox(height: AppSpacingV2.xs),
                  AppBadgeV2(
                    status: AppBadgeStatus.fromCode(badgeEntity.badgeType),
                    label: badgeEntity.title!,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> _resolveImageUrls(PHXSectionItemEntity entity) {
    return (entity.details ?? const <PHXSectionItemDetailEntity>[])
        .map((detail) => detail.imageUrl?.trim())
        .whereType<String>()
        .where((imageUrl) => imageUrl.isNotEmpty)
        .toList();
  }

  Widget _buildImageGallery(MayThemeColorsV2 colors, List<String> imageUrls) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: switch (imageUrls.length) {
        0 => _buildPlaceholder(colors),
        1 => _buildImageArea(colors, imageUrls.first),
        _ => Stack(
            fit: StackFit.expand,
            children: [
              PageView.builder(
                controller: _imagePageController,
                itemCount: imageUrls.length,
                onPageChanged: (index) {
                  setState(() => _currentImagePage = index);
                },
                itemBuilder: (context, index) {
                  return _buildImageArea(colors, imageUrls[index]);
                },
              ),
              _buildPageIndicator(imageUrls.length),
            ],
          ),
      },
    );
  }

  Widget _buildPageIndicator(int imageCount) {
    return Positioned(
      left: DimensV2.d0,
      right: DimensV2.d0,
      bottom: DimensV2.d8,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(DimensV2.d4),
          decoration: BoxDecoration(
            color: AppColorsV2.genericBlack.withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(DimensV2.d99),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(imageCount, _buildIndicatorItem),
          ),
        ),
      ),
    );
  }

  Widget _buildIndicatorItem(int index) {
    final isSelected = _currentImagePage == index;

    return AnimatedContainer(
      duration: _indicatorAnimationDuration,
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: DimensV2.d3),
      width: isSelected ? DimensV2.d24 : DimensV2.d8,
      height: DimensV2.d8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DimensV2.d4),
        color:
            isSelected ? AppColorsV2.genericWhite : AppColorsV2.genericWhite.withValues(alpha: 0.4),
      ),
    );
  }

  Widget _buildPlaceholder(MayThemeColorsV2 colors) {
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
          width: DimensV2.d64,
          height: DimensV2.d64,
        ),
      ),
    );
  }

  Widget _buildImageArea(
    MayThemeColorsV2 colors,
    String imageUrl,
  ) {
    return AdaptiveImageV2(
      url: imageUrl,
      fit: widget.imageFit,
      errorBuilder: (context, error) => _buildPlaceholder(colors),
    );
  }
}

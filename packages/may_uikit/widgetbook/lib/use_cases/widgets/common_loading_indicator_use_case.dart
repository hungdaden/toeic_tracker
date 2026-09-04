import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Playground',
  type: CommonLoadingIndicatorV2,
)

/// Builds a configurable preview for [CommonLoadingIndicatorV2].
Widget commonLoadingIndicatorUseCase(BuildContext context) {
  return Scaffold(
    body: const CommonLoadingIndicatorV2(),
  );
}

@UseCase(
  name: 'Gallery',
  type: CommonLoadingIndicatorV2,
)

/// Builds a gallery for [CommonLoadingIndicatorV2] palettes and sizes.
Widget commonLoadingIndicatorGalleryUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacingV2.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _LoadingPreview(title: 'Theme'),
            const SizedBox(height: AppSpacingV2.x2l),
            const _LoadingPreview(title: 'Fresh'),
            const SizedBox(height: AppSpacingV2.x2l),
            const _LoadingPreview(title: 'Vivid'),
          ],
        ),
      ),
    ),
  );
}

class _LoadingPreview extends StatelessWidget {
  const _LoadingPreview({
    required this.title,
  });

  final String title;

  /// Builds a titled loading preview.
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CommonLoadingIndicatorV2(),
        const SizedBox(height: AppSpacingV2.md),
        Text(
          title,
          style: AppTextStylesV2.text15Semibold.copyWith(
            color: context.mayColors.primaryText,
          ),
        ),
      ],
    );
  }
}

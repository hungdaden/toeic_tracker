import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const _emptyUrlFallbackLabel = 'Empty URL (Fallback)';
const _errorUrlLabel = 'Error URL';

/// Interactive playground for [CommonAvatarV2].
@UseCase(
  name: 'Playground',
  type: CommonAvatarV2,
)
Widget commonAvatarUseCase(BuildContext context) {
  final radius = context.knobs.double.slider(
    label: 'Radius',
    initialValue: 50,
    min: 20,
    max: 150,
  );

  return Scaffold(
    backgroundColor: AppColorsV2.themeLightBackground,
    body: Center(
      child: CommonAvatarV2(
        imageUrl: context.knobs.string(
          label: 'Image URL',
          initialValue: 'https://i.pravatar.cc/150?img=3',
        ),
        radius: radius,
      ),
    ),
  );
}

/// Gallery use case that showcases [CommonAvatarV2] sizes and states.
@UseCase(
  name: 'Gallery',
  type: CommonAvatarV2,
)
Widget commonAvatarGalleryUseCase(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColorsV2.themeLightBackground,
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacingV2.xl),
        child: SizedBox(
          width: 359,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Different Sizes',
                style: AppTextStylesV2.title3SemiBold.copyWith(
                  color: context.mayColors.primaryText,
                ),
              ),
              const SizedBox(height: AppSpacingV2.md),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonAvatarV2(
                    imageUrl: 'https://i.pravatar.cc/150?img=1',
                    radius: 30,
                  ),
                  CommonAvatarV2(
                    imageUrl: 'https://i.pravatar.cc/150?img=2',
                    radius: 50,
                  ),
                  CommonAvatarV2(
                    imageUrl: 'https://i.pravatar.cc/150?img=3',
                    radius: 80,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacingV2.x2l),
              Text(
                'States',
                style: AppTextStylesV2.title3SemiBold.copyWith(
                  color: context.mayColors.primaryText,
                ),
              ),
              const SizedBox(height: AppSpacingV2.md),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CommonAvatarV2(
                        imageUrl: '',
                        radius: 50,
                      ),
                      SizedBox(height: AppSpacingV2.sm),
                      Text(_emptyUrlFallbackLabel),
                    ],
                  ),
                  Column(
                    children: [
                      CommonAvatarV2(
                        imageUrl: 'https://invalid-url.com/image.png',
                        radius: 50,
                      ),
                      SizedBox(height: AppSpacingV2.sm),
                      Text(_errorUrlLabel),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

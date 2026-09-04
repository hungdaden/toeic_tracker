import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const _icArrowRightPath = 'packages/may_uikit/assets/icons/ic_arrow_right.svg';

@UseCase(
  name: 'Playground',
  type: CommonIconButtonV2,
)

/// Builds a preview for [CommonIconButtonV2].
Widget commonIconButtonUseCase(BuildContext context) {
  final hasIcon = context.knobs.boolean(
    label: 'Show Icon',
    initialValue: true,
  );
  final hasLabel = context.knobs.boolean(
    label: 'Show Label',
    initialValue: true,
  );
  final isEnabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );
  final fixedWidth = context.knobs.boolean(
    label: 'Fixed Width',
    initialValue: false,
  );

  return Scaffold(
    body: Center(
      child: SizedBox(
        width: 359,
        child: CommonIconButtonV2(
          iconPath: hasIcon ? _icArrowRightPath : null,
          label: hasLabel ? context.knobs.string(label: 'Label', initialValue: 'Button') : null,
          isEnabled: isEnabled,
          onTap: () {},
          width: fixedWidth ? 359 : null,
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Gallery',
  type: CommonIconButtonV2,
)

/// Builds a fixed gallery for reviewing [CommonIconButtonV2] states.
Widget commonIconButtonGalleryUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacingV2.xl),
        child: SizedBox(
          width: 359,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _GallerySection(
                title: 'Icon + Label',
                iconPath: _icArrowRightPath,
                label: 'Button',
              ),
              const SizedBox(height: AppSpacingV2.lg),
              _GallerySection(
                title: 'Icon only',
                iconPath: _icArrowRightPath,
                label: null,
              ),
              const SizedBox(height: AppSpacingV2.lg),
              _GallerySection(
                title: 'Label only',
                iconPath: null,
                label: 'Button',
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class _GallerySection extends StatelessWidget {
  const _GallerySection({
    required this.title,
    required this.iconPath,
    required this.label,
  });

  final String title;
  final String? iconPath;
  final String? label;

  /// Builds a gallery section for [CommonIconButtonV2] content variations.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: AppTextStylesV2.title3SemiBold.copyWith(color: colors.primaryText),
        ),
        const SizedBox(height: AppSpacingV2.md),
        CommonIconButtonV2(
          iconPath: iconPath,
          label: label,
          onTap: () {},
        ),
        const SizedBox(height: AppSpacingV2.sm),
        CommonIconButtonV2(
          iconPath: iconPath,
          label: label,
          isEnabled: false,
          onTap: () {},
        ),
      ],
    );
  }
}

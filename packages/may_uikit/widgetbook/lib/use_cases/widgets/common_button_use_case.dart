import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Playground',
  type: CommonButtonV2,
)

/// Builds a preview for [CommonButtonV2].
Widget commonButtonUseCase(BuildContext context) {
  final variant = context.knobs.object.dropdown<CommonButtonVariant>(
    label: 'Variant',
    options: CommonButtonVariant.values,
    initialOption: CommonButtonVariant.primary,
  );
  final size = context.knobs.object.dropdown<CommonButtonSize>(
    label: 'Size',
    options: CommonButtonSize.values,
    initialOption: CommonButtonSize.medium,
  );
  final loading = context.knobs.boolean(
    label: 'Loading',
    initialValue: false,
  );
  final isEnabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );
  final showSubtitle = context.knobs.boolean(
    label: 'Show Subtitle',
    initialValue: variant == CommonButtonVariant.success,
  );

  return Scaffold(
    body: Center(
      child: SizedBox(
        width: 359,
        child: CommonButtonV2(
          variant: variant,
          size: size,
          loading: loading,
          isEnabled: isEnabled,
          label: context.knobs.string(label: 'Label', initialValue: 'Button'),
          subtitle: showSubtitle
              ? context.knobs.string(label: 'Subtitle', initialValue: 'Subtitle')
              : null,
          onTap: () {},
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Gallery',
  type: CommonButtonV2,
)

/// Builds a fixed gallery for reviewing [CommonButtonV2] variants and states.
Widget commonButtonGalleryUseCase(BuildContext context) {
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
                title: 'Medium',
                size: CommonButtonSize.medium,
              ),
              const SizedBox(height: AppSpacingV2.x2l),
              _GallerySection(
                title: 'Large',
                size: CommonButtonSize.large,
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
    required this.size,
  });

  final String title;
  final CommonButtonSize size;

  /// Builds a gallery section for [CommonButtonSize].
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
        for (final variant in CommonButtonVariant.values) ...[
          CommonButtonV2(
            variant: variant,
            size: size,
            label: _labelFor(variant),
            subtitle: variant == CommonButtonVariant.success ? 'Subtitle' : null,
            onTap: () {},
          ),
          const SizedBox(height: AppSpacingV2.sm),
          CommonButtonV2(
            variant: variant,
            size: size,
            label: _labelFor(variant),
            loading: true,
            onTap: () {},
          ),
          const SizedBox(height: AppSpacingV2.sm),
          CommonButtonV2(
            variant: variant,
            size: size,
            label: _labelFor(variant),
            isEnabled: false,
            onTap: () {},
          ),
          const SizedBox(height: AppSpacingV2.lg),
        ],
      ],
    );
  }

  String _labelFor(CommonButtonVariant variant) {
    return switch (variant) {
      CommonButtonVariant.primary => 'Primary',
      CommonButtonVariant.secondary => 'Secondary',
      CommonButtonVariant.textOnly => 'Text Only',
      CommonButtonVariant.outline => 'Outline',
      CommonButtonVariant.criticalPrimary => 'Critical',
      CommonButtonVariant.criticalOutline => 'Critical Outline',
      CommonButtonVariant.success => 'LABEL',
    };
  }
}

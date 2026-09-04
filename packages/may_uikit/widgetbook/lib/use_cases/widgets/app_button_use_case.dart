import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Interactive playground for [AppButtonV2].
@UseCase(
  name: 'Playground',
  type: AppButtonV2,
)
Widget appButtonUseCase(BuildContext context) {
  final type = context.knobs.object.dropdown<ButtonType>(
    label: 'Type',
    options: ButtonType.values,
    initialOption: ButtonType.primary,
  );
  final size = context.knobs.object.dropdown<ButtonSize>(
    label: 'Size',
    options: ButtonSize.values,
    initialOption: ButtonSize.medium,
  );
  final loading = context.knobs.boolean(
    label: 'Loading',
    initialValue: false,
  );
  final isEnabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );

  return Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.md),
        child: AppButtonV2(
          type: type,
          size: size,
          loading: loading,
          isEnabled: isEnabled,
          onTap: () {},
          child: Text(context.knobs.string(label: 'Label', initialValue: 'Button')),
        ),
      ),
    ),
  );
}

/// Gallery use case that showcases [AppButtonV2] variants.
@UseCase(
  name: 'Gallery',
  type: AppButtonV2,
)
Widget appButtonGalleryUseCase(BuildContext context) {
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
                size: ButtonSize.medium,
              ),
              const SizedBox(height: AppSpacingV2.x2l),
              _GallerySection(
                title: 'Large',
                size: ButtonSize.large,
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
  final ButtonSize size;

  /// Builds a gallery section for one [ButtonSize].
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
        for (final type in ButtonType.values) ...[
          AppButtonV2(
            type: type,
            size: size,
            onTap: () {},
            child: Text(_labelFor(type)),
          ),
          const SizedBox(height: AppSpacingV2.sm),
          AppButtonV2(
            type: type,
            size: size,
            loading: true,
            onTap: () {},
            child: Text(_labelFor(type)),
          ),
          const SizedBox(height: AppSpacingV2.sm),
          AppButtonV2(
            type: type,
            size: size,
            isEnabled: false,
            onTap: () {},
            child: Text(_labelFor(type)),
          ),
          const SizedBox(height: AppSpacingV2.lg),
        ],
      ],
    );
  }

  String _labelFor(ButtonType type) {
    return switch (type) {
      ButtonType.primary => 'Primary',
      ButtonType.secondary => 'Secondary',
      ButtonType.filled => 'Filled',
      ButtonType.textOnly => 'Text Only',
      ButtonType.outline => 'Outline',
      ButtonType.cancelOutlined => 'Cancel Outlined',
      ButtonType.cancel => 'Cancel',
    };
  }
}

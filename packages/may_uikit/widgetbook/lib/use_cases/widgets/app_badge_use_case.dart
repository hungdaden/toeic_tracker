import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Interactive playground for [AppBadgeV2].
@UseCase(
  name: 'Playground',
  type: AppBadgeV2,
)
Widget appBadgeUseCase(BuildContext context) {
  final status = context.knobs.object.dropdown<AppBadgeStatus>(
    label: 'Status',
    options: AppBadgeStatus.values,
    initialOption: AppBadgeStatus.successBadge,
  );
  final isBgColor = context.knobs.boolean(
    label: 'Background Color Enabled',
    initialValue: true,
  );

  return Scaffold(
    body: Center(
      child: AppBadgeV2(
        status: status,
        label: context.knobs.string(label: 'Label', initialValue: 'Badge Label'),
        isBgColor: isBgColor,
      ),
    ),
  );
}

/// Gallery use case that showcases [AppBadgeV2] states.
@UseCase(
  name: 'Gallery',
  type: AppBadgeV2,
)
Widget appBadgeGalleryUseCase(BuildContext context) {
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
              Text(
                'Badges with Background',
                style: AppTextStylesV2.title3SemiBold.copyWith(
                  color: context.mayColors.primaryText,
                ),
              ),
              const SizedBox(height: AppSpacingV2.md),
              Wrap(
                spacing: AppSpacingV2.sm,
                runSpacing: AppSpacingV2.sm,
                children: AppBadgeStatus.values
                    .where((status) => status != AppBadgeStatus.undefined)
                    .map((status) => AppBadgeV2(
                          status: status,
                          label: _labelFor(status),
                        ))
                    .toList(),
              ),
              const SizedBox(height: AppSpacingV2.x2l),
              Text(
                'Badges without Background',
                style: AppTextStylesV2.title3SemiBold.copyWith(
                  color: context.mayColors.primaryText,
                ),
              ),
              const SizedBox(height: AppSpacingV2.md),
              Wrap(
                spacing: AppSpacingV2.sm,
                runSpacing: AppSpacingV2.sm,
                children: AppBadgeStatus.values
                    .where((status) => status != AppBadgeStatus.undefined)
                    .map((status) => AppBadgeV2(
                          status: status,
                          label: _labelFor(status),
                          isBgColor: false,
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

String _labelFor(AppBadgeStatus status) {
  return switch (status) {
    AppBadgeStatus.defaultBadge => 'Default',
    AppBadgeStatus.successBadge => 'Success',
    AppBadgeStatus.criticalBadge => 'Critical',
    AppBadgeStatus.attentionBadge => 'Attention',
    AppBadgeStatus.warningBadge => 'Warning',
    AppBadgeStatus.infoBadge => 'Info',
    AppBadgeStatus.noInfoBadge => 'No Info',
    AppBadgeStatus.undefined => 'Undefined',
  };
}

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Interactive playground for [CardInfoV2].
@UseCase(name: 'Playground', type: CardInfoV2)
Widget cardInfoUseCase(BuildContext context) {
  final colors = context.mayColors;

  // Title & Icon
  final title = context.knobs.string(label: 'Title', initialValue: 'Payment Information');
  final hasIcon = context.knobs.boolean(label: 'Show Icon', initialValue: false);
  final iconUrl = context.knobs.string(
    label: 'Icon URL',
    initialValue: 'https://cdn-icons-png.flaticon.com/512/10014/10014022.png',
  );
  final hasAvatar = context.knobs.boolean(label: 'Show Avatar', initialValue: false);
  final avatarUrl = context.knobs.string(
    label: 'Avatar URL',
    initialValue:
        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde'
        '?auto=format&fit=crop&w=150&h=150',
  );

  // Interaction
  final isInteractive = context.knobs.boolean(label: 'Is Interactive (onTap)', initialValue: true);

  // Spacing & Styling
  final borderRadiusValue = context.knobs.double.slider(
    label: 'Border Radius',
    initialValue: DimensV2.d24,
    min: 0,
    max: 40,
  );
  final customPadding = context.knobs.boolean(label: 'Custom Padding', initialValue: false);
  final paddingValue = context.knobs.double.slider(
    label: 'Padding Value',
    initialValue: DimensV2.d20,
    min: 0,
    max: 40,
  );
  final backgroundOpacity = context.knobs.double.slider(
    label: 'Background Opacity',
    initialValue: 0.0,
    min: 0.0,
    max: 1.0,
  );
  final rowSpacing = context.knobs.double.slider(
    label: 'Row Spacing',
    initialValue: DimensV2.d12,
    min: 0,
    max: 40,
  );
  final headerSpacing = context.knobs.double.slider(
    label: 'Header Spacing',
    initialValue: DimensV2.d12,
    min: 0,
    max: 40,
  );
  final itemSpacing = context.knobs.double.slider(
    label: 'Item Spacing',
    initialValue: DimensV2.d24,
    min: 0,
    max: 80,
  );

  // Badge
  final hasBadge = context.knobs.boolean(label: 'Show Header Badge', initialValue: true);
  final badgeLabel = context.knobs.string(label: 'Header Badge Label', initialValue: 'Pending');
  final badgeStatus = context.knobs.object.dropdown<AppBadgeStatus>(
    label: 'Header Badge Status',
    options: AppBadgeStatus.values,
    initialOption: AppBadgeStatus.attentionBadge,
  );

  // Shadow
  final showShadow = context.knobs.boolean(label: 'Show Shadow', initialValue: false);

  // Row 1 Item 1
  final r1i1Label = context.knobs.string(label: 'R1 Item 1 Label', initialValue: 'Amount');
  final r1i1Value = context.knobs.string(label: 'R1 Item 1 Value', initialValue: '\$120.00');
  final r1i1IsBold = context.knobs.boolean(label: 'R1 Item 1 Is Bold', initialValue: true);
  final r1i1HasBadge = context.knobs.boolean(label: 'R1 Item 1 Has Badge', initialValue: false);
  final r1i1BadgeLabel = context.knobs.string(label: 'R1 Item 1 Badge Label', initialValue: 'Paid');
  final r1i1BadgeStatus = context.knobs.object.dropdown<AppBadgeStatus>(
    label: 'R1 Item 1 Badge Status',
    options: AppBadgeStatus.values,
    initialOption: AppBadgeStatus.successBadge,
  );
  final r1i1IsFullRow = context.knobs.boolean(label: 'R1 Item 1 Is Full Row', initialValue: false);

  // Row 1 Item 2
  final r1i2Label = context.knobs.string(label: 'R1 Item 2 Label', initialValue: 'Date');
  final r1i2Value = context.knobs.string(label: 'R1 Item 2 Value', initialValue: '2026-06-03');
  final r1i2IsBold = context.knobs.boolean(label: 'R1 Item 2 Is Bold', initialValue: false);
  final r1i2HasBadge = context.knobs.boolean(label: 'R1 Item 2 Has Badge', initialValue: false);
  final r1i2BadgeLabel = context.knobs.string(
    label: 'R1 Item 2 Badge Label',
    initialValue: 'Success',
  );
  final r1i2BadgeStatus = context.knobs.object.dropdown<AppBadgeStatus>(
    label: 'R1 Item 2 Badge Status',
    options: AppBadgeStatus.values,
    initialOption: AppBadgeStatus.successBadge,
  );
  final r1i2IsFullRow = context.knobs.boolean(label: 'R1 Item 2 Is Full Row', initialValue: false);

  // Row 2 Item 1
  final r2i1Label = context.knobs.string(label: 'R2 Item 1 Label', initialValue: 'Method');
  final r2i1Value = context.knobs.string(label: 'R2 Item 1 Value', initialValue: 'Credit Card');
  final r2i1IsBold = context.knobs.boolean(label: 'R2 Item 1 Is Bold', initialValue: false);
  final r2i1HasBadge = context.knobs.boolean(label: 'R2 Item 1 Has Badge', initialValue: false);
  final r2i1BadgeLabel = context.knobs.string(
    label: 'R2 Item 1 Badge Label',
    initialValue: 'Pending',
  );
  final r2i1BadgeStatus = context.knobs.object.dropdown<AppBadgeStatus>(
    label: 'R2 Item 1 Badge Status',
    options: AppBadgeStatus.values,
    initialOption: AppBadgeStatus.attentionBadge,
  );
  final r2i1IsFullRow = context.knobs.boolean(label: 'R2 Item 1 Is Full Row', initialValue: false);

  // Row 2 Item 2
  final r2i2Label = context.knobs.string(label: 'R2 Item 2 Label', initialValue: 'Status');
  final r2i2Value = context.knobs.string(label: 'R2 Item 2 Value', initialValue: 'Processing');
  final r2i2IsBold = context.knobs.boolean(label: 'R2 Item 2 Is Bold', initialValue: false);
  final r2i2HasBadge = context.knobs.boolean(label: 'R2 Item 2 Has Badge', initialValue: true);
  final r2i2BadgeLabel = context.knobs.string(
    label: 'R2 Item 2 Badge Label',
    initialValue: 'Processing',
  );
  final r2i2BadgeStatus = context.knobs.object.dropdown<AppBadgeStatus>(
    label: 'R2 Item 2 Badge Status',
    options: AppBadgeStatus.values,
    initialOption: AppBadgeStatus.attentionBadge,
  );
  final r2i2IsFullRow = context.knobs.boolean(label: 'R2 Item 2 Is Full Row', initialValue: false);

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.md),
        child: SizedBox(
          width: 359,
          child: CardInfoV2(
            title: title,
            icon: hasIcon ? iconUrl : null,
            avatar: hasAvatar ? avatarUrl : null,
            badge: hasBadge ? CardInfoBadgeData(label: badgeLabel, status: badgeStatus) : null,
            onTap: isInteractive ? () {} : null,
            borderRadius: borderRadiusValue,
            padding: customPadding ? EdgeInsets.all(paddingValue) : null,
            backgroundOpacity: backgroundOpacity,
            rowSpacing: rowSpacing,
            headerSpacing: headerSpacing,
            itemSpacing: itemSpacing,
            boxShadow: showShadow ? AppShadowsV2.defaultShadow(colors.sdDefault) : null,
            rows: [
              RegistrationInfoRowData(
                items: [
                  CardInfoEntry(
                    label: r1i1Label,
                    value: r1i1Value,
                    isBold: r1i1IsBold,
                    isFullRow: r1i1IsFullRow,
                    badge:
                        r1i1HasBadge
                            ? CardInfoBadgeData(label: r1i1BadgeLabel, status: r1i1BadgeStatus)
                            : null,
                  ),
                  CardInfoEntry(
                    label: r1i2Label,
                    value: r1i2Value,
                    isBold: r1i2IsBold,
                    isFullRow: r1i2IsFullRow,
                    badge:
                        r1i2HasBadge
                            ? CardInfoBadgeData(label: r1i2BadgeLabel, status: r1i2BadgeStatus)
                            : null,
                  ),
                ],
              ),
              RegistrationInfoRowData(
                items: [
                  CardInfoEntry(
                    label: r2i1Label,
                    value: r2i1Value,
                    isBold: r2i1IsBold,
                    isFullRow: r2i1IsFullRow,
                    badge:
                        r2i1HasBadge
                            ? CardInfoBadgeData(label: r2i1BadgeLabel, status: r2i1BadgeStatus)
                            : null,
                  ),
                  CardInfoEntry(
                    label: r2i2Label,
                    value: r2i2Value,
                    isBold: r2i2IsBold,
                    isFullRow: r2i2IsFullRow,
                    badge:
                        r2i2HasBadge
                            ? CardInfoBadgeData(label: r2i2BadgeLabel, status: r2i2BadgeStatus)
                            : null,
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

/// Gallery use case that showcases [CardInfoV2] layouts.
@UseCase(name: 'Gallery', type: CardInfoV2)
Widget cardInfoGalleryUseCase(BuildContext context) {
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
                'Standard Info Card',
                style: AppTextStylesV2.title3SemiBold.copyWith(
                  color: context.mayColors.primaryText,
                ),
              ),
              const SizedBox(height: AppSpacingV2.md),
              const CardInfoV2(
                title: 'Student Profile',
                avatarName: 'Lê Anh Tuấn',
                avatarUrl:
                    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde'
                    '?auto=format&fit=crop&w=150&h=150',
                rows: [
                  RegistrationInfoRowData(
                    items: [
                      CardInfoEntry(label: 'Name', value: 'John Doe', isBold: true),
                      CardInfoEntry(label: 'Grade', value: '10th'),
                    ],
                  ),
                  RegistrationInfoRowData(items: [CardInfoEntry(label: 'ID', value: 'STD-12345')]),
                ],
              ),
              const SizedBox(height: AppSpacingV2.x2l),
              Text(
                'Interactive with Badge',
                style: AppTextStylesV2.title3SemiBold.copyWith(
                  color: context.mayColors.primaryText,
                ),
              ),
              const SizedBox(height: AppSpacingV2.md),
              CardInfoV2(
                title: 'Subscription',
                badge: const CardInfoBadgeData(
                  label: 'Active',
                  status: AppBadgeStatus.successBadge,
                ),
                onTap: () {},
                rows: const [
                  RegistrationInfoRowData(
                    items: [
                      CardInfoEntry(label: 'Plan', value: 'Premium', isBold: true),
                      CardInfoEntry(label: 'Renewal', value: 'Auto'),
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

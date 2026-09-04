import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const _avatarUrl =
    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde'
    '?auto=format&fit=crop&w=150&h=150';

@UseCase(name: 'Playground', type: CardInfoRowListV2)
/// Builds the interactive [CardInfoRowListV2] playground.
Widget cardInfoRowListUseCase(BuildContext context) {
  final colors = context.mayColors;

  final isItemsBold = context.knobs.boolean(label: 'Bold Values', initialValue: false);
  final showItemBadges = context.knobs.boolean(label: 'Show Item Badges', initialValue: false);
  final badgeStatus = context.knobs.object.dropdown<AppBadgeStatus>(
    label: 'Badge Status',
    options: AppBadgeStatus.values.where((status) => status != AppBadgeStatus.undefined).toList(),
    initialOption: AppBadgeStatus.criticalBadge,
  );
  final badgeLabel = context.knobs.string(label: 'Badge Label', initialValue: 'Unpaid');

  final showItemAvatar = context.knobs.boolean(label: 'Show Item Avatar', initialValue: true);
  final avatarInputUrl = context.knobs.string(label: 'Avatar URL', initialValue: _avatarUrl);

  final showItemTitle = context.knobs.boolean(label: 'Show Item Title', initialValue: true);
  final titleText = context.knobs.string(label: 'Item Title', initialValue: 'First Semester');

  final itemSpacing = context.knobs.double.slider(
    label: 'Item Spacing',
    initialValue: AppSpacingV2.sm,
    min: 0,
    max: 80,
  );

  final rows = [
    RegistrationInfoRowData(
      avatar: showItemAvatar ? avatarInputUrl : null,
      title: showItemTitle ? titleText : null,
      items: [
        CardInfoEntry(
          label: 'Tuition Fee',
          value: '\$500.00',
          isBold: isItemsBold,
          badge: showItemBadges ? CardInfoBadgeData(label: badgeLabel, status: badgeStatus) : null,
        ),
        CardInfoEntry(
          label: 'Library Fee',
          value: '\$50.00',
          isBold: isItemsBold,
          badge:
              showItemBadges
                  ? const CardInfoBadgeData(label: 'Paid', status: AppBadgeStatus.successBadge)
                  : null,
        ),
        CardInfoEntry(
          label: 'Lab Fee',
          value: '\$20.00',
          isBold: isItemsBold,
          badge:
              showItemBadges
                  ? const CardInfoBadgeData(label: 'Unpaid', status: AppBadgeStatus.criticalBadge)
                  : null,
        ),
        CardInfoEntry(
          label: 'Lab Fee',
          value: '\$20.00',
          isBold: isItemsBold,
          badge:
              showItemBadges
                  ? const CardInfoBadgeData(label: 'Unpaid', status: AppBadgeStatus.criticalBadge)
                  : null,
        ),
        CardInfoEntry(
          label: 'Lab Fee',
          value: '\$20.00',
          isBold: isItemsBold,
          badge:
              showItemBadges
                  ? const CardInfoBadgeData(label: 'Unpaid', status: AppBadgeStatus.criticalBadge)
                  : null,
        ),
      ],
    ),
  ];

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.md),
        child: SizedBox(width: 359, child: CardInfoRowListV2(rows: rows, itemSpacing: itemSpacing)),
      ),
    ),
  );
}

@UseCase(name: 'Gallery', type: CardInfoRowListV2)
/// Builds the [CardInfoRowListV2] gallery.
Widget cardInfoRowListGalleryUseCase(BuildContext context) {
  final colors = context.mayColors;

  final rows = [
    const RegistrationInfoRowData(
      avatar: _avatarUrl,
      title: 'Payment 1',
      items: [
        CardInfoEntry(label: 'Amount', value: '\$120.00', isBold: true),
        CardInfoEntry(label: 'Date', value: '10/06/2026'),
        CardInfoEntry(
          label: 'Status',
          value: 'Paid',
          badge: CardInfoBadgeData(label: 'Paid', status: AppBadgeStatus.successBadge),
        ),
      ],
    ),
    const RegistrationInfoRowData(
      avatar: _avatarUrl,
      title: 'Payment 2',
      items: [
        CardInfoEntry(label: 'Amount', value: '\$80.00', isBold: true),
        CardInfoEntry(label: 'Date', value: '12/06/2026'),
        CardInfoEntry(
          label: 'Status',
          value: 'Pending',
          badge: CardInfoBadgeData(label: 'Pending', status: AppBadgeStatus.attentionBadge),
        ),
      ],
    ),
  ];

  return Scaffold(
    backgroundColor: colors.background,
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
                'List Card Layout',
                style: AppTextStylesV2.title3SemiBold.copyWith(color: colors.primaryText),
              ),
              const SizedBox(height: AppSpacingV2.md),
              CardInfoRowListV2(rows: rows),
            ],
          ),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const _defaultIconUrl = 'https://cdn-icons-png.flaticon.com/512/1828/1828640.png';

@UseCase(name: 'Playground', type: ContentStatusCardV2)
/// Builds the interactive [ContentStatusCardV2] playground.
Widget contentStatusCardUseCase(BuildContext context) {
  final colors = context.mayColors;
  final showBadge = context.knobs.boolean(label: 'Show Badge', initialValue: true);
  final badgeStatus = context.knobs.object.dropdown<AppBadgeStatus>(
    label: 'Badge Status',
    options: AppBadgeStatus.values.where((status) => status != AppBadgeStatus.undefined).toList(),
    initialOption: AppBadgeStatus.infoBadge,
  );
  final isInteractive = context.knobs.boolean(label: 'Is Interactive (onTap)', initialValue: true);
  final descriptions =
      context.knobs
          .string(label: 'Descriptions', initialValue: '10 môn học được nhận xét')
          .split('\n')
          .where((description) => description.trim().isNotEmpty)
          .toList();

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacingV2.xl),
        child: SizedBox(
          width: 359,
          child: ContentStatusCardV2(
            iconUrl: context.knobs.string(label: 'Icon URL', initialValue: _defaultIconUrl),
            subtitle: context.knobs.string(label: 'Subtitle', initialValue: '15/10/2026 09:00'),
            title: context.knobs.string(
              label: 'Title',
              initialValue: 'Nhận xét tình hình học tập T10/2026',
            ),
            descriptions: descriptions,
            badgeStatus: showBadge ? badgeStatus : null,
            badgeLabel:
                showBadge
                    ? context.knobs.string(label: 'Badge Label', initialValue: 'Nhận xét mới')
                    : null,
            onTap: isInteractive ? () {} : null,
          ),
        ),
      ),
    ),
  );
}

@UseCase(name: 'Gallery', type: ContentStatusCardV2)
/// Builds the [ContentStatusCardV2] gallery.
Widget contentStatusCardGalleryUseCase(BuildContext context) {
  final colors = context.mayColors;

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacingV2.xl),
        child: SizedBox(
          width: 359,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Default',
                style: AppTextStylesV2.title3SemiBold.copyWith(color: colors.primaryText),
              ),
              const SizedBox(height: AppSpacingV2.md),
              const ContentStatusCardV2(
                iconUrl: _defaultIconUrl,
                subtitle: '15/10/2026 09:00',
                title: 'Nhận xét tình hình học tập T10/2026',
                descriptions: ['10 môn học được nhận xét'],
                badgeStatus: AppBadgeStatus.infoBadge,
                badgeLabel: 'Nhận xét mới',
              ),
              const SizedBox(height: AppSpacingV2.x2l),
              Text(
                'Without Badge',
                style: AppTextStylesV2.title3SemiBold.copyWith(color: colors.primaryText),
              ),
              const SizedBox(height: AppSpacingV2.md),
              const ContentStatusCardV2(
                iconUrl: _defaultIconUrl,
                subtitle: '15/09/2026 09:00',
                title: 'Nhận xét tình hình học tập T9/2026',
                descriptions: ['10 môn học được nhận xét'],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

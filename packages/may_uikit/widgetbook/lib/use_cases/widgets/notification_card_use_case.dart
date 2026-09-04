import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Playground', type: NotificationCardV2)
/// Interactive playground for [NotificationCardV2].
Widget notificationCardUseCase(BuildContext context) {
  final colors = context.mayColors;
  final showRedDot = context.knobs.boolean(label: 'Show Red Dot', initialValue: true);
  final isNext = context.knobs.boolean(label: 'Is Next Arrow', initialValue: true);
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'THÔNG BÁO CHO CHUYỂN TIẾP',
  );
  final subtitle = context.knobs.string(
    label: 'SubTitle',
    initialValue: 'T5, 23/04/2026 10:58',
  );
  final descriptions = context.knobs
      .string(
        label: 'Descriptions (newline separated)',
        initialValue: 'MÔ TẢ NGẮN\nChi tiết thông báo bổ sung',
      )
      .split('\n')
      .where((d) => d.trim().isNotEmpty)
      .toList();

  final entity = PHXSectionItemEntity(
    title: title,
    subTitle: subtitle,
    description: descriptions,
    redDot: showRedDot,
    isNext: isNext,
    avatarName: context.knobs.string(
      label: 'Avatar Name',
      initialValue: 'Phạm Nhật Minh',
    ),
    avatarSubtitle: context.knobs.string(
      label: 'Avatar Subtitle',
      initialValue: 'Lớp 10A1 Demo',
    ),
    avatarUrl: 'https://cdn-icons-png.flaticon.com/512/1828/1828640.png',
    multiBadge: const [
      PHXMultiBadgeEntity(title: 'Gửi tới tôi', badgeType: 'INFO'),
      PHXMultiBadgeEntity(title: 'Sự kiện - Thông báo', badgeType: 'DEFAULT'),
    ],
  );

  return Scaffold(
    backgroundColor: colors.bgAppSurface,
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacingV2.xl),
        child: SizedBox(
          width: 359,
          child: NotificationCardV2(
            entity: entity,
            onTap: () {},
          ),
        ),
      ),
    ),
  );
}

@UseCase(name: 'Gallery', type: NotificationCardV2)
/// Gallery use case that showcases [NotificationCardV2] variants.
Widget notificationCardGalleryUseCase(BuildContext context) {
  final colors = context.mayColors;

  final sample1 = PHXSectionItemEntity(
    title: 'THÔNG BÁO CHO CHUYỂN TIẾP',
    subTitle: 'T5, 23/04/2026 10:58',
    description: const ['MÔ TẢ NGẮN'],
    redDot: true,
    isNext: true,
    avatarName: 'Phạm Nhật Minh',
    avatarSubtitle: 'Lớp 10A1 Demo - PS230194',
    avatarUrl: 'https://cdn-icons-png.flaticon.com/512/1828/1828640.png',
    multiBadge: const [
      PHXMultiBadgeEntity(title: 'Gửi tới tôi', badgeType: 'INFO'),
      PHXMultiBadgeEntity(title: 'Sự kiện - Thông báo', badgeType: 'DEFAULT'),
    ],
  );

  final sample2 = PHXSectionItemEntity(
    title: 'Mở cổng đăng ký tuyển sinh các khối giữa năm',
    subTitle: 'T4, 22/04/2026 16:40',
    description: const ['Năm học 2024 - 2025, hệ thống giáo dục BMS tuyển sinh bổ sung.'],
    redDot: false,
    isNext: true,
    avatarName: 'Trịnh Trung An',
    avatarSubtitle: 'Lớp 6A1 Demo',
    multiBadge: const [
      PHXMultiBadgeEntity(title: 'Thông báo quan trọng', badgeType: 'CRITICAL'),
    ],
  );

  return Scaffold(
    backgroundColor: colors.bgAppSurface,
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacingV2.xl),
        child: SizedBox(
          width: 359,
          child: Column(
            children: [
              NotificationCardV2(entity: sample1, onTap: () {}),
              const SizedBox(height: AppSpacingV2.md),
              NotificationCardV2(entity: sample2, onTap: () {}),
            ],
          ),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Playground',
  type: AppMultiBadgeV2,
)
/// Interactive playground use case for [AppMultiBadgeV2].
Widget appMultiBadgeUseCase(BuildContext context) {
  final badgeType = context.knobs.object.dropdown<AppMultiBadgeType>(
    label: 'Badge Type',
    options: AppMultiBadgeType.values,
    initialOption: AppMultiBadgeType.info,
  );

  return Scaffold(
    body: Center(
      child: AppMultiBadgeV2(
        label: context.knobs.string(label: 'Label', initialValue: 'Sự kiện - Thông báo'),
        badgeType: badgeType.name,
      ),
    ),
  );
}

@UseCase(
  name: 'Gallery',
  type: AppMultiBadgeV2,
)
/// Gallery use case that showcases all variants of [AppMultiBadgeV2].
Widget appMultiBadgeGalleryUseCase(BuildContext context) {
  return Scaffold(
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacingV2.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: AppMultiBadgeType.values.map((type) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacingV2.md),
              child: AppMultiBadgeV2(
                label: 'Badge Variant (${type.name.toUpperCase()})',
                badgeType: type.name,
              ),
            );
          }).toList(),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:may_uikit/resources/generated/assets.gen.dart';

@UseCase(
  name: 'Playground',
  type: ActionTileV2,
)
/// Playground use case for [ActionTileV2] in widgetbook.
Widget actionTileUseCase(BuildContext context) {
  final colors = context.mayColors;

  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Lịch sử thực đơn',
  );

  final showDivider = context.knobs.boolean(
    label: 'Show Divider',
    initialValue: true,
  );

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.md),
        child: Container(
          decoration: BoxDecoration(
            color: colors.bgCard,
            borderRadius: BorderRadius.circular(DimensV2.d28),
            border: Border.all(
              color: colors.bdDefault,
              width: DimensV2.d_05,
            ),
          ),
          child: ActionTileV2(
            title: title,
            icon: Assets.icons.icArrowRight.keyName,
            showDivider: showDivider,
          ),
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Figma Demo',
  type: ActionTileV2,
)
/// Figma demo use case for [ActionTileV2] in widgetbook.
Widget actionTileFigmaUseCase(BuildContext context) {
  final colors = context.mayColors;

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.md),
        child: Container(
          decoration: BoxDecoration(
            color: colors.bgCard,
            borderRadius: BorderRadius.circular(DimensV2.d28),
            border: Border.all(
              color: colors.bdDefault,
              width: DimensV2.d_05,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ActionTileV2(
                title: 'Lịch sử thực đơn',
                icon: Assets.icons.icArrowRight.keyName,
                showDivider: true,
              ),
              ActionTileV2(
                title: 'Danh sách góp ý',
                icon: Assets.icons.icArrowRight.keyName,
                showDivider: false,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

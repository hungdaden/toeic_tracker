import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Playground',
  type: CardInfoSquareV2,
)

/// Builds the interactive [CardInfoSquareV2] playground.
Widget cardInfoSquareV2UseCase(BuildContext context) {
  final colors = context.mayColors;

  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Điểm TB kỳ',
  );

  final value = context.knobs.string(
    label: 'Value',
    initialValue: '100',
  );

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: SizedBox(
        width: 160,
        child: CardInfoSquareV2(
          title: title,
          value: value,
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Gallery',
  type: CardInfoSquareV2,
)

/// Builds the [CardInfoSquareV2] gallery showcasing common states.
Widget cardInfoSquareV2GalleryUseCase(BuildContext context) {
  final colors = context.mayColors;

  return Scaffold(
    backgroundColor: colors.background,
    body: Padding(
      padding: const EdgeInsets.all(AppSpacingV2.lg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 160,
            child: CardInfoSquareV2(
              title: 'Điểm TB kỳ',
              value: '100',
            ),
          ),
          const SizedBox(width: AppSpacingV2.md),
          SizedBox(
            width: 160,
            child: CardInfoSquareV2(
              title: 'KQĐG rèn luyện',
              value: 'Tốt',
            ),
          ),
        ],
      ),
    ),
  );
}

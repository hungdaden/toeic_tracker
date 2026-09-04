import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Playground',
  type: CardListGroupV2,
)

/// Builds the interactive [CardListGroupV2] playground.
Widget cardListGroupV2UseCase(BuildContext context) {
  final colors = context.mayColors;

  final itemCount = context.knobs.int.slider(
    label: 'Item Count',
    initialValue: 3,
    min: 1,
    max: 5,
  );

  final months = ['12', '11', '10', '9', '8'];

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.lg),
        child: CardListGroupV2(
          items: [
            for (int i = 0; i < itemCount; i++)
              CardListGroupItemData(
                title: 'Tháng ${months[i % months.length]}/2025',
                subtitle: 'Điểm TB tháng: 100 - Rèn luyện: Tốt',
                onTap: () {},
              ),
          ],
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Gallery',
  type: CardListGroupV2,
)

/// Builds the [CardListGroupV2] gallery showcasing common states.
Widget cardListGroupV2GalleryUseCase(BuildContext context) {
  final colors = context.mayColors;

  return Scaffold(
    backgroundColor: colors.background,
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacingV2.lg),
      child: CardListGroupV2(
        items: const [
          CardListGroupItemData(
            title: 'Tháng 12/2025',
            subtitle: 'Điểm TB tháng: 100 - Rèn luyện: Tốt',
          ),
          CardListGroupItemData(
            title: 'Tháng 11/2025',
            subtitle: 'Điểm TB tháng: 100 - Rèn luyện: Tốt',
          ),
          CardListGroupItemData(
            title: 'Tháng 10/2025',
            subtitle: 'Điểm TB tháng: 100 - Rèn luyện: Tốt',
          ),
          CardListGroupItemData(
            title: 'Tháng 9/2025',
            subtitle: 'Điểm TB tháng: 100 - Rèn luyện: Tốt',
          ),
          CardListGroupItemData(
            title: 'Tháng 8/2025',
            subtitle: 'Điểm TB tháng: 100 - Rèn luyện: Tốt',
          ),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Interactive playground for [CardListV2].
@UseCase(
  name: 'Playground',
  type: CardListV2,
)
Widget cardListUseCase(BuildContext context) {
  final listType = context.knobs.object.dropdown<CardListType>(
    label: 'List Type',
    options: CardListType.values,
    initialOption: CardListType.card,
  );
  final isMultiSelect = context.knobs.boolean(
    label: 'Multi Select',
    initialValue: false,
  );

  final isLoading = context.knobs.boolean(
    label: 'Loading',
    initialValue: false,
  );

  final isShowCheckbox = context.knobs.boolean(
    label: 'Show Checkbox',
    initialValue: true,
  );

  final options = [
    const CardListOptionV2(
      value: '1',
      name: 'Option 1',
      subtitle: 'This is the first option',
    ),
    const CardListOptionV2(
      value: '2',
      name: 'Option 2',
      subtitle: 'This is the second option',
    ),
    const CardListOptionV2(
      value: '3',
      name: 'Option 3',
      subtitle: 'This is the third option',
      enabled: false,
    ),
  ];

  return Scaffold(
    backgroundColor: AppColorsV2.themeLightBackground,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.md),
        child: CardListV2<String>(
          options: options,
          listType: listType,
          isMultiSelect: isMultiSelect,
          isLoading: isLoading,
          isShowCheckbox: isShowCheckbox,
          onSelectionChanged: (values) {},
        ),
      ),
    ),
  );
}

/// Gallery use case that showcases [CardListV2] configurations.
@UseCase(
  name: 'Gallery',
  type: CardListV2,
)
Widget cardListGalleryUseCase(BuildContext context) {
  final options = [
    const CardListOptionV2(
      value: 'A',
      name: 'Credit Card',
      subtitle: '**** **** **** 1234',
    ),
    const CardListOptionV2(
      value: 'B',
      name: 'Bank Transfer',
      subtitle: 'Direct wire transfer',
    ),
  ];

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
                'Grouped List',
                style: AppTextStylesV2.title3SemiBold.copyWith(
                  color: context.mayColors.primaryText,
                ),
              ),
              const SizedBox(height: AppSpacingV2.md),
              CardListV2<String>(
                options: options,
                listType: CardListType.grouped,
                selectedValues: const ['A'],
                isShowCheckbox: true,
              ),
              const SizedBox(height: AppSpacingV2.x2l),
              Text(
                'Card List',
                style: AppTextStylesV2.title3SemiBold.copyWith(
                  color: context.mayColors.primaryText,
                ),
              ),
              const SizedBox(height: AppSpacingV2.md),
              CardListV2<String>(
                options: options,
                listType: CardListType.card,
                selectedValues: const ['B'],
                isShowCheckbox: true,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

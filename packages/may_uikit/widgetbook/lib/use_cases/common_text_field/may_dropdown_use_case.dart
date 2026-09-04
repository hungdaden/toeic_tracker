// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Interactive playground for [CommonTextField] (dropdown variant) that
/// exposes every visual configuration (state, label, placeholder, value,
/// hint, chevron, …).
@UseCase(
  name: 'Dropdown Playground',
  type: CommonTextField,
)

/// Builds the dropdown playground for the Widgetbook gallery.
Widget mayDropdownUseCase(BuildContext context) {
  final colors = context.mayColors;
  final forceState = context.knobs.object.dropdown<MayFieldState>(
    label: 'State (override)',
    description: 'Pick a specific state. Toggle "Use auto-derive" off to '
        'disable the override.',
    options: MayFieldState.values,
    initialOption: MayFieldState.unfilled,
  );
  final useAutoState = context.knobs.boolean(
    label: 'Use auto-derive',
    initialValue: true,
  );
  final showLabel = context.knobs.boolean(
    label: 'Show label',
    initialValue: true,
  );
  final showHint = context.knobs.boolean(
    label: 'Show hint / error message',
    initialValue: true,
  );
  final showChevron = context.knobs.boolean(
    label: 'Show chevron',
    initialValue: true,
  );
  final isEnabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );
  final hasError = context.knobs.boolean(
    label: 'Has error',
    initialValue: false,
  );
  final hasValue = context.knobs.boolean(
    label: 'Has selected value',
    initialValue: true,
  );

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.lg),
        child: CommonTextField(
          variant: CommonTextFieldVariant.dropdown,
          state: useAutoState ? null : forceState,
          label: context.knobs.string(
            label: 'Label',
            initialValue: 'Grade',
          ),
          placeholder: context.knobs.string(
            label: 'Placeholder',
            initialValue: 'Select a grade',
          ),
          value: hasValue
              ? context.knobs.string(
                  label: 'Selected value',
                  initialValue: 'Lớp 12A1',
                )
              : null,
          hintOrErrorMessage: context.knobs.string(
            label: 'Hint / error message',
            initialValue: 'Chọn lớp để tiếp tục',
          ),
          showLabel: showLabel,
          showHintOrErrorMessage: showHint,
          showChevron: showChevron,
          isEnabled: isEnabled,
          hasError: hasError,
          onTap: () {
            // Host would open a picker here.
          },
        ),
      ),
    ),
  );
}

/// Gallery that previews every state of [CommonTextField] in the Figma
/// "Fields / Dropdown" row.
@UseCase(
  name: 'Dropdown Gallery',
  type: CommonTextField,
)

/// Builds the gallery row that renders all dropdown states side-by-side.
Widget mayDropdownGalleryUseCase(BuildContext context) {
  final colors = context.mayColors;

  /// Renders a labeled section used to group field variants in the gallery.
  Widget section({required String label, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacingV2.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacingV2.lg,
              vertical: AppSpacingV2.sm,
            ),
            child: Text(
              label,
              style: AppTextStylesV2.bodySemiBold.copyWith(
                color: colors.primaryText,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacingV2.lg),
            child: child,
          ),
        ],
      ),
    );
  }

  const defaultRow = <(String, MayFieldState, String?)>[
    ('Default — Unselected', MayFieldState.unfilled, null),
    ('Default — Selected', MayFieldState.filled, 'Lớp 12A1'),
    ('Default — Error Unselected', MayFieldState.errorUnfilled, null),
    ('Default — Error Selected', MayFieldState.errorFilled, 'Lớp 12A1'),
    ('Default — Disable', MayFieldState.disabled, 'Lớp 12A1'),
  ];

  return Scaffold(
    backgroundColor: colors.background,
    body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacingV2.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          section(
            label: 'Default',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final entry in defaultRow) ...[
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacingV2.x2s),
                    child: Text(
                      entry.$1,
                      style: AppTextStylesV2.footNoteRegular.copyWith(
                        color: colors.secondaryText,
                      ),
                    ),
                  ),
                  CommonTextField(
                    variant: CommonTextFieldVariant.dropdown,
                    state: entry.$2,
                    label: 'Grade',
                    placeholder: 'Select a grade',
                    value: entry.$3,
                    hintOrErrorMessage: entry.$2 == MayFieldState.errorFilled ||
                            entry.$2 == MayFieldState.errorUnfilled
                        ? 'Vui lòng chọn lớp'
                        : 'Chọn lớp để tiếp tục',
                  ),
                  const SizedBox(height: AppSpacingV2.md),
                ],
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

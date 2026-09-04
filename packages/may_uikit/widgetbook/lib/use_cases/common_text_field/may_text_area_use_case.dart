// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Interactive playground for [CommonTextField] (textArea variant) that
/// exposes every visual configuration (state, label, placeholder, value,
/// hint, sizing, …).
@UseCase(
  name: 'Text Area Playground',
  type: CommonTextField,
)

/// Builds the text-area playground for the Widgetbook gallery.
Widget mayTextAreaUseCase(BuildContext context) {
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
  final isReadOnly = context.knobs.boolean(
    label: 'Read-only',
    initialValue: false,
  );
  final isEnabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );
  final hasError = context.knobs.boolean(
    label: 'Has error',
    initialValue: false,
  );
  final minLines = context.knobs.int.slider(
    label: 'Min lines',
    initialValue: 3,
    min: 1,
    max: 8,
  );
  final maxLines = context.knobs.int.slider(
    label: 'Max lines',
    initialValue: 5,
    min: 1,
    max: 12,
  );

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.lg),
        child: CommonTextField(
          variant: CommonTextFieldVariant.textArea,
          state: useAutoState ? null : forceState,
          label: context.knobs.string(
            label: 'Label',
            initialValue: 'Description',
          ),
          placeholder: context.knobs.string(
            label: 'Placeholder',
            initialValue: 'Write a short description…',
          ),
          value: context.knobs.string(
            label: 'Value (initial)',
            initialValue: '',
          ),
          hintOrErrorMessage: context.knobs.string(
            label: 'Hint / error message',
            initialValue: 'Mô tả ngắn gọn về mục tiêu học tập',
          ),
          showLabel: showLabel,
          showHintOrErrorMessage: showHint,
          isReadOnly: isReadOnly,
          isEnabled: isEnabled,
          hasError: hasError,
          minLines: minLines,
          maxLines: maxLines < minLines ? minLines : maxLines,
        ),
      ),
    ),
  );
}

/// Gallery that previews every state of [CommonTextField] in the Figma
/// "Fields / Text area" rows.
@UseCase(
  name: 'Text Area Gallery',
  type: CommonTextField,
)

/// Builds the gallery row that renders all text-area states side-by-side.
Widget mayTextAreaGalleryUseCase(BuildContext context) {
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
    ('Default — Unfilled', MayFieldState.unfilled, null),
    ('Default — Filled', MayFieldState.filled, 'Cần cải thiện thêm về môn Toán'),
    ('Default — Error Unfilled', MayFieldState.errorUnfilled, null),
    ('Default — Error Filled', MayFieldState.errorFilled, 'abc'),
    ('Default — Read-only', MayFieldState.readOnly, 'Hoàn thành tốt'),
    ('Default — Disable', MayFieldState.disabled, 'Hoàn thành tốt'),
  ];

  return Scaffold(
    backgroundColor: colors.background,
    body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacingV2.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          section(
            label: 'Default (rounded 24-px container)',
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
                    variant: CommonTextFieldVariant.textArea,
                    state: entry.$2,
                    label: 'Description',
                    placeholder: 'Write a short description…',
                    value: entry.$3,
                    hintOrErrorMessage: entry.$2 == MayFieldState.errorFilled ||
                            entry.$2 == MayFieldState.errorUnfilled
                        ? 'Vui lòng nhập mô tả dài ít nhất 10 ký tự'
                        : 'Mô tả ngắn gọn về mục tiêu học tập',
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

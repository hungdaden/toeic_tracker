// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Interactive playground for [CommonTextField] (input variant) that exposes
/// every visual configuration (state, label, placeholder, hint, trailing
/// icon, …).
@UseCase(
  name: 'Text Input Playground',
  type: CommonTextField,
)

/// Builds the text-input playground for the Widgetbook gallery.
Widget mayTextInputUseCase(BuildContext context) {
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
    description: 'When on, the field resolves its own state from '
        'hasError / isReadOnly / isEnabled + controller value.',
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
  final showClear = context.knobs.boolean(
    label: 'Show clear button',
    initialValue: true,
  );
  final showTrailing = context.knobs.boolean(
    label: 'Show trailing icon',
    initialValue: true,
  );
  final trailingIcon = context.knobs.object.dropdown<MayFieldTrailingIcon>(
    label: 'Trailing icon',
    options: MayFieldTrailingIcon.values,
    initialOption: MayFieldTrailingIcon.calendar,
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

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.lg),
        child: CommonTextField(
          variant: CommonTextFieldVariant.input,
          state: useAutoState ? null : forceState,
          label: context.knobs.string(
            label: 'Label',
            initialValue: 'Email address',
          ),
          placeholder: context.knobs.string(
            label: 'Placeholder',
            initialValue: 'name@example.com',
          ),
          value: context.knobs.string(
            label: 'Value (initial)',
            initialValue: '',
          ),
          hintOrErrorMessage: context.knobs.string(
            label: 'Hint / error message',
            initialValue: 'Chúng tôi sẽ không chia sẻ email của bạn',
          ),
          showLabel: showLabel,
          showHintOrErrorMessage: showHint,
          showClearButton: showClear,
          showTrailingIcon: showTrailing,
          trailingIcon: trailingIcon,
          isReadOnly: isReadOnly,
          isEnabled: isEnabled,
          hasError: hasError,
        ),
      ),
    ),
  );
}

/// Gallery that previews every state of [CommonTextField] in the Figma
/// "Fields / Default" and "Fields / Active" rows.
@UseCase(
  name: 'Text Input Gallery',
  type: CommonTextField,
)

/// Builds the gallery row that renders all text-input states side-by-side.
Widget mayTextInputGalleryUseCase(BuildContext context) {
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

  // A list of (label, MayFieldState) tuples for the Default row.
  const defaultRow = <(String, MayFieldState)>[
    ('Default — Unfilled', MayFieldState.unfilled),
    ('Default — Filled', MayFieldState.filled),
    ('Default — Error Unfilled', MayFieldState.errorUnfilled),
    ('Default — Error Filled', MayFieldState.errorFilled),
    ('Default — Read-only', MayFieldState.readOnly),
    ('Default — Disable', MayFieldState.disabled),
  ];

  // The Active row only has 4 variants per the Figma spec.
  const activeRow = <(String, MayFieldState)>[
    ('Active — Unfilled', MayFieldState.unfilled),
    ('Active — Filled', MayFieldState.filled),
    ('Active — Error Unfilled', MayFieldState.errorUnfilled),
    ('Active — Error Filled', MayFieldState.errorFilled),
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
                    variant: CommonTextFieldVariant.input,
                    state: entry.$2,
                    label: 'Email address',
                    placeholder: 'name@example.com',
                    value: entry.$2 == MayFieldState.filled ||
                            entry.$2 == MayFieldState.errorFilled ||
                            entry.$2 == MayFieldState.readOnly
                        ? 'tung.pham@may.edu.vn'
                        : null,
                    hintOrErrorMessage: entry.$2 == MayFieldState.errorFilled ||
                            entry.$2 == MayFieldState.errorUnfilled
                        ? 'Vui lòng nhập email hợp lệ'
                        : 'Chúng tôi sẽ không chia sẻ email của bạn',
                    autofocus: false,
                    showClearButton: false,
                  ),
                  const SizedBox(height: AppSpacingV2.md),
                ],
              ],
            ),
          ),
          section(
            label: 'Active (autofocus → border 1px + cursor blink)',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final entry in activeRow) ...[
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
                    variant: CommonTextFieldVariant.input,
                    state: entry.$2,
                    label: 'Email address',
                    placeholder: 'name@example.com',
                    value: entry.$2 == MayFieldState.filled || entry.$2 == MayFieldState.errorFilled
                        ? 'tung.pham@may.edu.vn'
                        : null,
                    hintOrErrorMessage: entry.$2 == MayFieldState.errorFilled ||
                            entry.$2 == MayFieldState.errorUnfilled
                        ? 'Vui lòng nhập email hợp lệ'
                        : 'Chúng tôi sẽ không chia sẻ email của bạn',
                    autofocus: true,
                    showClearButton: false,
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

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Interactive playground for [DateCalendarPickerV2].
@UseCase(
  name: 'Playground',
  type: DateCalendarPickerV2,
)

/// Builds the interactive playground for [DateCalendarPickerV2], exposing
/// the supported knobs (mode, weekend behaviour, title, action buttons).
Widget dateCalendarPickerV2UseCase(BuildContext context) {
  final colors = context.mayColors;
  final mode = context.knobs.object.dropdown<DateCalendarPickerMode>(
    label: 'Mode',
    options: DateCalendarPickerMode.values,
    initialOption: DateCalendarPickerMode.single,
  );
  final dimWeekends = context.knobs.boolean(
    label: 'Dim Weekends',
    initialValue: true,
  );
  final allowWeekendSelection = context.knobs.boolean(
    label: 'Allow Weekend Selection',
    initialValue: true,
  );
  final showTitle = context.knobs.boolean(
    label: 'Show Title',
    initialValue: false,
  );
  final titleText = context.knobs.string(
    label: 'Title',
    initialValue: 'Chọn ngày nghỉ',
  );
  final showActionButtons = context.knobs.boolean(
    label: 'Show Action Buttons',
    initialValue: true,
  );

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.lg),
        child: DateCalendarPickerV2(
          mode: mode,
          dimWeekends: dimWeekends,
          allowWeekendSelection: allowWeekendSelection,
          title: showTitle ? titleText : null,
          showActionButtons: showActionButtons,
        ),
      ),
    ),
  );
}

/// Gallery use case showcasing the four Figma states of [DateCalendarPickerV2].
@UseCase(
  name: 'Gallery',
  type: DateCalendarPickerV2,
)

/// Builds the gallery view that previews single, range-start, and
/// range-complete states of [DateCalendarPickerV2].
Widget dateCalendarPickerV2GalleryUseCase(BuildContext context) {
  final colors = context.mayColors;

  /// Renders a labeled gallery section: a bold [label] header followed by
  /// [child] with the standard gallery spacing.
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

  return Scaffold(
    backgroundColor: colors.background,
    body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacingV2.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          section(
            label: 'Single — Không chọn gì',
            child: const DateCalendarPickerV2(
              mode: DateCalendarPickerMode.single,
            ),
          ),
          section(
            label: 'Range — Chỉ chọn ngày bắt đầu (T4, 08/08/2026)',
            child: DateCalendarPickerV2(
              mode: DateCalendarPickerMode.range,
              initialStartDate: DateTime(2026, 8, 8),
            ),
          ),
          section(
            label: 'Range — Chọn đủ ngày bắt đầu + kết thúc (T4 → T6, 8 ngày)',
            child: DateCalendarPickerV2(
              mode: DateCalendarPickerMode.range,
              initialStartDate: DateTime(2026, 8, 8),
              initialEndDate: DateTime(2026, 8, 17),
            ),
          ),
          section(
            label: 'Single — Chọn 1 ngày (T4, 08/08/2026)',
            child: DateCalendarPickerV2(
              mode: DateCalendarPickerMode.single,
              initialDate: DateTime(2026, 8, 8),
            ),
          ),
        ],
      ),
    ),
  );
}

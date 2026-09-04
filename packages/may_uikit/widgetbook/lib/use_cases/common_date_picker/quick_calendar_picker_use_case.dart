// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const String _confirmedRangeLabel = 'Khoảng thời gian: ';
const String _confirmedDateLabel = 'Ngày đã chọn: ';

/// Embedded playground for [QuickCalendarPicker].
@UseCase(
  name: 'Embedded',
  type: QuickCalendarPicker,
)

/// Builds the embedded playground for [QuickCalendarPicker].
Widget quickCalendarPickerEmbeddedUseCase(BuildContext context) {
  final colors = context.mayColors;

  final mode = context.knobs.object.dropdown<QuickPickerMode>(
    label: 'Mode',
    options: QuickPickerMode.values,
    initialOption: QuickPickerMode.range,
  );

  final isHalfDay = context.knobs.boolean(
    label: 'Is Half Day',
    initialValue: false,
  );

  final isEnableConfirmButton = context.knobs.boolean(
    label: 'Enable Confirm Button',
    initialValue: true,
  );

  final months = CalendarGenerator.generateMonths(fullRange: true);

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacingV2.lg),
          child: QuickCalendarPicker<MonthModel, DayModel>(
            months: months,
            mode: mode,
            isHalfDay: isHalfDay,
            isEnableConfirmButton: isEnableConfirmButton,
            onTapButton: (start, end, startApi, endApi) {
              // Print cell taps to debug console
              debugPrint('Tapped: $start - $end');
            },
            onTapSingleButton: (date, dateApi) {
              debugPrint('Tapped single: $date');
            },
            onConfirmRange: (start, end, startApi, endApi) {
              final msg = '$_confirmedRangeLabel$start - $end';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(msg),
                ),
              );
            },
            onConfirmSingle: (date, dateApi) {
              final msg = '$_confirmedDateLabel$date';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(msg),
                ),
              );
            },
          ),
        ),
      ),
    ),
  );
}

/// Bottom Sheet presentation for [QuickCalendarPicker].
@UseCase(
  name: 'Bottom Sheet',
  type: QuickCalendarPicker,
)

/// Builds the bottom sheet trigger and presentation for [QuickCalendarPicker].
Widget quickCalendarPickerBottomSheetUseCase(BuildContext context) {
  final colors = context.mayColors;

  final mode = context.knobs.object.dropdown<QuickPickerMode>(
    label: 'Mode',
    options: QuickPickerMode.values,
    initialOption: QuickPickerMode.range,
  );

  final isHalfDay = context.knobs.boolean(
    label: 'Is Half Day',
    initialValue: false,
  );

  final isEnableConfirmButton = context.knobs.boolean(
    label: 'Enable Confirm Button',
    initialValue: true,
  );

  final months = CalendarGenerator.generateMonths(fullRange: true);

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.lg),
        child: CommonButtonV2(
          label: 'Show Quick Calendar Picker',
          variant: CommonButtonVariant.primary,
          onTap: () {
            showQuickCalendarPicker<MonthModel, DayModel>(
              context: context,
              months: months,
              mode: mode,
              isHalfDay: isHalfDay,
              isEnableConfirmButton: isEnableConfirmButton,
              onConfirmRange: (start, end, startApi, endApi) {
                final msg = '$_confirmedRangeLabel$start - $end';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(msg),
                  ),
                );
              },
              onConfirmSingle: (date, dateApi) {
                final msg = '$_confirmedDateLabel$date';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(msg),
                  ),
                );
              },
            );
          },
        ),
      ),
    ),
  );
}

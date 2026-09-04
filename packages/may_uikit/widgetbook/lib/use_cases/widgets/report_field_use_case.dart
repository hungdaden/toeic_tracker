import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Playground',
  type: ReportFieldV2,
)
/// Builds the interactive playground for [ReportFieldV2] using the provided [context].
Widget reportFieldUseCase(BuildContext context) {
  final colors = context.mayColors;
  
  final showDivider = context.knobs.boolean(
    label: 'Show Divider',
    initialValue: true,
  );

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacingV2.xl),
        child: SizedBox(
          width: 351,
          child: ReportFieldV2(
            showDivider: showDivider,
            items: const [
              ReportFieldDataV2(
                title: 'Bữa đã dùng',
                content: '15 / 30',
              ),
              ReportFieldDataV2(
                title: 'Bữa chưa dùng',
                content: '15 / 30',
              ),
              ReportFieldDataV2(
                title: 'Bữa sáng',
                content: '10 / 15',
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

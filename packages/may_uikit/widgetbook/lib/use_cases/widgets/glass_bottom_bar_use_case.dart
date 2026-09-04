import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const _confirmLabel = 'Confirm';

/// Interactive playground for [GlassBottomBarV2].
@UseCase(
  name: 'Playground',
  type: GlassBottomBarV2,
)
Widget glassBottomBarUseCase(BuildContext context) {
  final isShowBack = context.knobs.boolean(
    label: 'Show Back Button',
    initialValue: true,
  );
  final hasActions = context.knobs.boolean(
    label: 'Show Actions',
    initialValue: true,
  );

  return Scaffold(
    backgroundColor: AppColorsV2.themeLightBackground,
    body: Stack(
      children: [
        Positioned.fill(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(AppSpacingV2.md),
                child: CardInfoV2(
                  title: 'Dummy Item $index',
                  rows: const [
                    RegistrationInfoRowData(
                      items: [CardInfoEntry(label: 'Test', value: 'Value')],
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: GlassBottomBarV2(
            isShowBack: isShowBack,
            centerButton: AppButtonV2(
              type: ButtonType.primary,
              onTap: () {},
              child: const Text(_confirmLabel),
            ),
            actions: hasActions
                ? [
                    PressableCardContainerV2(
                      padding: const EdgeInsets.all(AppSpacingV2.sm),
                      borderRadius: AppRadiusV2.full,
                      onTap: () {},
                      child: const Icon(Icons.more_vert),
                    )
                  ]
                : const [],
          ),
        ),
      ],
    ),
  );
}

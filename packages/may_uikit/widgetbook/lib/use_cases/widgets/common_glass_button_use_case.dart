import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Interactive playground for [GlassButtonV2].
@UseCase(
  name: 'Playground',
  type: GlassButtonV2,
)
Widget glassButtonUseCase(BuildContext context) {
  final isCircle = context.knobs.boolean(
    label: 'Is Circle',
    initialValue: false,
  );
  final borderRadius = context.knobs.double.slider(
    label: 'Border Radius',
    initialValue: DimensV2.d28,
    min: 0,
    max: 50,
  );

  return Scaffold(
    backgroundColor: AppColorsV2.themeLightBackground,
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColorsV2.semanticInfo500,
            AppColorsV2.semanticSuccess500,
          ],
        ),
      ),
      child: Center(
        child: GlassButtonV2(
          isCircle: isCircle,
          borderRadius: borderRadius,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacingV2.md,
              vertical: AppSpacingV2.sm,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isCircle)
                  const Icon(Icons.add, color: AppColorsV2.genericWhite)
                else ...[
                  const Icon(Icons.star, color: AppColorsV2.genericWhite),
                  const SizedBox(width: AppSpacingV2.sm),
                  Text(
                    context.knobs.string(label: 'Label', initialValue: 'Glass Button'),
                    style: AppTextStylesV2.labelSemiBold.copyWith(
                      color: AppColorsV2.genericWhite,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Interactive playground for [PrimaryTextFieldV2].
@UseCase(
  name: 'Playground',
  type: PrimaryTextFieldV2,
)
Widget primaryTextFieldUseCase(BuildContext context) {
  final isPassword = context.knobs.boolean(
    label: 'Is Password Field',
    initialValue: false,
  );

  return Scaffold(
    backgroundColor: AppColorsV2.themeLightBackground,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.md),
        child: PrimaryTextFieldV2(
          title: context.knobs.string(label: 'Title', initialValue: 'Email Address'),
          hintText: context.knobs.string(label: 'Hint Text', initialValue: 'Enter your email'),
          keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.text,
        ),
      ),
    ),
  );
}

/// Gallery use case that showcases [PrimaryTextFieldV2] input states.
@UseCase(
  name: 'Gallery',
  type: PrimaryTextFieldV2,
)
Widget primaryTextFieldGalleryUseCase(BuildContext context) {
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
                'Standard Input',
                style: AppTextStylesV2.title3SemiBold.copyWith(
                  color: context.mayColors.primaryText,
                ),
              ),
              const SizedBox(height: AppSpacingV2.md),
              const PrimaryTextFieldV2(
                title: 'Username',
                hintText: 'Enter your username',
              ),
              const SizedBox(height: AppSpacingV2.x2l),
              Text(
                'Password Input',
                style: AppTextStylesV2.title3SemiBold.copyWith(
                  color: context.mayColors.primaryText,
                ),
              ),
              const SizedBox(height: AppSpacingV2.md),
              const PrimaryTextFieldV2(
                title: 'Password',
                hintText: 'Enter your password',
                keyboardType: TextInputType.visiblePassword,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

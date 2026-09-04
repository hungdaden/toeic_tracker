import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

const _defaultAvatarUrl = 'https://cdn-icons-png.flaticon.com/512/1828/1828640.png';
const _defaultIconUrl = 'https://api.iconify.design/lucide/home.svg';

enum _LeadingSource { none, avatar, icon }

@UseCase(
  name: 'Playground',
  type: CardV2,
)

/// Builds the interactive [CardV2] playground.
Widget cardV2UseCase(BuildContext context) {
  final colors = context.mayColors;
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Student Information',
  );
  final showBody = context.knobs.boolean(
    label: 'Show Body',
    initialValue: true,
  );
  final isInteractive = context.knobs.boolean(
    label: 'Is Interactive (onTap)',
    initialValue: true,
  );
  final isBoldTitle = context.knobs.boolean(
    label: 'Bold Title',
    initialValue: true,
  );
  final isShowArrow = context.knobs.boolean(
    label: 'Show Arrow',
    initialValue: true,
  );
  final leadingSource = context.knobs.object.dropdown<_LeadingSource>(
    label: 'Leading Source',
    options: _LeadingSource.values,
    initialOption: _LeadingSource.avatar,
  );
  final avatarUrl = context.knobs.string(
    label: 'Avatar URL',
    initialValue: _defaultAvatarUrl,
  );
  final iconUrl = context.knobs.string(
    label: 'Icon URL',
    initialValue: _defaultIconUrl,
  );
  final padding = context.knobs.double.slider(
    label: 'Padding',
    initialValue: DimensV2.d20,
    min: DimensV2.d0,
    max: DimensV2.d32,
  );
  final borderRadius = context.knobs.double.slider(
    label: 'Border Radius',
    initialValue: DimensV2.d20,
    min: DimensV2.d0,
    max: DimensV2.d40,
  );

  final avatar = leadingSource == _LeadingSource.avatar ? avatarUrl : null;
  final icon = leadingSource == _LeadingSource.icon ? iconUrl : null;

  return Scaffold(
    backgroundColor: colors.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacingV2.md),
        child: SizedBox(
          width: 359,
          child: CardV2(
            title: title,
            avatar: avatar,
            icon: icon,
            onTap: isInteractive ? () {} : null,
            padding: EdgeInsets.all(padding),
            borderRadius: borderRadius,
            isBoldTitle: isBoldTitle,
            isShowArrow: isShowArrow,
            child: showBody ? const _CardV2Body() : null,
          ),
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'Gallery',
  type: CardV2,
)

/// Builds the [CardV2] gallery.
Widget cardV2GalleryUseCase(BuildContext context) {
  final colors = context.mayColors;

  return Scaffold(
    backgroundColor: colors.background,
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
                'Header And Body',
                style: AppTextStylesV2.title3SemiBold.copyWith(color: colors.primaryText),
              ),
              const SizedBox(height: AppSpacingV2.md),
              const CardV2(
                title: 'Student Information',
                child: _CardV2Body(),
              ),
              const SizedBox(height: AppSpacingV2.x2l),
              Text(
                'Normal Background',
                style: AppTextStylesV2.title3SemiBold.copyWith(color: colors.primaryText),
              ),
              const SizedBox(height: AppSpacingV2.md),
              const CardV2(
                title: 'Student Information',
                child: _CardV2Body(),
              ),
              const SizedBox(height: AppSpacingV2.x2l),
              Text(
                'Interactive Header',
                style: AppTextStylesV2.title3SemiBold.copyWith(color: colors.primaryText),
              ),
              const SizedBox(height: AppSpacingV2.md),
              CardV2(
                title: 'Payment Details',
                onTap: () {},
                child: const _CardV2Body(
                  label: 'Status',
                  value: 'Pending confirmation',
                ),
              ),
              const SizedBox(height: AppSpacingV2.x2l),
              Text(
                'Body Only',
                style: AppTextStylesV2.title3SemiBold.copyWith(color: colors.primaryText),
              ),
              const SizedBox(height: AppSpacingV2.md),
              const CardV2(
                isShowArrow: false,
                child: _CardV2Body(
                  label: 'Note',
                  value: 'CardV2 can render body without header.',
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class _CardV2Body extends StatelessWidget {
  const _CardV2Body({
    this.label = 'Class',
    this.value = '10A1',
  });

  final String label;
  final String value;

  /// Builds the body used in the [CardV2] demos.
  @override
  Widget build(BuildContext context) {
    final defaultTextColor =
        DefaultTextStyle.of(context).style.color ?? context.mayColors.primaryText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTextStylesV2.bodyRegular.copyWith(
            color: defaultTextColor.withValues(alpha: 0.72),
          ),
        ),
        const SizedBox(height: AppSpacingV2.x2s),
        Text(
          value,
          style: AppTextStylesV2.text15Semibold.copyWith(color: defaultTextColor),
        ),
      ],
    );
  }
}

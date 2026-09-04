import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Full Knobs',
  type: ActionListV2,
)

/// Builds a knob-driven preview for [ActionListV2].
Widget pressableCardStackListUseCase(BuildContext context) {
  final colors = context.mayColors;

  final bool enableOnTap = context.knobs.boolean(
    label: 'Enable onTap',
    initialValue: true,
  );

  final int itemCount = context.knobs.int.slider(
    label: 'Item Count',
    initialValue: 4,
    min: 2,
    max: 8,
  );

  final Color backgroundColor = context.knobs.color(
    label: 'Background Color',
    initialValue: colors.bgCard,
  );

  final Color borderColor = context.knobs.color(
    label: 'Border Color',
    initialValue: colors.border,
  );

  final Color shadowColor = context.knobs.color(
    label: 'Shadow Color',
    initialValue: colors.sdDefault,
  );

  final double borderRadius = context.knobs.double.slider(
    label: 'Border Radius',
    initialValue: AppRadiusV2.xl,
    min: AppRadiusV2.none,
    max: AppRadiusV2.x4l,
  );

  final double padding = context.knobs.double.slider(
    label: 'Padding',
    initialValue: AppSpacingV2.md,
    min: AppSpacingV2.none,
    max: AppSpacingV2.x2l,
  );

  final double margin = context.knobs.double.slider(
    label: 'Margin',
    initialValue: AppSpacingV2.none,
    min: AppSpacingV2.none,
    max: AppSpacingV2.x2l,
  );

  final double pressedOffset = context.knobs.double.slider(
    label: 'Pressed Offset',
    initialValue: AppSpacingV2.x2s,
    min: AppSpacingV2.x2s,
    max: AppSpacingV2.md,
  );

  final double maxWidth = context.knobs.double.slider(
    label: 'Max Width',
    initialValue: DimensV2.d360,
    min: DimensV2.d240,
    max: DimensV2.d520,
  );

  final String titlePrefix = context.knobs.string(
    label: 'Title Prefix',
    initialValue: 'Stack option',
  );

  final String subtitle = context.knobs.string(
    label: 'Subtitle',
    initialValue: 'Press items at top, middle, and bottom',
  );

  final bool showLeadingIcon = context.knobs.boolean(
    label: 'Show Leading Icon',
    initialValue: true,
  );

  return _PreviewScaffold(
    maxWidth: maxWidth,
    child: ActionListV2(
      color: backgroundColor,
      borderColor: borderColor,
      shadowColor: shadowColor,
      borderRadius: borderRadius,
      pressedOffset: pressedOffset,
      padding: EdgeInsets.all(padding),
      margin: EdgeInsets.all(margin),
      onTap: enableOnTap ? (_) {} : null,
      children: List.generate(
        itemCount,
        (index) => _CardContent(
          title: '$titlePrefix ${index + 1}',
          subtitle: subtitle,
          showLeadingIcon: showLeadingIcon,
        ),
      ),
    ),
  );
}

class _PreviewScaffold extends StatelessWidget {
  const _PreviewScaffold({
    required this.child,
    required this.maxWidth,
  });

  final Widget child;
  final double maxWidth;

  /// Builds centered scaffold for pressable card previews.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return Scaffold(
      backgroundColor: colors.background,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  const _CardContent({
    required this.title,
    required this.subtitle,
    required this.showLeadingIcon,
  });

  final String title;
  final String subtitle;
  final bool showLeadingIcon;

  /// Builds card row content for preview items.
  @override
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    return Row(
      children: [
        if (showLeadingIcon) ...[
          Container(
            width: DimensV2.d48,
            height: DimensV2.d48,
            decoration: BoxDecoration(
              color: colors.primaryButton,
              borderRadius: BorderRadius.circular(AppRadiusV2.lg),
            ),
            child: Icon(
              Icons.touch_app_rounded,
              color: colors.onPrimaryButton,
            ),
          ),
          const SizedBox(width: AppSpacingV2.sm),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTextStylesV2.bodySemiBold.copyWith(
                  color: colors.primaryText,
                ),
              ),
              const SizedBox(height: AppSpacingV2.x2s),
              Text(
                subtitle,
                style: AppTextStylesV2.bodyRegular.copyWith(
                  color: colors.secondaryText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

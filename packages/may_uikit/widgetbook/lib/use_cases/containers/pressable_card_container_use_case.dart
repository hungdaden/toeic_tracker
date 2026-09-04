import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Full Knobs',
  type: PressableCardContainerV2,
)

/// Builds a knob-driven preview for [PressableCardContainer].
Widget pressableCardContainerUseCase(BuildContext context) {
  final colors = context.mayColors;
  final bool enableOnTap = context.knobs.boolean(
    label: 'Enable onTap',
    initialValue: true,
  );
  final Color backgroundColor = context.knobs.color(
    label: 'Background Color',
    initialValue: colors.bgCard,
  );
  final Color borderColor = context.knobs.color(
    label: 'Border Color',
    initialValue: AppColorsV2.neutral200,
  );
  final Color shadowColor = context.knobs.color(
    label: 'Shadow Color',
    initialValue: AppColorsV2.neutral200,
  );
  final double borderRadius = context.knobs.double.slider(
    label: 'Border Radius',
    initialValue: DimensV2.d20,
    min: DimensV2.d0,
    max: DimensV2.d40,
  );
  final double padding = context.knobs.double.slider(
    label: 'Padding',
    initialValue: DimensV2.d16,
    min: DimensV2.d0,
    max: DimensV2.d32,
  );
  final double margin = context.knobs.double.slider(
    label: 'Margin',
    initialValue: DimensV2.d0,
    min: DimensV2.d0,
    max: DimensV2.d32,
  );
  final double maxWidth = context.knobs.double.slider(
    label: 'Max Width',
    initialValue: 360,
    min: 240,
    max: 520,
  );
  final String title = context.knobs.string(
    label: 'Title',
    initialValue: 'Pressable card',
  );
  final String subtitle = context.knobs.string(
    label: 'Subtitle',
    initialValue: 'Only pressable when onTap is enabled',
  );
  final bool showLeadingIcon = context.knobs.boolean(
    label: 'Show Leading Icon',
    initialValue: true,
  );

  return _PreviewScaffold(
    maxWidth: maxWidth,
    child: PressableCardContainerV2(
      color: backgroundColor,
      borderColor: borderColor,
      shadowColor: shadowColor,
      borderRadius: borderRadius,
      padding: EdgeInsets.all(padding),
      margin: EdgeInsets.all(margin),
      onTap: enableOnTap ? () {} : null,
      child: _CardContent(
        title: title,
        subtitle: subtitle,
        showLeadingIcon: showLeadingIcon,
      ),
    ),
  );
}

class _PreviewScaffold extends StatelessWidget {
  const _PreviewScaffold({required this.child, required this.maxWidth});

  final Widget child;
  final double maxWidth;

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
              borderRadius: BorderRadius.circular(DimensV2.d16),
            ),
            child: Icon(
              Icons.touch_app_rounded,
              color: colors.onPrimaryButton,
            ),
          ),
          const SizedBox(width: DimensV2.d12),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTextStylesV2.bodySemiBold.copyWith(color: colors.primaryText),
              ),
              const SizedBox(height: DimensV2.d4),
              Text(
                subtitle,
                style: AppTextStylesV2.bodyRegular.copyWith(color: colors.secondaryText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

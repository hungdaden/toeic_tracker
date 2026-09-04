import 'package:flutter/material.dart';
import 'package:may_uikit/may_uikit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Playground',
  type: TabBarViewMultiLineV2,
)

/// Builds a knob-driven preview for [TabBarViewMultiLineV2].
Widget tabBarViewMultiLineUseCase(BuildContext context) {
  final int itemCount = context.knobs.int.slider(
    label: 'Item Count',
    initialValue: 4,
    min: 2,
    max: 6,
  );
  final bool showSubtitle = context.knobs.boolean(
    label: 'Show Subtitle',
    initialValue: true,
  );
  final bool isLoading = context.knobs.boolean(
    label: 'Loading',
    initialValue: false,
  );
  final bool isScrollableBody = context.knobs.boolean(
    label: 'Scrollable Body',
    initialValue: true,
  );
  final bool isScrollableTabBar = context.knobs.boolean(
    label: 'Scrollable TabBar',
    initialValue: true,
  );
  final int rawInitialIndex = context.knobs.int.slider(
    label: 'Initial Index',
    initialValue: 0,
    min: 0,
    max: 5,
  );
  final int initialIndex = rawInitialIndex.clamp(0, itemCount - 1);

  final tabs = List.generate(
    itemCount,
    (index) => ContentTabBarMultiLine(
      title: 'Tab ${index + 1}',
      subtitle: showSubtitle ? 'Subtitle ${index + 1}' : null,
    ),
  );

  final pages = List.generate(
    itemCount,
    (index) => Center(
      child: Text(
        'Content ${index + 1}',
        style: AppTextStylesV2.title2SemiBold.copyWith(
          color: context.mayColors.primaryText,
        ),
      ),
    ),
  );

  return Scaffold(
    backgroundColor: context.mayColors.background,
    body: SafeArea(
      child: TabBarViewMultiLineV2(
        tabs: tabs,
        contentTabBars: pages,
        initialIndex: initialIndex,
        isScrollable: isScrollableBody,
        isScrollableTabBar: isScrollableTabBar,
        isLoading: isLoading,
        backgroundColor: context.mayColors.background,
      ),
    ),
  );
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:may_uikit/resources/generated/assets.gen.dart';

import '../../may_uikit.dart';

/// Enum defining available appbar action types.
/// Add more types here as needed.
enum AppBarActionType {
  /// Information action.
  info,

  /// Add action.
  add,

  /// Navigate forward action.
  arrowRight,
  // newHeader,
  history,
  // feedBackMenu,
  calendarHistory,
  moreOptions,
  // inThePast,
  rules,
}

/// Helpers for rendering [AppBarActionType].
extension AppBarActionTypeExtension on AppBarActionType {
  /// Builds the icon widget for this action type.
  Widget buildIcon({
    required Color color,
    required double size,
  }) {
    switch (this) {
      case AppBarActionType.info:
        return Icon(Icons.info_outline, color: color, size: size);
      case AppBarActionType.add:
        return Icon(Icons.add, color: color, size: size);
      case AppBarActionType.arrowRight:
        return Icon(Icons.arrow_forward_ios, color: color, size: size);
      // case AppBarActionType.newHeader:
      //   return Assets.icons.iconNewHeader.svg(
      //     width: size,
      //     height: size,
      //   );
      case AppBarActionType.history:
        return SvgPicture.asset(
          Assets.icons.icHistory.keyName,
          width: size,
          height: size,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      // case AppBarActionType.feedBackMenu:
      //   return Assets.icons.icFeedbackMenu.image(
      //     width: size,
      //     height: size,
      //   );
      case AppBarActionType.calendarHistory:
        return Assets.icons.icCalendarHistory.svg(
          width: size,
          height: size,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      case AppBarActionType.moreOptions:
        return Assets.icons.iconMoreActions.svg(
          width: size,
          height: size,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      // case AppBarActionType.inThePast:
      //   return Assets.icons.icHistory.svg(
      //     width: size,
      //     height: size,
      //   );
      case AppBarActionType.rules:
        return Assets.icons.iconRules.svg(
          width: size,
          height: size,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
    }
  }

  /// Returns the themed default color for this action type.
  Color defaultColor(MayThemeColorsV2 colors) => colors.icPrimary;
}

/// App bar action configuration.
class AppBarActionItem {
  /// Creates an app bar action with [type] and [onTap].
  const AppBarActionItem({
    required this.type,
    required this.onTap,
    this.color,
    this.size,
    this.isEnabled = true,
  });

  /// Action icon type.
  final AppBarActionType type;

  /// Callback called when the action is tapped.
  final VoidCallback onTap;

  /// Override the default icon color for this action.
  final Color? color;

  /// Override the default icon size for this action.
  final double? size;

  /// Whether the action can be pressed.
  ///
  /// Defaults to `true`, so call sites that predate this keep rendering
  /// exactly as before. When `false` the action takes the same disabled
  /// treatment as [CommonIconButtonV2] rather than a look of its own.
  final bool isEnabled;

  /// Builds this action using [context] to resolve the default icon color when available.
  Widget build([BuildContext? context]) {
    final colors = context?.mayColors ?? MainThemeV2.lightColors;
    final iconColor = isEnabled
        ? color ?? (context == null ? AppColorsV2.primaryText900 : type.defaultColor(colors))
        : colors.disabledText;
    final iconSize = size ?? DimensV2.d20;

    return PressableCardContainerV2(
      // Left null when enabled so the container keeps applying its own
      // defaults, which is what every existing caller already renders.
      color: isEnabled ? null : colors.disabledButton,
      borderColor: isEnabled ? null : colors.btnCriticalOutlineDisable,
      shadowColor: isEnabled ? null : AppColorsV2.transparent,
      pressedOffset: isEnabled ? AppSpacingV2.x3s : DimensV2.d0,
      onTap: isEnabled ? onTap : null,
      borderRadius: AppRadiusV2.full,
      padding: const EdgeInsets.all(DimensV2.d8),
      child: type.buildIcon(color: iconColor, size: iconSize),
    );
  }
}

/// Builds a list of action widgets from [AppBarActionItem]s.
List<Widget> buildAppBarActions(List<AppBarActionItem> items, {BuildContext? context}) {
  return items.map((item) => item.build(context)).toList();
}

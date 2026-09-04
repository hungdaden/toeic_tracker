import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../may_uikit.dart';

Future<bool> _onPop() async => true;

/// Bottom glass bar that can render back, center, and action buttons.
class GlassBottomBarV2 extends StatelessWidget {
  const GlassBottomBarV2({
    super.key,
    this.onPop = _onPop,
    this.actions = const [],
    this.centerButton,
    this.padding,
    this.isShowBack = true,
    this.customGlassButton,
    this.onTap,
    this.isEnabled = true,
  });

  final Future<bool> Function() onPop;

  /// Right side actions (icons)
  final List<Widget> actions;

  /// center button widget
  final Widget? centerButton;

  final EdgeInsets? padding;

  final bool isShowBack;

  final Widget? customGlassButton;

  final Function()? onTap;

  final bool isEnabled;

  /// Returns the bottom padding that keeps glass-bar actions above system navigation.
  static double bottomPaddingOf(BuildContext context) {
    if (MediaQuery.viewInsetsOf(context).bottom > 0) return DimensV2.d24;
    if (!kIsWeb && Platform.isIOS) return DimensV2.d24;

    final systemBottomPadding = MediaQuery.viewPaddingOf(context).bottom;
    return systemBottomPadding > 0 ? systemBottomPadding + DimensV2.d12 : DimensV2.d24;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppRadiusV2.x3l), topRight: Radius.circular(AppRadiusV2.x3l)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: DimensV2.d_05, sigmaY: DimensV2.d1),
        child: Container(
          padding: EdgeInsets.only(
            bottom: bottomPaddingOf(context),
          ),
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: DimensV2.d16).copyWith(top: DimensV2.d6),
            child: Row(
              children: [
                /// BACK or button
                isShowBack
                    ? PressableCardContainerV2(
                        padding: const EdgeInsets.all(AppSpacingV2.md),
                        borderRadius: AppRadiusV2.full,
                        onTap: () async {
                          if (await onPop()) {
                            SystemActionV2.pop();
                          }
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: DimensV2.d22,
                          color: context.mayColors.icPrimary,
                        ),
                      )
                    : customGlassButton != null
                        ? PressableCardContainerV2(
                            padding: const EdgeInsets.all(AppSpacingV2.md),
                            borderRadius: AppRadiusV2.full,
                            onTap: isEnabled ? onTap : null,
                            child: customGlassButton!,
                          )
                        : const SizedBox(),

                const SizedBox(width: DimensV2.d10),

                /// CENTER BUTTON
                Expanded(
                  child: centerButton ?? const SizedBox(),
                ),

                /// ACTIONS
                Row(
                  children: actions
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(left: DimensV2.d10),
                          child: e,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

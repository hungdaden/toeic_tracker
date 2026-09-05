import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:may_uikit/may_uikit.dart';

/// A premium frosted glass AppBar adhering to UIKit's `common_app_bar` specifications
/// and Apple's Liquid Glass design language.
///
/// Provides dynamic blur (`BackdropFilter`), dark translucent tint, subtle bottom hairline border,
/// customizable title/subtitle typography, circular glass action buttons, and a bottom slot
/// for segment switchers or tabs.
class LiquidGlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final String? subTitle;
  final bool centerTitle;
  final Widget? leading;
  final bool hideBackButton;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double toolbarHeight;
  final VoidCallback? onBack;
  final double blurSigma;
  final Color? backgroundColor;

  const LiquidGlassAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.subTitle,
    this.centerTitle = true,
    this.leading,
    this.hideBackButton = false,
    this.actions,
    this.bottom,
    this.toolbarHeight = kToolbarHeight,
    this.onBack,
    this.blurSigma = 18.0,
    this.backgroundColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(
        toolbarHeight + (bottom?.preferredSize.height ?? 0.0),
      );

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);
    final shouldShowBack = !hideBackButton && canPop && leading == null;

    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight,
      automaticallyImplyLeading: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      leadingWidth: (shouldShowBack || leading != null) ? 58 : 16,
      leading: shouldShowBack
          ? Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Center(
                child: PressableCardContainerV2(
                  borderRadius: AppRadiusV2.full,
                  padding: const EdgeInsets.all(AppSpacingV2.xs),
                  color: Colors.white.withValues(alpha: 0.08),
                  borderColor: Colors.white.withValues(alpha: 0.16),
                  borderWidth: 0.8,
                  onTap: onBack ?? () => Navigator.maybePop(context),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : (leading != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Center(child: leading!),
                )
              : null),
      title: titleWidget ??
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                centerTitle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              if (title != null)
                Text(
                  title!,
                  style: AppTextStylesV2.bodySemiBold.copyWith(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.3,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              if (subTitle != null && subTitle!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    subTitle!,
                    style: AppTextStylesV2.bodyRegular.copyWith(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
      actions: actions != null && actions!.isNotEmpty
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: actions!
                      .map(
                        (a) => Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: a,
                        ),
                      )
                      .toList(),
                ),
              ),
            ]
          : null,
      bottom: bottom,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? const Color(0xFF0A0E1A).withValues(alpha: 0.72),
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withValues(alpha: 0.08),
                  width: 0.8,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A circular glass action button matching UIKit's `AppBarActionItem` and Apple Liquid Glass design.
class LiquidGlassAppBarAction extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final String? tooltip;
  final double size;

  const LiquidGlassAppBarAction({
    super.key,
    required this.icon,
    required this.onTap,
    this.tooltip,
    this.size = 38,
  });

  @override
  Widget build(BuildContext context) {
    Widget button = PressableCardContainerV2(
      borderRadius: AppRadiusV2.full,
      padding: EdgeInsets.zero,
      color: Colors.white.withValues(alpha: 0.08),
      borderColor: Colors.white.withValues(alpha: 0.16),
      borderWidth: 0.8,
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: Center(child: icon),
      ),
    );

    if (tooltip != null) {
      return Tooltip(message: tooltip!, child: button);
    }
    return button;
  }
}

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../may_uikit.dart';

/// Shared app bar widget with blur and flexible background support.
class AppBarWidgetV2 extends StatelessWidget {
  const AppBarWidgetV2({
    super.key,
    this.color = AppColorsV2.transparent,
    this.title,
    this.titleKey,
    this.leading,
    this.actions,
    this.actionIcon,
    this.centerTitle = true,
    this.subTitle,
    this.headerBackground,
    this.toolbarHeight,
    this.bottomOfAppBar,
    this.showBackgroundLayers = true,
    this.backgroundOpacity = 0.0,
    this.blurProgress = 0.0,
    this.flexibleSpace,
    this.titlePadding,
    this.leadingPadding,
    this.actionsPadding,
    this.leadingWidth,
    this.belowBottomOfAppBarSpacing = DimensV2.d0,
    this.hideBackButton = true,
  });

  final Color color;
  final String? title;
  final GlobalKey? titleKey;
  final Widget? leading;
  final List<Widget>? actions;
  final List<Widget>? actionIcon;
  final bool centerTitle;
  final String? subTitle;
  final Widget? headerBackground;
  final double? toolbarHeight;
  final Widget? bottomOfAppBar;
  final bool showBackgroundLayers;
  final double backgroundOpacity;
  final double blurProgress;
  final Widget? flexibleSpace;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? leadingPadding;
  final EdgeInsetsGeometry? actionsPadding;
  final double? leadingWidth;
  final double? belowBottomOfAppBarSpacing;
  final bool hideBackButton;

  @override
  Widget build(BuildContext context) {
    final effectiveActions = [...?actions, ...?actionIcon];
    return AppBar(
      backgroundColor: AppColorsV2.transparent,
      surfaceTintColor: AppColorsV2.transparent,
      shadowColor: AppColorsV2.transparent,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      automaticallyImplyLeading: false,
      leadingWidth: leadingWidth,
      flexibleSpace: flexibleSpace ??
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: blurProgress),
            duration: const Duration(milliseconds: 140),
            curve: Curves.easeOutCubic,
            builder: (context, progress, _) {
              return Opacity(
                opacity: progress,
                child: ClipRect(
                  child: ShaderMask(
                    blendMode: BlendMode.dstIn,
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColorsV2.genericWhite,
                          AppColorsV2.genericWhite,
                          AppColorsV2.genericWhite.withValues(alpha: 0.5),
                          AppColorsV2.transparent,
                        ],
                        stops: const [0, 0.8, 0.9, 1],
                      ).createShader(bounds);
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: color,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: -50,
                          child: Opacity(
                            opacity: backgroundOpacity,
                            child: headerBackground ?? const SizedBox.shrink(),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [color, color.withValues(alpha: 0)],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: BackdropFilter(
                            filter: ui.ImageFilter.blur(
                              sigmaX: DimensV2.d4 * progress,
                              sigmaY: DimensV2.d4 * progress,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    color.withValues(alpha: progress),
                                    color.withValues(alpha: 0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
      titleSpacing: DimensV2.d0,
      title: Column(
        key: titleKey,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (hideBackButton && leading == null)
                    const SizedBox.shrink()
                  else
                    Padding(
                      padding: leadingPadding ??
                          const EdgeInsets.only(left: DimensV2.d16, bottom: DimensV2.d9),
                      child: leading ?? const SizedBox(width: DimensV2.d16),
                    ),
                  if (!centerTitle && title != null)
                    Expanded(
                      child: Padding(
                        padding: titlePadding ??
                            const EdgeInsets.only(left: DimensV2.d12, bottom: DimensV2.d9),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title!,
                              style: AppTextStylesV2.bodySemiBold.copyWith(
                                color: context.mayColors.primaryText,
                                fontSize: DimensV2.d18,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            if (subTitle != null && subTitle!.isNotEmpty) ...[
                              Text(
                                subTitle!,
                                style: AppTextStylesV2.bodyRegular.copyWith(
                                  color: context.mayColors.secondaryText,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ],
                        ),
                      ),
                    )
                  else
                    const Spacer(),
                  if (effectiveActions.isNotEmpty)
                    Padding(
                      padding: actionsPadding ??
                          const EdgeInsets.only(right: DimensV2.d16, bottom: DimensV2.d9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: effectiveActions,
                      ),
                    ),
                ],
              ),
              if (centerTitle && title != null)
                Container(
                  padding: titlePadding ??
                      const EdgeInsets.only(
                        left: DimensV2.d32,
                        top: DimensV2.d8,
                        right: DimensV2.d32,
                        bottom: DimensV2.d16,
                      ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title!,
                        style: AppTextStylesV2.bodySemiBold.copyWith(
                          color: context.mayColors.primaryText,
                          fontSize: DimensV2.d18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (subTitle != null && subTitle!.isNotEmpty) ...[
                        Text(
                          subTitle!,
                          style: AppTextStylesV2.bodyRegular.copyWith(
                            color: context.mayColors.secondaryText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
            ],
          ),
          bottomOfAppBar ?? const SizedBox.shrink(),
          SizedBox(height: belowBottomOfAppBarSpacing),
        ],
      ),
      elevation: 0.0,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight,
    );
  }
}

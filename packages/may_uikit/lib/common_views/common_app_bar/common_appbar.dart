// File: flutter_ui_kit/common_view/appbar/appbar_common.dart

import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../resources/generated/assets.gen.dart';
import '../../may_uikit.dart';

Future<bool> _onPop() async {
  return true;
}

/// String helpers used by [CommonAppBarV2] title formatting.
extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() =>
      replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

/// Controller used by [CommonAppBarV2] to expose loading state.
class AppBarController extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

/// High-level scaffold wrapper that wires body, app bar, refresh, and glass bar.
class CommonAppBarV2 extends StatefulWidget {
  static final ValueNotifier<bool> showThemeToolGlobal = ValueNotifier<bool>(false);
  static final ValueNotifier<AppThemeMode> themeModeGlobal =
      ValueNotifier<AppThemeMode>(AppThemeMode.light);
  static final ValueNotifier<AppColorId> colorIdGlobal =
      ValueNotifier<AppColorId>(AppColorId.green);

  static void showAppearanceSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColorsV2.transparent,
      builder: (sheetContext) => ValueListenableBuilder<AppThemeMode>(
        valueListenable: themeModeGlobal,
        builder: (context, currentThemeMode, _) {
          return ValueListenableBuilder<AppColorId>(
            valueListenable: colorIdGlobal,
            builder: (context, currentColorId, _) {
              final isDarkMode = currentThemeMode == AppThemeMode.dark ||
                  (currentThemeMode == AppThemeMode.auto &&
                      MediaQuery.platformBrightnessOf(sheetContext) == Brightness.dark);
              final baseTheme = isDarkMode ? MainThemeV2.dark : MainThemeV2.light;
              final baseColors = isDarkMode ? MainThemeV2.darkColors : MainThemeV2.lightColors;
              final colors = AppColorPickerCardV2.getCustomColors(
                baseColors,
                currentColorId,
                isDarkMode: isDarkMode,
              );

              return Theme(
                data: baseTheme.copyWith(extensions: <ThemeExtension<dynamic>>[colors]),
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.all(DimensV2.d16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppThemePickerCardV2(
                          title: 'Chọn giao diện',
                          selectedMode: currentThemeMode,
                          colorId: currentColorId,
                          onModeSelected: (mode) {
                            themeModeGlobal.value = mode;
                          },
                        ),
                        const SizedBox(height: DimensV2.d12),
                        AppColorPickerCardV2(
                          title: 'Chọn màu giao diện',
                          selectedId: currentColorId,
                          onSelected: (id) {
                            colorIdGlobal.value = id;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  const CommonAppBarV2({
    this.title,
    required this.body,
    super.key,
    this.actions,
    this.actionIcon,
    this.controller,
    this.bottomOfAppbar,
    this.bottomNavigationBar,
    this.isFirstLayout = false,
    this.scrollable = false,
    this.scrollController,
    this.scrollIndicator = true,
    this.scrollPhysic = const BouncingScrollPhysics(),
    this.tabController,
    this.color,
    this.isToResize = false,
    this.onPop = _onPop,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.icon = Icons.arrow_back_ios_new_rounded,
    this.appBarColor = AppColorsV2.neutral100,
    this.onPullToRefresh,
    this.shimmerBuilder,
    this.isLoading = false,
    this.centerTitle = false,
    this.autoLowercaseTitle = true,
    this.autoCapitalize = true,
    this.subTitle = '',
    this.isCustomBack = false,
    this.onTapBackCustom = _onPop,
    this.belowBottomOfAppBarSpacing = DimensV2.d0,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.wrapByWillPopScopeWidget = true,
    this.showAppBar = true,
    this.hasAppBar = true,
    this.hideBackButton = false,
    this.useGlassBottomBar = true,
    this.glassBottomBarActions,
    this.glassBottomBarCenterButton,
    this.glassBottomBarPadding = const EdgeInsets.only(
      left: DimensV2.d16,
      top: DimensV2.d6,
      right: DimensV2.d16,
    ),
    this.glassBottomBarCustomButton,
    this.isCustomButtonEnabled = false,
    this.showGlassButtonBack = true,
    this.onTapCustomButton,
    this.customShimmerWrapper,
    this.autoScrollOnKeyboard = true,
    this.extendBodyBehindAppBar = true,
    this.appBarFlexibleSpace,
    this.appBarFlexibleSpaceBuilder,
    this.appBarTitlePadding,
    this.appBarLeadingPadding,
    this.appBarActionsPadding,
    this.appBarLeadingWidth,
    this.appBarLeading,
    this.appBarBuilder,
    this.useNativeBlurAppBar = true,
    this.appBarBlurBackground,
    this.appBarBlurBackgroundOpacity = 0.9,
    this.appBarBlurTopAlpha = 0.035,
    this.appBarBlurMiddleAlpha = 0.05,
    this.appBarBlurSigma = DimensV2.d0,
    this.appBarLeadingIconSize = DimensV2.d18,
    this.showHeaderBackground = true,
    this.headerBackground,
    this.headerBackgroundOpacity = 1,
    this.useColorBackground = false,
    this.hasSubTitle = false,
  });

  /// The title of the appbar.
  final String? title;

  /// The body of the screen.
  final Widget body;

  /// The list of actions of the appbar that will be placed at
  /// the right side of the appbar.
  final List<AppBarActionItem>? actionIcon;

  final List<Widget>? actions;

  /// The controller of the appbar, despite its name, this controller
  /// also used for controlling the body of the screen.
  final AppBarController? controller;

  /// The controller of the scroll view of the body.
  final ScrollController? scrollController;

  /// The widget which is placed at the bottom of the screen.
  final Widget? bottomNavigationBar;

  /// The widget which is placed at the bottom of the appbar.
  final Widget? bottomOfAppbar;

  /// The flag which indicates whether this screen is the first layout to
  /// determine if there will be no back button on the appbar.
  final bool? isFirstLayout;

  /// The flag which indicates whether the body of the screen is scrollable.
  final bool? scrollable;

  /// The physics of the scroll view of the body.
  final ScrollPhysics? scrollPhysic;

  /// The color of the screen.
  final Color? color;

  /// The flag which indicates whether the screen is resize to avoid the bottom
  final bool? isToResize;

  /// The callback which is called when the back button is pressed.
  final Future<bool> Function() onPop;

  /// The icon of the back button.
  final IconData? icon;

  /// The tab controller of the screen.
  final TabController? tabController;

  /// The floating action button of the screen.
  final Widget? floatingActionButton;

  /// The location of the floating action button.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// The color of the appbar.
  final Color appBarColor;

  /// The callback which is called when the screen is pulled to refresh.
  final Future<void> Function()? onPullToRefresh;

  /// The flag which indicates whether the screen is loading.
  final bool isLoading;

  /// The builder of the shimmer effect.
  final Widget Function(BuildContext context)? shimmerBuilder;

  /// Should the title be centered or not.
  final bool centerTitle;

  /// Should the title be lowercased automatically or not.
  final bool autoLowercaseTitle;

  /// Should the title be capitalized automatically or not.
  final bool autoCapitalize;

  /// Show the scroll indicator.
  final bool scrollIndicator;

  /// SubTitle
  final String subTitle;

  /// true false onpen button custom back
  final bool isCustomBack;

  /// onTap back custom
  final VoidCallback onTapBackCustom;

  final double? belowBottomOfAppBarSpacing;

  /// The depth of your pull to refresh's scroll view
  final bool Function(ScrollNotification) notificationPredicate;

  ///  Wrap by WillPopScope widget or not
  final bool wrapByWillPopScopeWidget;

  /// The flag which indicates whether the appbar should be shown or not.
  final bool showAppBar;

  /// The flag which indicates whether the appbar is included. Defaults to true.
  final bool hasAppBar;

  final bool hideBackButton;

  final bool useGlassBottomBar;

  final List<Widget>? glassBottomBarActions;

  final Widget? glassBottomBarCenterButton;

  final EdgeInsets? glassBottomBarPadding;

  final Widget? glassBottomBarCustomButton;

  final bool isCustomButtonEnabled;

  final bool showGlassButtonBack;

  final Function()? onTapCustomButton;

  /// Custom shimmer wrapper function to override default ShimmerV2.fromColors
  /// If null, uses default shimmer. If provided, wraps shimmerBuilder with custom shimmer.
  /// Example: (context, child) => YourCustomShimmer(child: child)
  final Widget Function(BuildContext context, Widget child)? customShimmerWrapper;

  /// Auto scroll to bottom when keyboard opens
  final bool autoScrollOnKeyboard;

  /// Should body extend behind app bar
  final bool extendBodyBehindAppBar;

  /// Custom flexible space for app bar
  final Widget? appBarFlexibleSpace;

  /// Custom flexible space builder for app bar with blur progress
  final Widget Function(BuildContext context, double blurProgress)? appBarFlexibleSpaceBuilder;

  /// Custom title padding for app bar
  final EdgeInsetsGeometry? appBarTitlePadding;

  /// Custom leading padding for app bar
  final EdgeInsetsGeometry? appBarLeadingPadding;

  /// Custom actions padding for app bar
  final EdgeInsetsGeometry? appBarActionsPadding;

  /// Custom leading width for app bar
  final double? appBarLeadingWidth;

  /// Custom leading widget for app bar
  final Widget? appBarLeading;

  /// Custom app bar builder with shared blur progress
  final PreferredSizeWidget Function(BuildContext context, double blurProgress)? appBarBuilder;

  /// Use native Flutter AppBar with shared scroll blur behavior
  final bool useNativeBlurAppBar;

  /// Background layer used by native blur app bar
  final Widget? appBarBlurBackground;

  /// Opacity for background layer used by native blur app bar
  final double appBarBlurBackgroundOpacity;

  /// First overlay alpha used by native blur app bar
  final double appBarBlurTopAlpha;

  /// Middle overlay alpha used by native blur app bar
  final double appBarBlurMiddleAlpha;

  /// Blur sigma used by native blur app bar
  final double appBarBlurSigma;

  /// Leading icon size used by native blur app bar
  final double appBarLeadingIconSize;

  /// Whether to show the default header background image.
  final bool showHeaderBackground;

  /// Optional custom header background widget.
  final Widget? headerBackground;

  /// Opacity for the header background layer.
  final double headerBackgroundOpacity;

  /// When `true`, the unified background uses the experimental
  /// [HeaderColorCurtainRevealV2] (full-screen `greenTheme700` with the
  /// `imgBackground` pattern on the top 34%). Defaults to `false`, which
  /// Keeps the legacy [_CommonAppBarBackground] (color + ShaderMask).
  final bool useColorBackground;

  /// Check whether the appBar has subTitle to reserve height immediately.
  final bool hasSubTitle;

  @override

  /// Creates the state used by [CommonAppBarV2].
  State<CommonAppBarV2> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBarV2> {
  final ScrollController _scrollController = ScrollController();
  final titleKey = GlobalKey();
  double? height;
  final _blurProgressNotifier = ValueNotifier<double>(0.0);

  double get _appBarHeight {
    final double minHeight =
        widget.hasSubTitle || widget.subTitle.isNotEmpty ? DimensV2.d80 : DimensV2.d60;
    final double effectiveHeight = height ?? minHeight;
    return effectiveHeight < minHeight ? minHeight : effectiveHeight;
  }

  AppThemeMode get _themeMode => CommonAppBarV2.themeModeGlobal.value;
  AppColorId get _colorId => CommonAppBarV2.colorIdGlobal.value;

  ScrollController get _effectiveScrollController => widget.scrollController ?? _scrollController;

  void _onThemeChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  /// Registers app bar scroll listener.
  @override
  void initState() {
    super.initState();
    _effectiveScrollController.addListener(_handleScroll);
    CommonAppBarV2.themeModeGlobal.addListener(_onThemeChanged);
    CommonAppBarV2.colorIdGlobal.addListener(_onThemeChanged);
  }

  /// Updates app bar scroll listener when [scrollController] changes.
  @override
  void didUpdateWidget(covariant CommonAppBarV2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldScrollController = oldWidget.scrollController ?? _scrollController;
    final nextScrollController = _effectiveScrollController;

    if (oldScrollController == nextScrollController) {
      return;
    }
    oldScrollController.removeListener(_handleScroll);
    nextScrollController.addListener(_handleScroll);
    _handleScroll();
  }

  /// Removes app bar scroll listener.
  @override
  void dispose() {
    _effectiveScrollController.removeListener(_handleScroll);
    CommonAppBarV2.themeModeGlobal.removeListener(_onThemeChanged);
    CommonAppBarV2.colorIdGlobal.removeListener(_onThemeChanged);
    _scrollController.dispose();
    _blurProgressNotifier.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (!_effectiveScrollController.hasClients) {
      return;
    }

    final offset = _effectiveScrollController.offset;
    if (offset <= 0) {
      if (_blurProgressNotifier.value != 0) {
        _blurProgressNotifier.value = 0;
      }
      return;
    }

    const blurStartOffset = DimensV2.d4;
    const blurEndOffset = DimensV2.d72;
    final rawProgress = (offset - blurStartOffset) / (blurEndOffset - blurStartOffset);
    final nextProgress = rawProgress.clamp(0.0, 1.0).toDouble();

    if ((nextProgress - _blurProgressNotifier.value).abs() < 0.002) {
      return;
    }

    // Update ValueNotifier only — does NOT call setState on _CommonAppBarState,
    // so the Scaffold/body is never rebuilt during a scroll or pull-to-refresh gesture.
    _blurProgressNotifier.value = nextProgress;
  }

  void _syncMeasuredAppBarHeight() {
    final nextHeight = titleKey.currentContext?.size?.height;
    if (!mounted || nextHeight == null || nextHeight <= 0) return;

    final oldAppBarHeight = _appBarHeight;
    height = nextHeight;
    final newAppBarHeight = _appBarHeight;

    if (oldAppBarHeight != newAppBarHeight) {
      setState(() {});
    }
  }

  Widget? _buildResolvedHeaderBackground(Color effectiveColor) {
    if (!widget.showHeaderBackground) {
      return widget.headerBackground;
    }

    return widget.headerBackground ?? _ThemeHeaderBackground(color: effectiveColor);
  }

  Future<void> _handleBackTap() async {
    if (await widget.onPop()) {
      SystemActionV2.pop();
    }
  }

  Widget _buildBackButton({
    required BuildContext context,
    required VoidCallback onTap,
    required IconData icon,
    required double iconSize,
  }) {
    return UnconstrainedBox(
      child: SizedBox(
        width: DimensV2.d36,
        height: DimensV2.d36,
        child: PressableCardContainerV2(
          onTap: onTap,
          borderRadius: DimensV2.d100,
          pressedOffset: DimensV2.d2,
          child: Center(
            child: Icon(
              icon,
              size: iconSize,
              color: context.mayColors.icPrimary,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = _isThemeToolDarkMode(context);
    final baseTheme = isDarkMode ? MainThemeV2.dark : MainThemeV2.light;
    final baseColors = isDarkMode ? MainThemeV2.darkColors : MainThemeV2.lightColors;
    final colors = AppColorPickerCardV2.getCustomColors(
      baseColors,
      _colorId,
      isDarkMode: isDarkMode,
    );

    return Theme(
      data: baseTheme.copyWith(extensions: <ThemeExtension<dynamic>>[colors]),
      child: Builder(builder: _buildThemedAppBar),
    );
  }

  Widget _buildThemedAppBar(BuildContext context) {
    final effectiveColor = widget.appBarColor == AppColorsV2.neutral100
        ? context.mayColors.headerDefault
        : widget.appBarColor;
    final themeData = Theme.of(context).copyWith(
      primaryColor: effectiveColor,
      colorScheme: Theme.of(context).colorScheme.copyWith(primary: effectiveColor),
    );

    return Theme(
      data: themeData,
      child: widget.controller != null
          ? ChangeNotifierBuilder(
              value: widget.controller!,
              builder: (context, controller) {
                return body(controller, context, effectiveColor);
              },
            )
          : body(null, context, effectiveColor),
    );
  }

  bool _isThemeToolDarkMode(BuildContext context) {
    switch (_themeMode) {
      case AppThemeMode.light:
        return false;
      case AppThemeMode.dark:
        return true;
      case AppThemeMode.auto:
        return MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    }
  }

  /// Builds the screen content and wraps it with the configured scaffold.
  PopScope body(AppBarController? controller, BuildContext context, Color effectiveColor) {
    Widget body;
    if (controller?.isLoading ?? widget.isLoading) {
      if (widget.customShimmerWrapper != null) {
        // If customShimmerWrapper is provided, use it (with or without shimmerBuilder)
        final shimmerChild = widget.shimmerBuilder?.call(context) ?? const SizedBox.shrink();
        body = widget.customShimmerWrapper!(context, shimmerChild);
      } else if (widget.shimmerBuilder != null) {
        // If only shimmerBuilder is provided, use default ShimmerV2.fromColors
        body = ShimmerV2(
          child: widget.shimmerBuilder!(context),
        );
      } else {
        // No shimmer, just show body
        body = _body(context);
      }
    } else {
      body = _body(context);
    }
    String title = widget.title ?? '';
    // if (widget.autoLowercaseTitle) {
    //   title = title.toLowerCase();
    // }
    // if (widget.autoCapitalize) {
    //   title = title.toCapitalized();
    // }

    if (widget.wrapByWillPopScopeWidget) {
      body = PopScope(
        onPopInvokedWithResult: (didPop, __) {
          if (didPop) widget.onPop();
        },
        child: body,
      );
    }

    final bool shouldShowBackButton = !widget.hideBackButton && widget.isFirstLayout == false;
    final bottomOfAppBar = widget.bottomOfAppbar == null
        ? null
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.bottomOfAppbar!,
              SizedBox(height: widget.belowBottomOfAppBarSpacing ?? DimensV2.d0),
            ],
          );
    final appBarBottomSpacing =
        widget.bottomOfAppbar == null ? widget.belowBottomOfAppBarSpacing : DimensV2.d0;
    final resolvedHeaderBackground = _buildResolvedHeaderBackground(effectiveColor);
    final useUnifiedScreenBackground = resolvedHeaderBackground != null;

    return PopScope(
      onPopInvokedWithResult: (didPop, __) {
        if (didPop) widget.onPop();
      },
      child: StatefulBuilder(builder: (context, setStateScaffold) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _syncMeasuredAppBarHeight();
        });

        // appBarFlexibleSpaceBuilder — wrapped in ValueListenableBuilder so it
        // animates with scroll without needing a Scaffold-level setState.
        final appBarFlexibleSpace = widget.appBarFlexibleSpaceBuilder != null
            ? ValueListenableBuilder<double>(
                valueListenable: _blurProgressNotifier,
                builder: (ctx, v, _) => widget.appBarFlexibleSpaceBuilder!(ctx, v),
              )
            : widget.appBarFlexibleSpace;

        // appBarBuilder callbacks receive the current value at build time.
        // For reactive blur, callers should listen to _blurProgressNotifier directly.
        final appBar = widget.appBarBuilder?.call(
              context,
              _blurProgressNotifier.value,
            ) ??
            (widget.useNativeBlurAppBar
                ? _buildNativeBlurAppBar(context, title, effectiveColor)
                : PreferredSize(
                    preferredSize: Size.fromHeight(_appBarHeight),
                    child: ValueListenableBuilder<double>(
                      valueListenable: _blurProgressNotifier,
                      builder: (ctx, blurProgress, _) => AppBarWidgetV2(
                        title: title,
                        titleKey: titleKey,
                        subTitle: widget.subTitle,
                        actions: widget.actions,
                        actionIcon: widget.actionIcon?.map((e) => e.build(ctx)).toList(),
                        toolbarHeight: _appBarHeight,
                        leading: widget.appBarLeading ??
                            (shouldShowBackButton
                                ? _buildBackButton(
                                    context: ctx,
                                    onTap: widget.isCustomBack == true
                                        ? widget.onTapBackCustom
                                        : _handleBackTap,
                                    icon: widget.icon ?? Icons.arrow_back_ios_sharp,
                                    iconSize: DimensV2.d20,
                                  )
                                : null),
                        centerTitle: widget.centerTitle,
                        color: effectiveColor,
                        headerBackground:
                            useUnifiedScreenBackground ? null : resolvedHeaderBackground,
                        showBackgroundLayers: !useUnifiedScreenBackground,
                        backgroundOpacity: widget.headerBackgroundOpacity,
                        blurProgress: blurProgress,
                        flexibleSpace: appBarFlexibleSpace,
                        titlePadding: widget.appBarTitlePadding,
                        leadingPadding: widget.appBarLeadingPadding,
                        actionsPadding: widget.appBarActionsPadding,
                        leadingWidth: widget.appBarLeadingWidth,
                        belowBottomOfAppBarSpacing: appBarBottomSpacing,
                        hideBackButton: widget.hideBackButton,
                      ),
                    ),
                  ));

        final scaffold = CommonScaffoldV2(
          backgroundColor: widget.color ?? context.mayColors.bgAppSurface,
          background: useUnifiedScreenBackground
              ? widget.useColorBackground
                  ? const HeaderColorCurtainRevealV2()
                  : _CommonAppBarBackground(
                      color: widget.color ?? context.mayColors.bgAppSurface,
                      headerBackground: resolvedHeaderBackground,
                      backgroundOpacity: widget.headerBackgroundOpacity,
                    )
              : null,
          resizeToAvoidBottomInset: widget.isToResize ?? false,
          extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
          bottomOfAppBar: bottomOfAppBar,
          appBar: (widget.showAppBar && widget.hasAppBar) ? appBar : null,
          body: Stack(
            alignment: Alignment.bottomCenter,
            fit: StackFit.expand,
            children: [
              body,
              if (!widget.showAppBar || !widget.hasAppBar)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: MediaQuery.of(context).padding.top + kToolbarHeight,
                  child: IgnorePointer(
                    child: ValueListenableBuilder<double>(
                      valueListenable: _blurProgressNotifier,
                      builder: (ctx, blurProgress, _) {
                        return _buildNativeAppBarBlur(ctx, effectiveColor, blurProgress);
                      },
                    ),
                  ),
                ),
              if (widget.useGlassBottomBar)
                Positioned(
                  left: 0,
                  right: 0,
                  child: GlassBottomBarV2(
                    onPop: widget.onPop,
                    centerButton: widget.glassBottomBarCenterButton,
                    actions: widget.glassBottomBarActions ?? [],
                    padding: widget.glassBottomBarPadding ??
                        const EdgeInsets.symmetric(horizontal: DimensV2.d16)
                            .copyWith(top: DimensV2.d16),
                    onTap: widget.onTapCustomButton,
                    isEnabled: widget.isCustomButtonEnabled,
                    isShowBack: widget.showGlassButtonBack,
                    customGlassButton: widget.glassBottomBarCustomButton,
                  ),
                ),
            ],
          ),
          bottomNavigationBar: widget.bottomNavigationBar,
          floatingActionButtonLocation: widget.floatingActionButtonLocation,
          floatingActionButton: widget.floatingActionButton,
        );

        return scaffold;
      }),
    );
  }

  PreferredSizeWidget _buildNativeBlurAppBar(BuildContext context, String title, Color color) {
    final effectiveActions = [
      ...?widget.actions,
      ...?widget.actionIcon?.map((e) => e.build(context)),
    ];
    final shouldShowBackButton = !widget.hideBackButton && widget.isFirstLayout == false;
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: widget.centerTitle,
      backgroundColor: AppColorsV2.transparent,
      surfaceTintColor: AppColorsV2.transparent,
      shadowColor: AppColorsV2.transparent,
      toolbarHeight: _appBarHeight,
      leadingWidth: widget.appBarLeadingWidth ?? (DimensV2.d36 + DimensV2.d16),
      flexibleSpace: ValueListenableBuilder<double>(
        valueListenable: _blurProgressNotifier,
        builder: (_, v, __) => _buildNativeAppBarBlur(context, color, v),
      ),
      leading: shouldShowBackButton
          ? Padding(
              padding: widget.appBarLeadingPadding ??
                  const EdgeInsets.only(
                    left: DimensV2.d16,
                    top: DimensV2.d4,
                    bottom: DimensV2.d20,
                  ),
              child: widget.appBarLeading ??
                  _buildBackButton(
                    context: context,
                    onTap: widget.isCustomBack == true ? widget.onTapBackCustom : _handleBackTap,
                    icon: widget.icon ?? Icons.arrow_back_ios_new_rounded,
                    iconSize: widget.appBarLeadingIconSize,
                  ),
            )
          : null,
      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        opacity: title.trim().isEmpty ? 0.0 : 1.0,
        child: Padding(
          key: titleKey,
          padding: widget.appBarTitlePadding ??
              const EdgeInsets.only(top: DimensV2.d4, bottom: DimensV2.d20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                widget.centerTitle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStylesV2.title20SemiBold.copyWith(
                  color: context.mayColors.primaryText,
                ),
                textAlign: widget.centerTitle ? TextAlign.center : TextAlign.left,
              ),
              if (widget.subTitle.isNotEmpty)
                Text(
                  widget.subTitle,
                  style: AppTextStylesV2.title15Medium.copyWith(
                    color: context.mayColors.secondaryText,
                  ),
                  textAlign: widget.centerTitle ? TextAlign.center : TextAlign.left,
                ),
            ],
          ),
        ),
      ),
      actions: List.generate(effectiveActions.length, (index) {
        final isLast = index == effectiveActions.length - 1;
        return Padding(
          padding: widget.appBarActionsPadding ??
              EdgeInsets.only(
                right: isLast ? AppSpacingV2.lg : AppSpacingV2.none,
                top: DimensV2.d4,
                bottom: widget.subTitle.isNotEmpty ? DimensV2.d16 : DimensV2.d20,
              ),
          child: effectiveActions[index],
        );
      }),
    );
  }

  /// Builds the native blur layer for the app bar.
  /// Receives [rawProgress] directly from [ValueListenableBuilder] so it never
  /// needs to call setState on the parent state.
  Widget _buildNativeAppBarBlur(BuildContext context, Color color, double rawProgress) {
    final blurProgress = Curves.easeOutCubic.transform(rawProgress);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isMainThemeColor = color == context.mayColors.headerDefault;
    final gradient = isMainThemeColor
        ? LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              context.mayColors.headerGradientStart,
              context.mayColors.headerGradientMiddle,
              context.mayColors.headerGradientEnd,
            ],
            stops: const [0, 0.65, 1],
          )
        : LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDarkMode
                ? [
                    AppColorsV2.genericBlack,
                    AppColorsV2.neutral700,
                    AppColorsV2.neutral500.withValues(alpha: 0.6),
                  ]
                : [
                    color,
                    color.withValues(alpha: 0.5),
                    color.withValues(alpha: 0),
                  ],
            stops: const [0, 0.65, 1],
          );
    return Opacity(
      opacity: blurProgress,
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
              Opacity(
                opacity: widget.appBarBlurBackgroundOpacity,
                child: DecoratedBox(
                  decoration: BoxDecoration(gradient: gradient),
                ),
              ),
              BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: widget.appBarBlurSigma * blurProgress,
                  sigmaY: widget.appBarBlurSigma * blurProgress,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        context.mayColors.headerGradientStart.withValues(
                          alpha: widget.appBarBlurTopAlpha * rawProgress,
                        ),
                        context.mayColors.headerGradientMiddle.withValues(
                          alpha: widget.appBarBlurMiddleAlpha * rawProgress,
                        ),
                        context.mayColors.headerGradientEnd.withValues(alpha: 0),
                      ],
                      stops: const [0, 0.72, 1],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    Widget scrollView = widget.body;

    // Auto scroll focused field above GlassBottomBar when keyboard opens
    if (widget.autoScrollOnKeyboard) {
      final isKeyboardOpen = AppDimenV2.of(context).keyboardHeight > 0;
      final route = ModalRoute.of(context);

      if (isKeyboardOpen &&
          route?.isCurrent == true &&
          _routeOwnsFocusedEditable(route) &&
          _effectiveScrollController.hasClients) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted ||
              route?.isCurrent != true ||
              !_routeOwnsFocusedEditable(route) ||
              !_effectiveScrollController.hasClients) {
            return;
          }
          final focusCtx = FocusManager.instance.primaryFocus?.context;
          if (focusCtx == null) return;

          final renderObject = focusCtx.findRenderObject();
          if (renderObject == null) return;

          // Tìm viewport (ScrollView) để tính vị trí tương đối
          final scrollableState = Scrollable.maybeOf(focusCtx);
          final scrollRenderObject = scrollableState?.context.findRenderObject();
          if (scrollRenderObject is! RenderBox) return;

          final renderBox = renderObject as RenderBox;
          // Vị trí bottom của field trong coordinate của viewport
          final fieldBottomInViewport = renderBox
              .localToGlobal(Offset(0, renderBox.size.height), ancestor: scrollRenderObject)
              .dy;

          // Chiều cao viewport trừ GlassBottomBar
          final viewportHeight = scrollRenderObject.size.height;
          final bottomBarHeight = AppDimenV2.of(context).glassBottomBarHeight + DimensV2.d20;
          final visibleHeight = viewportHeight - bottomBarHeight;

          // Nếu field nằm dưới vùng visible → cần scroll thêm
          if (fieldBottomInViewport > visibleHeight) {
            final extraScroll = fieldBottomInViewport - visibleHeight;
            final currentOffset = _effectiveScrollController.offset;
            final maxOffset = _effectiveScrollController.position.maxScrollExtent;
            final targetOffset = (currentOffset + extraScroll).clamp(0.0, maxOffset);
            _effectiveScrollController.animateTo(
              targetOffset,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
      }
    }

    if (widget.scrollable!) {
      scrollView = SingleChildScrollView(
        physics: widget.scrollPhysic,
        controller: _effectiveScrollController,
        child: widget.body,
      );
      if (widget.scrollIndicator) {
        final body = scrollView;
        scrollView = Scrollbar(
          controller: _effectiveScrollController,
          child: body,
        );
      }
      final view = scrollView;
      scrollView = SizedBox(
        width: AppDimenV2.of(context).screenWidth,
        height: AppDimenV2.of(context).screenHeight,
        child: view,
      );
    }

    if (widget.onPullToRefresh != null) {
      scrollView = AppRefreshIndicator(
        onRefresh: () async {
          await widget.onPullToRefresh?.call();
          await Future<void>.delayed(const Duration(milliseconds: 500));
        },
        notificationPredicate: widget.notificationPredicate,
        child: scrollView,
      );
    }
    return scrollView;
  }

  bool _routeOwnsFocusedEditable(ModalRoute<dynamic>? route) {
    final focusContext = FocusManager.instance.primaryFocus?.context;
    if (focusContext == null || route == null) return false;
    if (!identical(ModalRoute.of(focusContext), route)) return false;
    if (focusContext.findAncestorStateOfType<EditableTextState>() == null) return false;

    final isInsideAppBar = focusContext.findAncestorWidgetOfExactType<AppBar>() != null ||
        focusContext.findAncestorWidgetOfExactType<AnimatedSearchBarV2>() != null;
    if (isInsideAppBar) return false;

    return true;
  }
}

class _ThemeHeaderBackground extends StatelessWidget {
  const _ThemeHeaderBackground({required this.color});

  final Color color;

  @override

  /// Builds the themed header background layer.
  Widget build(BuildContext context) {
    final colors = context.mayColors;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final patternOpacity = isDark ? 0.28 : 0.24;
    final fadeColor = colors.headerGradientEnd;
    final topGradientColor = isDark ? AppColorsV2.genericBlack : color;
    final topGradientStops = isDark ? const [0.0, 0.82] : const [0.0, 0.88];
    final fadeStops = isDark ? const [0.12, 1.0] : const [0.18, 1.0];

    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                topGradientColor,
                topGradientColor.withValues(alpha: 0),
              ],
              stops: topGradientStops,
            ),
          ),
        ),
        Positioned.fill(
          child: Opacity(
            opacity: patternOpacity,
            child: Assets.images.imgBackground.image(
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                fadeColor.withValues(alpha: 0),
                fadeColor,
              ],
              stops: fadeStops,
            ),
          ),
        ),
      ],
    );
  }
}

class _CommonAppBarBackground extends StatelessWidget {
  const _CommonAppBarBackground({
    required this.color,
    required this.headerBackground,
    required this.backgroundOpacity,
  });

  final Color color;
  final Widget headerBackground;
  final double backgroundOpacity;

  @override

  /// Builds the shared background for the common app bar.
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final overlayColors = isDark
        ? [
            AppColorsV2.transparent,
            AppColorsV2.transparent,
            AppColorsV2.transparent,
            AppColorsV2.transparent,
          ]
        : [
            AppColorsV2.transparent,
            color.withValues(alpha: 0.08),
            color.withValues(alpha: 0.10),
            color.withValues(alpha: 0.18),
          ];

    return ColoredBox(
      color: color,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColorsV2.genericWhite,
                  AppColorsV2.genericWhite,
                  AppColorsV2.transparent
                ],
                stops: [0, 0.65, 1],
              ).createShader(bounds),
              blendMode: BlendMode.dstIn,
              child: SizedBox(
                width: double.infinity,
                height: AppDimenV2.of(context).screenHeight * 0.34,
                child: Opacity(
                  opacity: backgroundOpacity,
                  child: headerBackground,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: const Alignment(0, 0.25),
                  colors: overlayColors,
                  stops: const [0, 0.35, 0.72, 1],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

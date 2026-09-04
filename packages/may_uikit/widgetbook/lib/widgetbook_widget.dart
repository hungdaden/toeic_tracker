// ignore_for_file: invalid_use_of_internal_member, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:may_uikit/may_uikit_internal.dart';
import 'package:widgetbook/src/routing/app_router.dart';
import 'package:widgetbook/src/state/default_home_page.dart';
import 'package:widgetbook/src/themes.dart';
import 'package:widgetbook/widgetbook.dart';

/// Widgetbook wrapper that keeps May UI Kit theme and localization setup.
class WidgetbookCustom extends StatefulWidget {
  /// Creates a widgetbook using a custom [appBuilder].
  const WidgetbookCustom({
    super.key,
    this.initialRoute = '/',
    required this.directories,
    this.appBuilder = widgetsAppBuilder,
    this.addons,
    this.integrations,
    this.lightTheme,
    this.darkTheme,
    this.themeMode,
    this.home = const DefaultHomePage(),
    this.header,
    this.scrollBehavior,
    this.enableLeafComponents = true,
  });

  /// Creates a widgetbook using a Cupertino [appBuilder].
  const WidgetbookCustom.cupertino({
    super.key,
    this.initialRoute = '/',
    required this.directories,
    this.appBuilder = cupertinoAppBuilder,
    this.addons,
    this.integrations,
    this.lightTheme,
    this.darkTheme,
    this.themeMode,
    this.home = const DefaultHomePage(),
    this.header,
    this.scrollBehavior,
    this.enableLeafComponents = true,
  });

  /// Creates a widgetbook using a Material [appBuilder].
  const WidgetbookCustom.material({
    super.key,
    this.initialRoute = '/',
    required this.directories,
    this.appBuilder = mayMaterialAppBuilder,
    this.addons,
    this.integrations,
    this.lightTheme,
    this.darkTheme,
    this.themeMode,
    this.home = const DefaultHomePage(),
    this.header,
    this.scrollBehavior,
    this.enableLeafComponents = true,
  });

  final String initialRoute;
  final List<WidgetbookNode> directories;
  final AppBuilder appBuilder;
  final List<WidgetbookAddon>? addons;
  final List<WidgetbookIntegration>? integrations;
  final ThemeData? lightTheme;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;
  final Widget home;
  final Widget? header;
  final ScrollBehavior? scrollBehavior;
  final bool enableLeafComponents;

  /// Creates state for the custom widgetbook shell.
  @override
  State<WidgetbookCustom> createState() => _WidgetbookCustomState();
}

/// State that owns the widgetbook router and generated directory tree.
class _WidgetbookCustomState extends State<WidgetbookCustom> {
  late final WidgetbookState state;
  late final AppRouter router;

  /// Initializes widgetbook state, router, and integrations.
  @override
  void initState() {
    super.initState();

    state = WidgetbookState(
      appBuilder: widget.appBuilder,
      home: widget.home,
      header: widget.header,
      addons: widget.addons,
      integrations: widget.integrations,
      enableLeafComponents: widget.enableLeafComponents,
      root: WidgetbookRoot(
        children: widget.directories,
      ),
    );

    router = AppRouter(
      state: state,
      uri: Uri.base.fragment.isNotEmpty
          ? Uri.parse(Uri.base.fragment)
          : Uri.parse(widget.initialRoute),
    );

    for (final integration in widget.integrations ?? <WidgetbookIntegration>[]) {
      integration.onInit(state);
    }
  }

  /// Builds the widgetbook shell with readable Widgetbook controls.
  @override
  Widget build(BuildContext context) {
    return WidgetbookScope(
      state: state,
      child: MaterialApp.router(
        title: 'May UI Kit Widgetbook',
        themeMode: widget.themeMode ?? ThemeMode.system,
        theme: widget.lightTheme ?? Themes.light,
        darkTheme: widget.darkTheme ?? Themes.dark,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        scrollBehavior: widget.scrollBehavior,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}

/// Builds each use case with May UI Kit theme and localization context.
Widget mayMaterialAppBuilder(BuildContext context, Widget child) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: MainThemeV2.lightTheme,
    darkTheme: MainThemeV2.darkTheme,
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    home: Material(
      child: child,
    ),
  );
}

/// Creates the Widgetbook theme selector for May UI Kit palettes.
MaterialThemeAddon mayUikitThemeAddon() {
  final greenLight = _mayTheme(AppColorId.green, Brightness.light);

  return MaterialThemeAddon(
    initialTheme: WidgetbookTheme<ThemeData>(
      name: 'Green Light',
      data: greenLight,
    ),
    themes: [
      WidgetbookTheme<ThemeData>(
        name: 'Green Light',
        data: greenLight,
      ),
      WidgetbookTheme<ThemeData>(
        name: 'Green Dark',
        data: _mayTheme(AppColorId.green, Brightness.dark),
      ),
      WidgetbookTheme<ThemeData>(
        name: 'Pink Light',
        data: _mayTheme(AppColorId.pink, Brightness.light),
      ),
      WidgetbookTheme<ThemeData>(
        name: 'Pink Dark',
        data: _mayTheme(AppColorId.pink, Brightness.dark),
      ),
      WidgetbookTheme<ThemeData>(
        name: 'Orange Light',
        data: _mayTheme(AppColorId.orange, Brightness.light),
      ),
      WidgetbookTheme<ThemeData>(
        name: 'Orange Dark',
        data: _mayTheme(AppColorId.orange, Brightness.dark),
      ),
    ],
  );
}

ThemeData _mayTheme(AppColorId colorId, Brightness brightness) {
  final isDarkMode = brightness == Brightness.dark;
  final baseTheme = isDarkMode ? MainThemeV2.darkTheme : MainThemeV2.lightTheme;
  final baseColors = isDarkMode ? MainThemeV2.darkColors : MainThemeV2.lightColors;
  final colors = AppColorPickerCardV2.getCustomColors(
    baseColors,
    colorId,
    isDarkMode: isDarkMode,
  );

  return baseTheme.copyWith(
    extensions: <ThemeExtension<dynamic>>[
      colors,
    ],
  );
}

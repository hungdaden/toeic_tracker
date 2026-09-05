import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:may_uikit/may_uikit.dart';
import 'liquid_glass_theme.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      extensions: [
        MainThemeV2.darkColors.copyWith(
          tokens: {
            'bgAppSurface': LiquidGlassTheme.background,
            'bgCard': const Color(0xFF111827),
            'bgSurface': const Color(0xFF111827),
            'sdDefault': Colors.black.withValues(alpha: 0.35),
            'bdDefault': Colors.white.withValues(alpha: 0.12),
            'txContentPrimaryDefault': Colors.white,
            'txContentSecondaryDefault': Colors.white70,
            'txContentTertiaryDefault': Colors.white60,
          },
        ),
      ],
      colorScheme: ColorScheme.fromSeed(
        seedColor: LiquidGlassTheme.primaryAccent,
        brightness: Brightness.dark,
        surface: LiquidGlassTheme.backgroundSecondary,
        primary: LiquidGlassTheme.primaryAccent,
        secondary: LiquidGlassTheme.secondaryAccent,
        tertiary: LiquidGlassTheme.emeraldAccent,
      ),
      scaffoldBackgroundColor: LiquidGlassTheme.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: -0.3,
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: LiquidGlassTheme.backgroundSecondary,
        surfaceTintColor: Colors.transparent,
        elevation: 12,
        shadowColor: Colors.black.withValues(alpha: 0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(
            color: LiquidGlassTheme.glassBorder,
            width: 1,
          ),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        contentTextStyle: TextStyle(
          fontSize: 14,
          color: Colors.white.withValues(alpha: 0.8),
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: LiquidGlassTheme.backgroundSecondary,
        surfaceTintColor: Colors.transparent,
        headerBackgroundColor: const Color(0xFF1E1B4B),
        headerForegroundColor: Colors.white,
        headerHeadlineStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        dayForegroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return Colors.white;
          if (states.contains(WidgetState.disabled)) return Colors.white24;
          return Colors.white;
        }),
        dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return LiquidGlassTheme.primaryAccent;
          return null;
        }),
        todayForegroundColor: WidgetStateProperty.all(LiquidGlassTheme.primaryAccent),
        todayBorder: const BorderSide(color: LiquidGlassTheme.primaryAccent),
        yearForegroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return Colors.white;
          return Colors.white;
        }),
        yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return LiquidGlassTheme.primaryAccent;
          return null;
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: LiquidGlassTheme.glassBorder, width: 1),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: Colors.transparent,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.06),
        labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.65)),
        hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.35)),
        prefixIconColor: Colors.white70,
        suffixIconColor: Colors.white70,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: LiquidGlassTheme.primaryAccent, width: 1.5),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.white.withValues(alpha: 0.1),
        thickness: 1,
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: LiquidGlassTheme.backgroundSecondary,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: LiquidGlassTheme.glassBorder, width: 1),
        ),
        textStyle: const TextStyle(color: Colors.white),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF111827),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: LiquidGlassTheme.glassBorder,
            width: 1,
          ),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.white70,
        textColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          backgroundColor: LiquidGlassTheme.primaryAccent,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: LiquidGlassTheme.primaryAccent.withValues(alpha: 0.4),
        ),
      ),
      fontFamily: 'Inter',
    );
  }
}

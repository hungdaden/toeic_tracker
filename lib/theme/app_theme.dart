import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'liquid_glass_theme.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
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
      cardTheme: CardThemeData(
        color: LiquidGlassTheme.surfaceGlass,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: LiquidGlassTheme.glassBorder,
            width: 1,
          ),
        ),
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

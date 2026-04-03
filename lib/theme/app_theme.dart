import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF64B5F6), // Blue seed
        brightness: Brightness.dark,
        surface: const Color(0xFF1E1E1E),
        primary: const Color(0xFF64B5F6),
        secondary: const Color(0xFF81C784), // Green for reading maybe
      ),
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF121212),
        elevation: 0,
        centerTitle: true,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: const Color(0xFF64B5F6),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

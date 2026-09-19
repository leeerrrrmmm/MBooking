// lib/core/theme/app_theme.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      canvasColor: Colors.black,
      colorScheme: const ColorScheme.dark(
        surface: Colors.black,
        onSurface: Colors.white,
        primary: Color(0xFFFCC434), // твой акцентный жёлтый
        onPrimary: Colors.black,
        secondary: Color(0xFF1C1C1C), // для полей ввода / карточек
        onSecondary: Colors.white,
        error: Colors.redAccent,
        onError: Colors.white,
      ),

      // Текст по умолчанию — белый
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.white),
        headlineLarge: TextStyle(color: Colors.white),
        headlineMedium: TextStyle(color: Colors.white),
        headlineSmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white70),
        labelLarge: TextStyle(color: Colors.white),
        labelMedium: TextStyle(color: Colors.white),
        labelSmall: TextStyle(color: Colors.white70),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      iconTheme: const IconThemeData(color: Colors.white),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1C1C1C),
        hintStyle: const TextStyle(color: Color(0xFF8C8C8C)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),

      cardTheme: const CardThemeData(color: Color(0xFF1C1C1C), elevation: 0),

      dividerColor: const Color(0xFF2A2A2A),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
      ),

      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}

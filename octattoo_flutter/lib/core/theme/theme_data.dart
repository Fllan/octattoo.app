import 'package:flutter/material.dart';

/// Centralized theme configurations
class AppThemeData {
  AppThemeData._();

  static const Color _seedColor = Color(0xff6750a4); // M3 Baseline

  static ThemeData get light {
    return ThemeData(
      colorSchemeSeed: _seedColor,
      brightness: Brightness.light,
      useMaterial3: true,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      colorSchemeSeed: _seedColor,
      brightness: Brightness.dark,
      useMaterial3: true,
    );
  }
}

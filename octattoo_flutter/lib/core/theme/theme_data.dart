import 'package:flutter/material.dart';

/// Enum representing the available color scheme images
enum ColorImage {
  bambooYellowBlue, // Default
  lampsaneBlueYellow,
  cyanotypesGreenWhite,
  auroreTillWhiteWarm
  ;

  String get assetPath => switch (this) {
    bambooYellowBlue => 'assets/color_images/lepetiroi-bamboo-yellow-blue.jpg',
    lampsaneBlueYellow =>
      'assets/color_images/lepetiroi-lampsane-blue-yellow.jpg',
    cyanotypesGreenWhite =>
      'assets/color_images/lepetiroi-cyanotypes-green-white.jpg',
    auroreTillWhiteWarm =>
      'assets/color_images/lepetiroi-aurore-thill-white-warm.jpg',
  };

  String get displayName => switch (this) {
    bambooYellowBlue => 'Bamboo',
    lampsaneBlueYellow => 'Lampsane',
    cyanotypesGreenWhite => 'Cyanotypes',
    auroreTillWhiteWarm => 'Goddess',
  };
}

/// Centralized theme configurations
class AppThemeData {
  AppThemeData._();

  static const Color _defaultSeedColor = Color.fromARGB(255, 31, 211, 127);

  /// Default light theme (used as fallback)
  static ThemeData get defaultLight {
    return ThemeData(
      colorSchemeSeed: _defaultSeedColor,
      brightness: Brightness.light,
      useMaterial3: true,
    );
  }

  /// Default dark theme (used as fallback)
  static ThemeData get defaultDark {
    return ThemeData(
      colorSchemeSeed: _defaultSeedColor,
      brightness: Brightness.dark,
      useMaterial3: true,
    );
  }

  /// Build theme from an extracted ColorScheme
  static ThemeData fromColorScheme(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
    );
  }
}

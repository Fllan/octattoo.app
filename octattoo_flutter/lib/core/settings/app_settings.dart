import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/theme/theme_data.dart';

/// Immutable value object holding all app-wide settings.
class AppSettings {
  const AppSettings({
    this.themeMode = ThemeMode.system,
    this.locale = const Locale('en'),
    this.colorImage = ColorImage.bambooYellowBlue,
  });

  final ThemeMode themeMode;
  final Locale locale;
  final ColorImage colorImage;

  AppSettings copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    ColorImage? colorImage,
  }) {
    return AppSettings(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      colorImage: colorImage ?? this.colorImage,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettings &&
          runtimeType == other.runtimeType &&
          themeMode == other.themeMode &&
          locale == other.locale &&
          colorImage == other.colorImage;

  @override
  int get hashCode => Object.hash(themeMode, locale, colorImage);
}

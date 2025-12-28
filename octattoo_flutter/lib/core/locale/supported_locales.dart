import 'package:flutter/material.dart';

/// Supported locales and helper methods
class SupportedLocales {
  SupportedLocales._();

  static const english = Locale('en');
  static const french = Locale('fr');
  static const arabic = Locale('ar');

  static const all = [english, french, arabic];

  /// Get display name for a locale
  static String displayName(Locale locale) {
    return switch (locale.languageCode) {
      'en' => 'English',
      'fr' => 'Français',
      'ar' => 'العربية',
      _ => locale.languageCode,
    };
  }

  /// Get flag emoji for a locale
  static String flag(Locale locale) {
    return switch (locale.languageCode) {
      'en' => '🇬🇧',
      'fr' => '🇫🇷',
      'ar' => '🇸🇦',
      _ => '🌐',
    };
  }
}

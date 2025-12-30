import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/theme/theme_data.dart';

import 'app_settings.dart';
import 'app_settings_repository.dart';

/// Single ChangeNotifier managing all app-wide settings.
/// Combines theme and locale management in one place.
class AppSettingsNotifier extends ChangeNotifier {
  AppSettingsNotifier(this._repository);

  final AppSettingsRepository _repository;
  AppSettings _settings = const AppSettings();

  /// Cached color schemes extracted from the selected image
  ColorScheme? _lightColorScheme;
  ColorScheme? _darkColorScheme;

  /// Current settings (immutable snapshot)
  AppSettings get settings => _settings;

  /// Convenience getters
  ThemeMode get themeMode => _settings.themeMode;
  Locale get locale => _settings.locale;
  ColorImage get colorImage => _settings.colorImage;

  /// Color scheme getters
  ColorScheme? get lightColorScheme => _lightColorScheme;
  ColorScheme? get darkColorScheme => _darkColorScheme;

  /// Initialize: load saved settings from storage.
  /// Uses defaults immediately, then updates when loaded.
  Future<void> initialize() async {
    final loaded = await _repository.loadSettings();
    if (loaded != _settings) {
      _settings = loaded;
    }
    // Extract color schemes from the current/loaded image
    await _extractColorScheme(_settings.colorImage);
    notifyListeners();
  }

  /// Extract color schemes from an image for both light and dark modes
  Future<void> _extractColorScheme(ColorImage image) async {
    _lightColorScheme = await ColorScheme.fromImageProvider(
      provider: AssetImage(image.assetPath),
      brightness: Brightness.light,
    );
    _darkColorScheme = await ColorScheme.fromImageProvider(
      provider: AssetImage(image.assetPath),
      brightness: Brightness.dark,
    );
  }

  /// Update theme mode
  Future<void> setThemeMode(ThemeMode mode) async {
    if (_settings.themeMode == mode) return;
    _settings = _settings.copyWith(themeMode: mode);
    notifyListeners();
    await _repository.saveSettings(_settings);
  }

  /// Toggle between light and dark
  Future<void> toggleTheme() async {
    final newMode = _settings.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    await setThemeMode(newMode);
  }

  /// Convenience methods for theme
  Future<void> setLightTheme() => setThemeMode(ThemeMode.light);
  Future<void> setDarkTheme() => setThemeMode(ThemeMode.dark);
  Future<void> setSystemTheme() => setThemeMode(ThemeMode.system);

  /// Update locale
  Future<void> setLocale(Locale locale) async {
    if (_settings.locale == locale) return;
    _settings = _settings.copyWith(locale: locale);
    notifyListeners();
    await _repository.saveSettings(_settings);
  }

  /// Update color image and extract new color schemes
  Future<void> setColorImage(ColorImage image) async {
    if (_settings.colorImage == image) return;
    _settings = _settings.copyWith(colorImage: image);
    await _extractColorScheme(image);
    notifyListeners();
    await _repository.saveSettings(_settings);
  }
}

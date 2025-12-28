import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/theme/theme_repository.dart';

/// Manages theme state and business logic
/// Uses ValueNotifier for reactive updates without external packages
class ThemeController {
  ThemeController(this._repository)
    : _themeMode = ValueNotifier(ThemeMode.system);

  final ThemeRepository _repository;
  final ValueNotifier<ThemeMode> _themeMode;

  /// Current theme mode
  ThemeMode get current => _themeMode.value;

  /// Listenable for reactive updates
  ValueListenable<ThemeMode> get listenable => _themeMode;

  /// Initialize: load saved theme from storage
  Future<void> initialize() async {
    _themeMode.value = await _repository.loadThemeMode();
  }

  /// Toggle between light and dark
  Future<void> toggle() async {
    final newMode = _themeMode.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    await setThemeMode(newMode);
  }

  /// Set specific theme mode
  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode.value = mode;
    await _repository.saveThemeMode(mode);
  }

  /// Convenience methods
  Future<void> setLight() => setThemeMode(ThemeMode.light);
  Future<void> setDark() => setThemeMode(ThemeMode.dark);
  Future<void> setSystem() => setThemeMode(ThemeMode.system);

  void dispose() {
    _themeMode.dispose();
  }
}

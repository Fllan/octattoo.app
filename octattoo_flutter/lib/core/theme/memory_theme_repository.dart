import 'package:flutter/material.dart';
import 'theme_repository.dart';

/// In-memory theme storage
/// Theme persists only during app session
/// Use this until you implement backend storage
class MemoryThemeRepository implements ThemeRepository {
  ThemeMode _cachedThemeMode = ThemeMode.system;

  @override
  Future<ThemeMode> loadThemeMode() async {
    return _cachedThemeMode;
  }

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {
    _cachedThemeMode = mode;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/services/shared_preferences/shared_preferences_keys.dart';
import 'package:octattoo_app/core/services/shared_preferences/shared_preferences_provider.dart';
import 'package:octattoo_app/core/theme/theme_mode_provider.dart';
import 'package:octattoo_app/core/utils/logger.dart';

/// `ThemeModeRepository` is responsible for getting and setting the theme mode.
class ThemeModeRepository {
  ThemeModeRepository({required this.ref});
  final Ref ref;

  /// Sets the theme mode and saves it in SharedPreferences.
  Future<void> setTheme(ThemeMode themeMode) async {
    var themeModeKey = SharedPreferencesKey.themeMode.toString();
    logger.d("Loaded theme mode: ${themeMode.name}");
    try {
      final pref = await ref.read(sharedPreferencesFutureProvider.future);
      await pref.setString(themeModeKey, themeMode.name);
      ref.read(themeModeProvider.notifier).update((_) => themeMode);
    } catch (e) {
      logger.e("Failed to set theme mode: $e");
    }
  }

  /// Retrieves the theme mode from SharedPreferences.
  Future<ThemeMode> getTheme() async {
    var themeModeKey = SharedPreferencesKey.themeMode.toString();
    try {
      final pref = await ref.read(sharedPreferencesFutureProvider.future);
      final mode = pref.getString(themeModeKey);
      logger.i("Retrieved theme mode: $mode");
      return ThemeMode.values.firstWhere(
        (value) => value.name == mode,
        orElse: () => ThemeMode.system,
      );
    } catch (e) {
      logger.e("Failed to get theme mode: $e");
      return ThemeMode.system;
    }
  }
}

/// A provider for the [ThemeModeRepository].
final themeModeRepositoryProvider =
    Provider<ThemeModeRepository>((ref) => ThemeModeRepository(ref: ref));
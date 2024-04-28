import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/services/shared_preferences/shared_preferences_keys.dart';
import 'package:octattoo_app/core/services/shared_preferences/shared_preferences_provider.dart';
import 'package:octattoo_app/core/theme/theme_mode_provider.dart';
import 'package:octattoo_app/core/utils/logger.dart';

class ThemeModeRepository {
  ThemeModeRepository({required this.ref});
  final Ref ref;

  Future<void> setTheme(ThemeMode themeMode) async {
    var themeModeKey = SharedPreferencesKey.themeMode.toString();
    logger.d("Loaded theme mode: ${themeMode.name}");
    final pref = await ref.read(sharedPreferencesFutureProvider.future);
    await pref.setString(themeModeKey, themeMode.name);
    ref.read(themeModeProvider.notifier).update((_) => themeMode);
  }

  Future<ThemeMode> getTheme() async {
    final pref = await ref.read(sharedPreferencesFutureProvider.future);
    var themeModeKey = SharedPreferencesKey.themeMode.toString();
    final mode = pref.getString(themeModeKey);
    logger.i("Retrieved theme mode: $mode");
    return ThemeMode.values.firstWhere(
      (value) => value.name == mode,
      orElse: () => ThemeMode.system,
    );
  }
}

final themeModeRepositoryProvider =
    Provider<ThemeModeRepository>((ref) => ThemeModeRepository(ref: ref));
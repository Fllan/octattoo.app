import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/theme/theme_mode_provider.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeRepository {
  ThemeModeRepository({required this.ref});
  final Ref ref;

  static const String themeModeKey = "theme_mode";

  Future<void> setTheme(ThemeMode themeMode) async {
    logger.d("Loaded theme mode: ${themeMode.name}");
    final pref = await ref.read(sharedPreferencesProvider.future);
    await pref.setString(themeModeKey, themeMode.name);
    ref.read(themeModeProvider.notifier).update((_) => themeMode);
  }

  Future<ThemeMode> getTheme() async {
    final pref = await ref.read(sharedPreferencesProvider.future);
    final mode = pref.getString(themeModeKey);
    logger.i("Retrieved theme mode: $mode");
    return ThemeMode.values.firstWhere(
      (value) => value.name == mode,
      orElse: () => ThemeMode.system,
    );
  }
}

final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) => SharedPreferences.getInstance());

final themeModeRepositoryProvider =
    Provider<ThemeModeRepository>((ref) => ThemeModeRepository(ref: ref));

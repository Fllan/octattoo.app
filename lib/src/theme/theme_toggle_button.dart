import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/theme/theme_mode_provider.dart';
import 'package:octattoo_app/src/theme/theme_mode_repository.dart';

class ThemeModeToggleButton extends ConsumerWidget {
  const ThemeModeToggleButton(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    return IconButton(
        icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
        onPressed: () async {
          final newThemeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
          ref.read(themeModeProvider.notifier).state = newThemeMode;
          await ref.read(themeModeRepositoryProvider).setTheme(newThemeMode);
        });
  }
}
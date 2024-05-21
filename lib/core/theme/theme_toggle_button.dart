import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/theme/theme_mode_provider.dart';
import 'package:octattoo_app/core/theme/theme_mode_repository.dart';
import 'package:octattoo_app/core/utils/logger.dart';

/// `ThemeModeToggleButton` is a widget that allows the user to toggle between light and dark theme modes.
class ThemeModeToggleButton extends ConsumerWidget {
  const ThemeModeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    return IconButton(
        icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
        onPressed: () async {
          final newThemeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
          try {
            ref.read(themeModeProvider.notifier).state = newThemeMode;
            await ref.read(themeModeRepositoryProvider).setTheme(newThemeMode);
          } catch (e) {
            // Handle or log the error here
            logger.e('Failed to set theme: $e');
          }
        });
  }
}
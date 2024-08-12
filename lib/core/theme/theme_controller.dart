import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/theme_methods.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  ThemeMode _themeMode = ThemeMode.system;
  ColorSelectionMethod _colorSelectionMethod = ColorSelectionMethod.colorSeed;
  ColorSeed _colorSelected = ColorSeed.baseColor;
  ColorScheme? _imageColorScheme;

  @override
  ThemeData build() {
    return _buildTheme();
  }

  ThemeData _buildTheme({Color? seedColor, Brightness? brightness}) {
    final plateformBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.light
            ? Brightness.light
            : Brightness.dark;
    return ThemeData(
      colorSchemeSeed: seedColor,
      brightness: brightness ?? plateformBrightness,
      useMaterial3: true,
    );
  }

  void toggleBrightness() {
    if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }
    _updateTheme();
  }

  void selectColorSeed(ColorSeed colorSeed) {
    _colorSelectionMethod = ColorSelectionMethod.colorSeed;
    _colorSelected = colorSeed;
    _updateTheme();
  }

  Future<void> selectImage(ColorImage colorImage) async {
    _colorSelectionMethod = ColorSelectionMethod.image;
    final newScheme = await ColorScheme.fromImageProvider(
      provider: NetworkImage(colorImage.url),
    );
    _imageColorScheme = newScheme;
    _updateTheme();
  }

  void _updateTheme() {
    final actualThemeMode =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.light
            ? ThemeMode.light
            : ThemeMode.dark;
    final brightness =
        _themeMode == actualThemeMode ? Brightness.light : Brightness.dark;
    final seedColor = _colorSelectionMethod == ColorSelectionMethod.colorSeed
        ? _colorSelected.color
        : _imageColorScheme?.primary;

    state = _buildTheme(seedColor: seedColor, brightness: brightness);
  }
}

import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/theme/theme_controller.dart';

/// InheritedWidget to provide ThemeController throughout the app
class ThemeProvider extends InheritedWidget {
  const ThemeProvider({
    super.key,
    required this.controller,
    required super.child,
  });

  final ThemeController controller;

  static ThemeController of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<ThemeProvider>();
    assert(provider != null, 'No ThemeProvider found in context');
    return provider!.controller;
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return controller != oldWidget.controller;
  }
}

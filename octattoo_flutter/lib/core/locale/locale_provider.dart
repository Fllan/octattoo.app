import 'package:flutter/material.dart';
import 'locale_controller.dart';

/// InheritedWidget to provide LocaleController throughout the app
class LocaleProvider extends InheritedWidget {
  const LocaleProvider({
    super.key,
    required this.controller,
    required super.child,
  });

  final LocaleController controller;

  static LocaleController of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<LocaleProvider>();
    assert(provider != null, 'No LocaleProvider found in context');
    return provider!.controller;
  }

  @override
  bool updateShouldNotify(LocaleProvider oldWidget) {
    return controller != oldWidget.controller;
  }
}

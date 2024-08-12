import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_controller.g.dart';

@riverpod
class LanguageController extends _$LanguageController {
  Locale? _locale;

  @override
  Locale build() {
    return _buildLocale();
  }

  Locale _buildLocale() {
    return _locale ?? const Locale('en');
  }

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    state = _buildLocale(); // Notify listeners
  }
}

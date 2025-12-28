import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/locale/locale_repository.dart';

/// Manages locale state and business logic
/// Uses ValueNotifier for reactive updates without external packages
class LocaleController {
  LocaleController(this._repository)
    : _locale = ValueNotifier(const Locale('en'));

  final LocaleRepository _repository;
  final ValueNotifier<Locale> _locale;

  /// Current locale
  Locale get current => _locale.value;

  /// Listenable for reactive updates
  ValueListenable<Locale> get listenable => _locale;

  /// Initialize: load saved locale from storage
  Future<void> initialize() async {
    _locale.value = await _repository.loadLocale();
  }

  /// Set specific locale
  Future<void> setLocale(Locale locale) async {
    _locale.value = locale;
    await _repository.saveLocale(locale);
  }

  void dispose() {
    _locale.dispose();
  }
}

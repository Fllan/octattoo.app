import 'package:flutter/material.dart';
import 'locale_repository.dart';

/// In-memory locale storage
/// Locale persists only during app session
/// Use this until you implement backend storage
class MemoryLocaleRepository implements LocaleRepository {
  Locale _cachedLocale = const Locale('en');

  @override
  Future<Locale> loadLocale() async {
    return _cachedLocale;
  }

  @override
  Future<void> saveLocale(Locale locale) async {
    _cachedLocale = locale;
  }
}

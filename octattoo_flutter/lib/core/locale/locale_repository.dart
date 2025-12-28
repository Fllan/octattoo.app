import 'package:flutter/material.dart';

/// Abstract repository for locale persistence
/// This interface allows you to swap implementations (local → backend)
abstract class LocaleRepository {
  Future<Locale> loadLocale();
  Future<void> saveLocale(Locale locale);
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Language {
  english(flag: '🇺🇸', name: 'English', code: 'en'),
  french(flag: '🇫🇷', name: 'Français', code: 'fr');

  const Language({required this.flag, required this.name, required this.code});

  final String flag;
  final String name;
  final String code;

  static Language fromCode(String code) {
    return Language.values.firstWhere((language) => language.code == code,
        orElse: () => Language.english);
  }
}

final languageProvider = StateProvider<Language>((ref) {
  final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale.languageCode;
  return Language.fromCode(deviceLocale);
});

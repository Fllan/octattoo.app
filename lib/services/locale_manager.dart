import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleManager extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale newLocale) {
    if (newLocale != _locale) {
      _locale = newLocale;
      notifyListeners();
    }
  }

  // void setLocaleBasedOnDeviceLanguage(BuildContext context) {
  //   Locale deviceLocale = Localizations.localeOf(context);
  //   if (AppLocalizations.supportedLocales.contains(deviceLocale)) {
  //     setLocale(deviceLocale);
  //   } else {
  //     setLocale(const Locale('en'));
  //   }
  // }

  Future<void> initializeLocale() async {
    Locale deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    if (AppLocalizations.supportedLocales.contains(deviceLocale)) {
      setLocale(deviceLocale);
    }
  }
}
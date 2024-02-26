import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _AppState? state = context.findAncestorStateOfType<_AppState>();
    state?.setLocale(newLocale);
  }
}

class _AppState extends State<App> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    setLocaleBasedOnDeviceLanguage();
  }

  void setLocaleBasedOnDeviceLanguage() {
    Locale deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    if (AppLocalizations.supportedLocales.contains(deviceLocale)) {
      setLocale(deviceLocale);
    } else {
      setLocale(const Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if appLoc can be retrieved before accessing properties
    return MaterialApp(
      title: 'octattoo.app',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!
                    .helloWorld, // localized "helloWorld"
              ),
            ),
            body: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!
                      .helloWorld, // localized "helloWorld"
                ),
                Text(
                  Localizations.localeOf(context)
                      .languageCode, // device language code
                ),
                Text(
                  _locale?.languageCode ?? 'No locale set', // app language code
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

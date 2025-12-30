import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/router/router.dart';
import 'package:octattoo_flutter/core/settings/app_settings_provider.dart';
import 'package:octattoo_flutter/core/theme/theme_data.dart';
import 'package:octattoo_flutter/l10n/app_localizations.dart';

class OctattooApp extends StatelessWidget {
  const OctattooApp({super.key});

  @override
  Widget build(BuildContext context) {
    // InheritedNotifier automatically rebuilds when settings change
    final settings = AppSettingsProvider.of(context);

    // Use extracted color schemes, fallback to defaults if not yet loaded
    final lightScheme = settings.lightColorScheme;
    final darkScheme = settings.darkColorScheme;

    return MaterialApp.router(
      title: 'octattoo.app',
      theme: lightScheme != null
          ? AppThemeData.fromColorScheme(lightScheme)
          : AppThemeData.defaultLight,
      darkTheme: darkScheme != null
          ? AppThemeData.fromColorScheme(darkScheme)
          : AppThemeData.defaultDark,
      themeMode: settings.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: settings.locale,
      routerConfig: router,
    );
  }
}

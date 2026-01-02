import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/router/router.dart';
import 'package:octattoo_flutter/core/settings/app_settings_provider.dart';
import 'package:octattoo_flutter/core/theme/theme_data.dart';
import 'package:octattoo_flutter/l10n/app_localizations.dart';

class OctattooApp extends StatelessWidget {
  const OctattooApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use read() to access settings without creating rebuild dependency
    // The MaterialApp will be rebuilt when ListenableBuilder detects changes
    final settings = AppSettingsProvider.read(context);

    // Use ListenableBuilder for granular control over rebuilds
    // Only rebuilds when settings actually change
    return ListenableBuilder(
      listenable: settings,
      builder: (context, _) {
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
      },
    );
  }
}

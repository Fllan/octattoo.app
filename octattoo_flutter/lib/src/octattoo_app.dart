import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/locale/locale_controller.dart';
import 'package:octattoo_flutter/core/locale/locale_provider.dart';
import 'package:octattoo_flutter/core/router/router.dart';
import 'package:octattoo_flutter/core/theme/theme_controller.dart';
import 'package:octattoo_flutter/core/theme/theme_data.dart';
import 'package:octattoo_flutter/core/theme/theme_provider.dart';
import 'package:octattoo_flutter/l10n/app_localizations.dart';

class OctattooApp extends StatelessWidget {
  const OctattooApp({
    super.key,
    required this.themeController,
    required this.localeController,
  });

  final ThemeController themeController;
  final LocaleController localeController;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      controller: themeController,
      child: LocaleProvider(
        controller: localeController,
        child: ValueListenableBuilder<ThemeMode>(
          valueListenable: themeController.listenable,
          builder: (context, themeMode, _) {
            return ValueListenableBuilder<Locale>(
              valueListenable: localeController.listenable,
              builder: (context, locale, _) {
                return MaterialApp.router(
                  title: 'octattoo.app',
                  theme: AppThemeData.light,
                  darkTheme: AppThemeData.dark,
                  themeMode: themeMode,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  locale: locale,
                  routerConfig: router,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

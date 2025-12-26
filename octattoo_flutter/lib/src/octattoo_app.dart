import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/router/router.dart';
import 'package:octattoo_flutter/l10n/app_localizations.dart';

class OctattooApp extends StatelessWidget {
  const OctattooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'octattoo.app',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('en'),
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: router,
    );
  }
}

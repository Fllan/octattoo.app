import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/localization/language_controller.dart';
import 'package:octattoo_app/core/router/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:octattoo_app/core/theme/theme_controller.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeControllerProvider);
    final goRouter = ref.watch(goRouterProvider);
    final locale = ref.watch(languageControllerProvider);

    return MaterialApp.router(
      theme: themeData,
      darkTheme: themeData,
      themeMode: themeData.brightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light,
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
    );
  }
}

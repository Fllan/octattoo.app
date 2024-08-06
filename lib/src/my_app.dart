import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/router/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';

/// The main application widget.
///
/// This class is responsible for setting up the main configurations of the Flutter app, including routing and localization:
///
/// 1. **ConsumerWidget**: This widget listens to changes in the Riverpod providers.
/// 2. **Routing**: Uses Riverpod to watch the `goRouterProvider` and set up routing for the application.
/// 3. **Localization**: Configures localization for the app, including title and supported locales.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.loc.appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

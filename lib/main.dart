import 'package:flutter/material.dart';
import 'package:octattoo_app/presentation/providers/theme_mode_provider.dart';
import 'presentation/widgets/loading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:octattoo_app/presentation/providers/locale_manager_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:octattoo_app/router/app_router.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: AppInitializer()));
}

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
              home: Scaffold(
                  body: Center(child: Text(AppLocalizations.of(context)!.appInitError),),),);
        }
        // Show a loading screen while waiting for initialization to complete
        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(home: LoadingScreen());
        }
        // Once complete, return the actual app
        return const App();
      },
    );
  }
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Include any other initializations here.
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    final localeManager = ref.watch(localeManagerProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      locale: localeManager.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}


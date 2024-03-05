import 'package:flutter/material.dart';
import 'package:octattoo_app/home/home.dart';
import 'package:octattoo_app/loading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:octattoo_app/providers/locale_manager_provider.dart';
import 'package:octattoo_app/services/locale_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager().initializeLocale();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  late final Future<FirebaseApp> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Widget build(BuildContext context) {
    final localeManager = ref.watch(localeManagerProvider);
    
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Error initializing Firebase'),
              ),
            ),
          );
        }

        // Show a loading screen while waiting for initialization to complete
        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(home: LoadingScreen());
        }

        // Once complete, show your application
        return MaterialApp(
          home: const HomeScreen(),
          locale: localeManager.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}

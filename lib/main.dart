import 'package:flutter/material.dart';
import 'package:octattoo_app/home/home.dart';
import 'package:octattoo_app/loading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:octattoo_app/services/locale_manager.dart'; // Import LocaleManager
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleManager localeManager = LocaleManager();
  await localeManager.initializeLocale();
  runApp(
    ChangeNotifierProvider<LocaleManager>(
      create: (context) => LocaleManager(),
      child: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
    final localeManager = Provider.of<LocaleManager>(context);
    
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
          locale: localeManager.locale, // Use LocaleManager's locale
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}

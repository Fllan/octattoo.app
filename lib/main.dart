import 'package:flutter/material.dart';
import 'package:octattoo_app/src/features/language/data/language_repository.dart';
import 'package:octattoo_app/src/features/language/language.dart';
import 'package:octattoo_app/src/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:octattoo_app/src/theme/theme_mode_provider.dart';
import 'package:octattoo_app/src/theme/theme_mode_repository.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  final container = ProviderContainer();
  final language =
    await container.read(languageRepositoryProvider).getLanguage();
   final themeMode = 
    await container.read(themeModeRepositoryProvider).getTheme();
  runApp(ProviderScope(
    overrides: [
      languageProvider.overrideWith((ref) => language),
      themeModeProvider.overrideWith((ref) => themeMode),
    ],
    child: const MyApp()));
}
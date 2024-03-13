import 'package:flutter/material.dart';
import 'package:octattoo_app/features/language/data/language_repository.dart';
import 'package:octattoo_app/features/language/language.dart';
import 'package:octattoo_app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  final container = ProviderContainer();
  final language =
    await container.read(languageRepositoryProvider).getLanguage();
  runApp(ProviderScope(
    overrides: [languageProvider.overrideWith((ref) => language)],
    child: const MyApp()));
}
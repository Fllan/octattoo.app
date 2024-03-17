import 'package:firebase_app_check/firebase_app_check.dart';
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
  await FirebaseAppCheck.instance.activate(
    // You can also use a `ReCaptchaEnterpriseProvider` provider instance as an
    // argument for `webProvider`
    webProvider: ReCaptchaEnterpriseProvider('6Le5s5spAAAAAK7Im4Z7HS_isrWt_R2lf5M6mVLt'),
    // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Safety Net provider
    // 3. Play Integrity provider
    androidProvider: AndroidProvider.debug,
    // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
        // your preferred provider. Choose from:
        // 1. Debug provider
        // 2. Device Check provider
        // 3. App Attest provider
        // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
    appleProvider: AppleProvider.appAttest,
  );

  
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
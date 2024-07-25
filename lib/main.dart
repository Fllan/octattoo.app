import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:octattoo_app_mvp/core/utils/utils_initializer.dart';
import 'package:octattoo_app_mvp/firebase_options.dart';
import 'package:octattoo_app_mvp/src/my_app.dart';

/// The main entry point of the application.
///
/// This function sets up necessary configurations and initializes services before running the app:
///
/// 1. **Enable debug zone errors are fatal**: Ensures that errors in the debug zone will terminate the application, useful for catching issues early during development.
/// 2. **Initialize WidgetsBinding**: Necessary for interacting with the Flutter framework before calling runApp.
/// 3. **Initialize utility classes and services**: This method initializes various utilities used throughout the app, ensuring they are ready before the app starts.
/// 4. **Initialize Firebase**: Initializes Firebase with platform-specific options. This is required for any Firebase-related functionality in the app.
/// 5. **Run the application**: Uses `ProviderScope` from Riverpod to provide dependency injection throughout the app.
Future<void> main() async {
  /// Enable debug zone errors are fatal
  BindingBase.debugZoneErrorsAreFatal = true;

  /// Initialize WidgetsBinding
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Utils
  UtilsInitializer.initializeAllUtils();

  /// Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  logger.i('Firebase Initialized Successfully!');

  /// Run the app
  runApp(const ProviderScope(child: MyApp()));
}

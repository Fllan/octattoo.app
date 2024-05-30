import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/services/Firebase/Initialization/initialize_crashlytics.dart';
import 'package:octattoo_app_mvp/core/services/Firebase/Initialization/initialize_analytics.dart';
import 'package:octattoo_app_mvp/core/services/Firebase/Initialization/initialize_app_check.dart';
import 'package:octattoo_app_mvp/core/services/Firebase/Initialization/initialize_firebase.dart';
import 'package:octattoo_app_mvp/core/utils/dotenv.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';
import 'package:octattoo_app_mvp/src/my_app.dart';

Future<void> main() async {
  
  /// Initialize WidgetsBinding
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Logger
  LoggerInitializer.setupLogger();

  /// Initialize Dotenv
  await DotenvInitializer.loadEnv();

  /// Initialize Firebase
  await FirebaseInitializer.initializeFirebase();

  /// Initialize Firebase App Check
  await AppCheckInitializer.initializeAppCheck();

  /// Initialize Firebase Analytics
  AnalyticsInitializer.initializeAnalytics();

  /// Initialize Crashlytics
  CrashlyticsInitializer.initializeCrashlytics();

  runApp(const ProviderScope(child: MyApp()));
}

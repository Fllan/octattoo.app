import 'package:octattoo_app_mvp/core/services/firebase/initialization/initialize_analytics.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/initialize_app_check.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/initialize_crashlytics.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/initialize_firebase.dart';
import 'package:octattoo_app_mvp/core/utils/dotenv.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';

class ServiceInitializer {
  static Future<void> initializeAllServices() async {
    logger.i('Initializing Services...');

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

    logger.i('All Services Initialized Successfully!');
  }
}

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';

class CrashlyticsInitializer {
  static void initializeCrashlytics() async {
    try {
      FlutterError.onError = (errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };
      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
      logger.d('Firebase Crashlytics initialized successfully');
    } catch (e) {
      logger.e('Failed to initialize Firebase Crashlytics: $e');
    }
  }
}

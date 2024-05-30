import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';

/// Initialize Firebase App Check
class AppCheckInitializer {
  static Future<void> initializeAppCheck() async {
    try {
      await FirebaseAppCheck.instance.activate(
        webProvider: ReCaptchaEnterpriseProvider(dotenv.env['RECAPTHA_KEY_WEB']!),
        androidProvider: AndroidProvider.debug,
        appleProvider: AppleProvider.appAttest,
      );
      logger.i('Firebase App Check initialized successfully');
    } catch (e) {
      logger.e('Failed to initialize Firebase App Check: $e');
    }
  }
}

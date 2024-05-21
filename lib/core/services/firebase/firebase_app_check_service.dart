import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:octattoo_app/core/utils/logger.dart';

/// A service class to activate Firebase App Check.
class FirebaseAppCheckService {

  /// Activates Firebase App Check.
  /// This method should be called at the start of the application.
  Future<void> activateAppCheck() async {
    try {
      await FirebaseAppCheck.instance.activate(
        webProvider: ReCaptchaEnterpriseProvider(dotenv.env['RECAPTCHA_KEY']!),
        androidProvider: AndroidProvider.debug,
        appleProvider: AppleProvider.appAttest,
      );
      logger.i("Firebase App Check service activated successfully.");
    } catch (e) {
      logger.e("Firebase App Check service activation failed", error: e);
      rethrow;
    }
  }
}
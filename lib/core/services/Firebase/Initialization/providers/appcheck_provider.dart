import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appcheck_provider.g.dart';

/// Provides an instance of [FirebaseAppCheck] and handles its initialization.
///
/// This provider ensures that Firebase App Check is properly initialized and available for
/// use throughout the application. It checks for platform compatibility and uses appropriate
/// providers for web, Android, and Apple platforms.
///
/// ### Key Components:
/// - **Platform Check**: Ensures Firebase App Check is not initialized on unsupported platforms (e.g., Windows).
/// - **Initialization**: Activates Firebase App Check with the correct provider based on the platform.
/// - **Error Handling**: Catches and logs any errors that occur during initialization.
@Riverpod(keepAlive: true)
Future<FirebaseAppCheck> firebaseAppCheck(FirebaseAppCheckRef ref) async {
  try {
    if (kIsWeb == false && defaultTargetPlatform == TargetPlatform.windows) {
      var error = 'Firebase App Check is not supported on Windows platform';
      logger.d(error);
      throw UnsupportedError(error);
    }
    final appCheck = FirebaseAppCheck.instance;
    await appCheck.activate(
      webProvider: ReCaptchaEnterpriseProvider(dotenv.env['RECAPTHA_KEY_WEB']!),
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.appAttest,
    );
    logger.d('Firebase App Check initialized successfully');
    return appCheck;
  } catch (e) {
    logger.e('Failed to initialize Firebase App Check: $e');
    rethrow;
  }
}

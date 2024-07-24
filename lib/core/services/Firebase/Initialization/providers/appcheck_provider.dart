import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/firebase_provider.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appcheck_provider.g.dart';

@Riverpod(keepAlive: true)
Future<FirebaseAppCheck> firebaseAppCheck(FirebaseAppCheckRef ref) async {
  try {
    if (kIsWeb == false && defaultTargetPlatform == TargetPlatform.windows) {
      logger.d('Firebase App Check is not supported on Windows platform');
      throw UnsupportedError(
          'Firebase App Check is not supported on Windows platform');
    }
    final app = ref.watch(firebaseAppProvider).valueOrNull!;
    final appCheck = FirebaseAppCheck.instanceFor(app: app);
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

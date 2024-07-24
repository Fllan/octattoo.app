// lib/core/services/firebase/initialization/providers/appcheck_provider.dart
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/firebase_provider.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appcheck_provider.g.dart';

@Riverpod(keepAlive: true)
Future<FirebaseAppCheck> firebaseAppCheck(FirebaseAppCheckRef ref) async {
  try {
    if (defaultTargetPlatform == TargetPlatform.windows) {
      logger.d('Firebase App Check is not supported on Windows platform');
      throw UnsupportedError(
          'Firebase App Check is not supported on Windows platform');
    }

    final appAsyncValue = ref.watch(firebaseAppProvider);

    return appAsyncValue.when(
      data: (app) async {
        final appCheck = FirebaseAppCheck.instanceFor(app: app);
        await appCheck.activate(
          webProvider:
              ReCaptchaEnterpriseProvider(dotenv.env['RECAPTHA_KEY_WEB']!),
          androidProvider: AndroidProvider.debug,
          appleProvider: AppleProvider.appAttest,
        );
        logger.d('Firebase App Check initialized successfully');
        return appCheck;
      },
      loading: () => throw Exception('Firebase App is still loading'),
      error: (e, stack) =>
          throw Exception('Failed to initialize Firebase App: $e'),
    );
  } catch (e) {
    logger.e('Failed to initialize Firebase App Check: $e');
    rethrow;
  }
}

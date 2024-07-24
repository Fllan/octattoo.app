import 'package:firebase_core/firebase_core.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:octattoo_app_mvp/firebase_options.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_provider.g.dart';

@Riverpod(keepAlive: true)
Future<FirebaseApp> firebaseApp(FirebaseAppRef ref) async {
  try {
    final firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    logger.d('Firebase initialized successfully');
    return firebaseApp;
  } catch (e) {
    logger.e('Failed to initialize Firebase: $e');
    rethrow;
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';
import 'package:octattoo_app_mvp/firebase_options.dart';

/// Initialize Firebase
class FirebaseInitializer {
  static Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      logger.i('Firebase initialized successfully');
    } catch (e) {
      logger.e('Failed to initialize Firebase: $e');
    }
  }
}

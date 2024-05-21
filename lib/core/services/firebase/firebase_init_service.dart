import 'package:firebase_core/firebase_core.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/firebase_options.dart';

/// A service that handles Firebase initialization.
class FirebaseInitService {
  /// Initializes Firebase.
  ///
  /// This method will attempt to initialize Firebase with platform-specific options. If the initialization
  /// completes successfully, this method will log a success message.
  ///
  /// If any error occurs during the initialization, this method will log the error and rethrow the exception.
  Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      logger.i("Firebase initialized successfully for plateform : ${DefaultFirebaseOptions.currentPlatform}");
    } catch (e) {
      logger.e("Firebase initialization failed", error: e);
      rethrow;
    }
  }
}
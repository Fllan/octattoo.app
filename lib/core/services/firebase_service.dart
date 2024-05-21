import 'package:octattoo_app/core/services/firebase/firebase_app_check_service.dart';
import 'package:octattoo_app/core/services/firebase/firebase_init_service.dart';
import 'package:octattoo_app/core/utils/logger.dart';

/// A service class to initialize all Firebase services.
class FirebaseService {
  // Singleton instances of Firebase services
  static final FirebaseInitService _firebaseInitService = FirebaseInitService();
  static final FirebaseAppCheckService _firebaseAppCheckService = FirebaseAppCheckService();

  /// Initializes all Firebase services.
  /// This method should be called at the start of the application.
  static Future<void> initializeAll() async {
    try {
      // Initialize Firebase
      await _firebaseInitService.initializeFirebase();

      // Activate Firebase App Check
      await _firebaseAppCheckService.activateAppCheck();
    } catch (e) {
      logger.e('Error initializing Firebase: $e');
      rethrow;
    }
  }
  // Any other Firebase related initializations go here
}
import 'package:firebase_core/firebase_core.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/firebase_options.dart';

class FirebaseInitService {
  static Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      logger.i("Firebase initialized successfully.");
    } catch (e) {
      logger.e("Firebase initialization failed", error: e);
      rethrow;
    }
  }
}

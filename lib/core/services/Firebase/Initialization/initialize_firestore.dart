import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';

/// Initialize Firestore
class FirestoreInitializer {
  static Future<void> initializeFirestore() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore.settings = const Settings(persistenceEnabled: true);
      logger.d('Firestore initialized with cache enabled successfully');
    } catch (e) {
      logger.e('Failed to initialize Firestore with cache enabled: $e');
    }
  }
}

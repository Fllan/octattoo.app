import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';

class AnalyticsInitializer {
  static void initializeAnalytics() {
    try {
      FirebaseAnalytics.instance;
      logger.i('Firebase Analytics initialized successfully');
    } catch (e) {
      logger.e('Failed to initialize Firebase Analytics: $e');
    }
  }
}

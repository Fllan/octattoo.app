import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_provider.g.dart';

/// Provides an instance of [FirebaseAnalytics] and handles its initialization.
///
/// This provider ensures that Firebase Analytics is properly initialized and available for
/// use throughout the application. It logs the initialization status and handles any
/// errors that may occur during the process.
///
/// ### Key Components:
/// - **Initialization**: Attempts to initialize Firebase Analytics and logs the result.
/// - **Error Handling**: Catches and logs any errors that occur during initialization.
@Riverpod(keepAlive: true)
FirebaseAnalytics firebaseAnalytics(FirebaseAnalyticsRef ref) {
  try {
    final analytics = FirebaseAnalytics.instance;
    logger.d('Firebase Analytics initialized successfully');
    return analytics;
  } catch (e) {
    logger.e('Failed to initialize Firebase Analytics: $e');
    rethrow;
  }
}

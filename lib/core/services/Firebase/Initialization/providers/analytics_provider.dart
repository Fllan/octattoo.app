import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_provider.g.dart';

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

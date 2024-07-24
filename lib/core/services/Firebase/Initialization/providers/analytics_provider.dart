import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/firebase_provider.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_provider.g.dart';

@Riverpod(keepAlive: true)
Future<FirebaseAnalytics> firebaseAnalytics(FirebaseAnalyticsRef ref) async {
  final appAsyncValue = ref.watch(firebaseAppProvider);

  return appAsyncValue.when(
    data: (app) {
      try {
        final analytics = FirebaseAnalytics.instanceFor(app: app);
        logger.d('Firebase Analytics initialized successfully');
        return analytics;
      } catch (e) {
        logger.e('Failed to initialize Firebase Analytics: $e');
        rethrow;
      }
    },
    loading: () => throw Exception('Firebase App is still loading'),
    error: (e, stack) =>
        throw Exception('Failed to initialize Firebase App: $e'),
  );
}

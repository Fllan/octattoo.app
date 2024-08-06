import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/analytics_provider.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/appcheck_provider.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/authentication_provider.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/firestore_provider.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup_provider.g.dart';

/// Handles the application's startup process by initializing necessary services and providers.
///
/// This provider is responsible for initializing and managing the lifecycle of various Firebase services
/// and other essential providers. It ensures that all required services are ready before the application
/// starts.
///
/// - **Disposal**: Invalidates all dependent providers upon disposal to clean up resources.
/// - **Initialization**: Asynchronously initializes Firebase App Check, Shared Preferences, Analytics,
/// Authentication, and Firestore providers.
@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    // Ensure we invalidate all the providers we depend on
    ref.invalidate(firebaseAppCheckProvider);
    ref.invalidate(sharedPreferencesProvider);
    ref.invalidate(firebaseAnalyticsProvider);
    ref.invalidate(firebaseAuthProvider);
    ref.invalidate(firebaseFirestoreProvider);
  });

  // All asynchronous app initialization code should belong here:
  logger.i('Starting app initialization');
  await ref.watch(firebaseAppCheckProvider.future);
  await ref.watch(sharedPreferencesProvider.future);
  ref.watch(firebaseAnalyticsProvider);
  ref.watch(firebaseAuthProvider);
  ref.watch(firebaseFirestoreProvider);
  logger.i('App startup completed successfully');
}

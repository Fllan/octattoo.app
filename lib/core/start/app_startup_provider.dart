import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/analytics_provider.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/appcheck_provider.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/authentication_provider.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/firestore_provider.dart';
import 'package:octattoo_app_mvp/core/services/sharedPreferences/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    // ensure we invalidate all the providers we depend on
    ref.invalidate(firebaseAppCheckProvider);
    ref.invalidate(sharedPreferencesProvider);
    ref.invalidate(firebaseAnalyticsProvider);
    ref.invalidate(firebaseAuthProvider);
    ref.invalidate(firebaseFirestoreProvider);
  });
  // all asynchronous app initialization code should belong here:
  await ref.watch(firebaseAppCheckProvider.future);
  await ref.watch(sharedPreferencesProvider.future);
  ref.watch(firebaseAnalyticsProvider);
  ref.watch(firebaseAuthProvider);
  ref.watch(firebaseFirestoreProvider);
}

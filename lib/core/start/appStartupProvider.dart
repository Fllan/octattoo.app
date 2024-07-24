import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/analytics_provider.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/appcheck_provider.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/authentication_provider.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/firebase_provider.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/firestore_provider.dart';
import 'package:octattoo_app_mvp/core/services/sharedPreferences/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appStartupProvider.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    // ensure we invalidate all the providers we depend on
    ref.invalidate(firebaseAppProvider);
    ref.invalidate(firebaseAppCheckProvider);
    ref.invalidate(sharedPreferencesProvider);
    ref.invalidate(firebaseAnalyticsProvider);
    ref.invalidate(firebaseAuthProvider);
    ref.invalidate(firebaseFirestoreProvider);
  });
  // all asynchronous app initialization code should belong here:
  await ref.watch(firebaseAppProvider.future);
  await ref.watch(firebaseAppCheckProvider.future);
  await ref.watch(sharedPreferencesProvider.future);
  ref.watch(firebaseAnalyticsProvider);
  ref.watch(firebaseAuthProvider);
  ref.watch(firebaseFirestoreProvider);
}

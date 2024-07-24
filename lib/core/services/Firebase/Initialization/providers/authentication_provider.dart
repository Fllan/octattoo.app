import 'package:firebase_auth/firebase_auth.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/firebase_provider.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  final appAsyncValue = ref.watch(firebaseAppProvider);

  return appAsyncValue.when(
    data: (app) {
      try {
        final auth = FirebaseAuth.instanceFor(app: app);
        logger.d('Firebase Authentication initialized successfully');
        return auth;
      } catch (e) {
        logger.e('Failed to initialize Firebase Authentication: $e');
        rethrow;
      }
    },
    loading: () => throw Exception('Firebase App is still loading'),
    error: (e, stack) =>
        throw Exception('Failed to initialize Firebase App: $e'),
  );
}

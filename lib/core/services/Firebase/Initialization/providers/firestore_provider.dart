// lib/core/services/firebase/initialization/providers/firestore_provider.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/firebase_provider.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  final appAsyncValue = ref.watch(firebaseAppProvider);

  return appAsyncValue.when(
    data: (app) {
      try {
        final firestore = FirebaseFirestore.instanceFor(app: app);
        firestore.settings = const Settings(persistenceEnabled: true);
        logger.d('Firestore initialized with cache enabled successfully');
        return firestore;
      } catch (e) {
        logger.e('Failed to initialize Firestore with cache enabled: $e');
        rethrow;
      }
    },
    loading: () => throw Exception('Firebase App is still loading'),
    error: (e, stack) =>
        throw Exception('Failed to initialize Firebase App: $e'),
  );
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_provider.g.dart';

/// Provides an instance of [FirebaseFirestore] and handles its initialization.
///
/// This provider ensures that Firestore is properly initialized with specific settings,
/// such as enabling persistence for offline data access. It logs the initialization status
/// and handles any errors that may occur during the process.
///
/// ### Key Components:
/// - **Initialization**: Attempts to initialize Firestore with persistence enabled and logs the result.
/// - **Error Handling**: Catches and logs any errors that occur during initialization.
@Riverpod(keepAlive: true)
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  try {
    final firestore = FirebaseFirestore.instance;
    firestore.settings = const Settings(persistenceEnabled: true);
    logger.d('Firestore initialized with cache enabled successfully');
    return firestore;
  } catch (e) {
    logger.e('Failed to initialize Firestore with cache enabled: $e');
    rethrow;
  }
}

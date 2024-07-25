import 'package:firebase_auth/firebase_auth.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

/// Provides an instance of [FirebaseAuth] and handles its initialization.
///
/// This provider ensures that Firebase Authentication is properly initialized and available for
/// use throughout the application. It logs the initialization status and handles any
/// errors that may occur during the process.
///
/// ### Key Components:
/// - **Initialization**: Attempts to initialize Firebase Authentication and logs the result.
/// - **Error Handling**: Catches and logs any errors that occur during initialization.
@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  try {
    final auth = FirebaseAuth.instance;
    logger.d('Firebase Authentication initialized successfully');
    return auth;
  } catch (e) {
    logger.e('Failed to initialize Firebase Authentication: $e');
    rethrow;
  }
}

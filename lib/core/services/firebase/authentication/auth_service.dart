import 'package:firebase_auth/firebase_auth.dart';
import 'package:octattoo_app/core/utils/logger.dart';

/// A service that handles authentication.
class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  /// Signs out the current user.
  ///
  /// This method will attempt to sign out the current user. If the sign out is successful,
  /// it will log a success message. If the sign out fails, it will log an error message
  /// and throw an exception.
  Future<void> signOut() async {
    logger.d("Attempting to sign out");
    try {
      await _auth.signOut();
      logger.d("Sign out successful");
    } catch (e) {
      logger.e('Sign out failed', error: e);
      throw Exception('Sign out failed: $e');
    }
  }

  /// Gets the current user.
  ///
  /// This method will return the current user, or null if no user is signed in.
  User? get currentUser {
    logger.d("Checking current user");
    return _auth.currentUser;
  }

  /// Returns a stream of auth state changes.
  ///
  /// This method will return a stream that emits the current user whenever
  /// the authentication state changes.
  Stream<User?> authStateChanges() => _auth.authStateChanges();
}
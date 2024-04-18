import 'package:firebase_auth/firebase_auth.dart';
import 'package:octattoo_app/core/utils/handle_async_error.dart';
import 'package:octattoo_app/core/utils/logger.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Future<void> signOut() async {
    logger.d("Attempting to sign out");
    await handleAsyncError(
      title: 'Sign out failed',
      operation: () async {
        await _auth.signOut();
        logger.d("Sign out successful");
      }
    );
  }

  User? get currentUser => _auth.currentUser;

  Stream<User?> authStateChanges() => _auth.authStateChanges();
}

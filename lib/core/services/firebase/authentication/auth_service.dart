import 'package:firebase_auth/firebase_auth.dart';
import 'package:octattoo_app/core/utils/handle_async_error.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Future<void> signOut() async {
    await handleAsyncError(
      title: 'Sign out failed',
      operation: () => _auth.signOut(),
    );
  }

  User? get currentUser => _auth.currentUser;

  Stream<User?> authStateChanges() => _auth.authStateChanges();
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:octattoo_app/core/utils/handle_async_error.dart';

class EmailAuthService {
  final FirebaseAuth _auth;

  EmailAuthService(this._auth);

  Future<void> signUpWithEmail(
      String errorTitle, String email, String password) async {
    await handleAsyncError(
        title: errorTitle,
        operation: () => _auth.createUserWithEmailAndPassword(
            email: email, password: password));
  }

  Future<void> signInWithEmail(
      String errorTitle, String email, String password) async {
    await handleAsyncError(
        title: errorTitle,
        operation: () =>
            _auth.signInWithEmailAndPassword(email: email, password: password));
  }

  Future<void> sendPasswordResetEmail(
      String errorTitle, String email, String password) async {
    await handleAsyncError(
        title: errorTitle,
        operation: () =>
            _auth.sendPasswordResetEmail(email: email));
  }
}

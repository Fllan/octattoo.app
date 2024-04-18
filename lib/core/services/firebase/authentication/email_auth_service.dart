import 'package:firebase_auth/firebase_auth.dart';
import 'package:octattoo_app/core/utils/handle_async_error.dart';
import 'package:octattoo_app/core/utils/logger.dart';

class EmailAuthService {
  final FirebaseAuth _auth;

  EmailAuthService(this._auth);

  Future<void> signUpWithEmail(
      String errorTitle, String email, String password) async {
    logger.d("Attempting to sign up with email");
    await handleAsyncError(
        title: errorTitle,
        operation: () async {
          _auth.createUserWithEmailAndPassword(email: email, password: password);
          logger.d("Sign up with email successful");
        }
    );
  }

  Future<void> signInWithEmail(
      String errorTitle, String email, String password) async {
    logger.d("Attempting to sign in with email");
    await handleAsyncError(
        title: errorTitle,
        operation: () async {
          _auth.signInWithEmailAndPassword(email: email, password: password);
          logger.d("Sign in with email successful");
        }
    );
  }

  Future<void> sendPasswordResetEmail(
      String errorTitle, String email, String password) async {
    logger.d("Attempting to send password reset email");
    await handleAsyncError(
        title: errorTitle,
        operation: () async {
          _auth.sendPasswordResetEmail(email: email);
          logger.d("Send password reset email successful");
        }
    );
  }
}

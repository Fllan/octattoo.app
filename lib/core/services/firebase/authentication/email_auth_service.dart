import 'package:firebase_auth/firebase_auth.dart';
import 'package:octattoo_app/core/utils/logger.dart';

/// A service that handles email authentication.
class EmailAuthService {
  final FirebaseAuth _auth;

  EmailAuthService(this._auth);

  /// Signs up a new user with the provided email and password.
  ///
  /// This method will attempt to sign up a new user with the provided email and password.
  /// If the sign up is successful, it will log a success message. If the sign up fails,
  /// it will log an error message and throw an exception.
  Future<void> signUpWithEmail(
      String errorTitle, String email, String password) async {
    logger.d("Attempting to sign up with email");
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      logger.d("Sign up with email successful");
    } catch (e) {
      logger.e('Sign up with email failed', error: e);
      throw Exception('Sign up with email failed: $e');
    }
  }

  /// Signs in a user with the provided email and password.
  ///
  /// This method will attempt to sign in a user with the provided email and password.
  /// If the sign in is successful, it will log a success message. If the sign in fails,
  /// it will log an error message and throw an exception.
  Future<void> signInWithEmail(
      String errorTitle, String email, String password) async {
    logger.d("Attempting to sign in with email");
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      logger.d("Sign in with email successful");
    } catch (e) {
      logger.e('Sign in with email failed', error: e);
      throw Exception('Sign in with email failed: $e');
    }
  }

  /// Sends a password reset email to the provided email address.
  ///
  /// This method will attempt to send a password reset email to the provided email address.
  /// If the operation is successful, it will log a success message. If the operation fails,
  /// it will log an error message and throw an exception.
  Future<void> sendPasswordResetEmail(
      String errorTitle, String email) async {
    logger.d("Attempting to send password reset email");
    try {
      await _auth.sendPasswordResetEmail(email: email);
      logger.d("Send password reset email successful");
    } catch (e) {
      logger.e('Send password reset email failed', error: e);
      throw Exception('Send password reset email failed: $e');
    }
  }
}
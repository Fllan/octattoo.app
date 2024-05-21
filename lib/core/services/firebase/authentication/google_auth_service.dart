import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:octattoo_app/core/utils/logger.dart';

/// A service that handles Google authentication.
class GoogleAuthService {
  final FirebaseAuth _auth;

  /// Creates a new instance of [GoogleAuthService].
  ///
  /// Takes a [FirebaseAuth] instance as a parameter.
  GoogleAuthService(this._auth);

  /// Signs in a user with Google.
  ///
  /// This method will attempt to sign in a user with Google. If the user cancels the sign-in process,
  /// or if any error occurs during the sign-in process, this method will log the error and rethrow the exception.
  ///
  /// If the sign-in process completes successfully, this method will log a success message.
  Future<void> signInWithGoogle() async {
    try {
      logger.d("Attempting to sign in with Google");

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // If the user cancels the sign-in process, return early.
      if (googleUser == null) return;

      GoogleSignInAuthentication? googleAuth;
      try {
        googleAuth = await googleUser.authentication;
      } catch (e) {
        logger.e('Failed to get Google authentication', error: e);
        rethrow;
      }

      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(authCredential);
      logger.d("Sign in with Google successful");
    } catch (e) {
      logger.e('Google Sign-in failed', error: e);
      rethrow;
    }
  }
}
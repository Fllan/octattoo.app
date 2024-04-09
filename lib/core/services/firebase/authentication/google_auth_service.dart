import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:octattoo_app/core/utils/handle_async_error.dart';

class GoogleAuthService {
  final FirebaseAuth _auth;

  GoogleAuthService(this._auth);

  Future<void> signInWithGoogle() async {
    await handleAsyncError(
      title: 'Google Sign-in failed',
      operation: () async {
        final googleUser = await GoogleSignIn().signIn();

        if (googleUser == null) return;

        final googleAuth = await googleUser.authentication;
        final authCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await _auth.signInWithCredential(authCredential);
      },
    );
  }
}

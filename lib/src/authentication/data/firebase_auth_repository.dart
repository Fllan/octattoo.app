import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/authentication/domain/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this._auth);
  final FirebaseAuth _auth;

  /// Listens to authentication state changes.
  Stream<AppUser?> authStateChanges() =>
      _auth.authStateChanges().map(_convertUser);

  /// Gets the current authenticated user.
  AppUser? get currentUser => _convertUser(_auth.currentUser);

  AppUser? _convertUser(User? user) => user != null
      ? AppUser(
          uid: user.uid,
          createdAt: null,
          updatedAt: null,
          role: null,
          onboardingCompleted: null,
          isAnonymous: user.isAnonymous,
          firstname: user.displayName,
          lastname: null,
          showPronoun: null,
          pronoun: null,
          email: user.email,
          phoneNumber: user.phoneNumber,
          photoURL: user.photoURL,
          bio: null,
          street: null,
          city: null,
          province: null,
          country: null,
          postalCode: null,
          emailVerified: user.emailVerified,
        )
      : null;

  /// Signs out the current user.
  Future<void> signOut() {
    return _auth.signOut();
  }

  /// Signs in the user anonymously.
  Future<void> signInAnonymously() {
    return _auth.signInAnonymously();
  }

  /// Creates a new user with the provided email and password.
  ///
  /// Shows an error dialog if the operation fails.
  Future<void> createUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    title: Text('Error Occured'.hardcoded),
                    content: Text(e.message.toString()),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("OK"))
                    ]));
      }
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  /// Signs in the user with Google authentication.
  ///
  /// Shows an error dialog if the operation fails.
  Future<void> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Error Occured'.hardcoded),
            content: Text(e.message.toString()),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text("OK"))
            ],
          ),
        );
      }
    }
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(FirebaseAuth.instance);
}

// * Using keepAlive since other providers need it to be an
// * [AlwaysAliveProviderListenable]
@Riverpod(keepAlive: true)
Stream<AppUser?> authStateChanges(AuthStateChangesRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
}

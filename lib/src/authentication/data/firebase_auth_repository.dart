import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this._auth);
  final FirebaseAuth _auth;

  /// Listens to authentication state changes.
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  /// Gets the current authenticated user.
  User? get currentUser => _auth.currentUser;

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

  /// Signs in the user with the provided email and password.
  ///
  /// Shows an error dialog if the operation fails.
  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
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

  /// Sends a password reset email to the provided email address.
  ///
  /// Shows an error dialog if the operation fails.
  Future<void> sendPasswordResetEmail(
      String email, BuildContext context) async {
    try {
      logger.d('Sending password reset email to $email');
      await _auth.sendPasswordResetEmail(email: email);
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
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
}

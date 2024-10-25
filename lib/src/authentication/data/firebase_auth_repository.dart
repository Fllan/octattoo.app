import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  Future<void> createUserWithEmailAndPassword(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signInWithEmailAndPassword(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepository(FirebaseAuth.instance);
}

@Riverpod(keepAlive: true)
Stream<User?> authStateChanges(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
}

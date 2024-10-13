import 'package:firebase_auth/firebase_auth.dart';
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
          firstname: null,
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:octattoo_app/utils/handle_async_error.dart';

class AuthRepository {
  AuthRepository({required this.auth});
  final FirebaseAuth auth;

  User? get currentUser => auth.currentUser;

  Stream<User?> authStateChanges() => auth.authStateChanges();

  Future<void> signOut() async {
    await handleAsyncError(
      title: 'Sign out failed',
      operation: () => auth.signOut(),
    );
  }

  Future<void> signUpWithEmail(
      String errorTitle, String email, String password) async {
    await handleAsyncError(
        title: errorTitle,
        operation: () => auth.createUserWithEmailAndPassword(
            email: email, password: password));
  }

  Future<void> signInWithEmail(
      String errorTitle, String email, String password) async {
    await handleAsyncError(
        title: errorTitle,
        operation: () =>
            auth.signInWithEmailAndPassword(email: email, password: password));
  }

  Future<void> sendPasswordResetEmail(
      String errorTitle, String email, String password) async {
    await handleAsyncError(
        title: errorTitle,
        operation: () =>
            auth.signInWithEmailAndPassword(email: email, password: password));
  }

  Future<void> signInAnonymously() async {
    await handleAsyncError(
      title: 'Sign in anounymously failed',
      operation: () => auth.signInAnonymously(),
    );
  }

  Future<void> googleLogin() async {
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

        await auth.signInWithCredential(authCredential);
      },
    );
  }




  
}

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
final authRepositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRepository(auth: ref.watch(firebaseAuthProvider)));
final currentUserProvider = StateProvider<User?>(
    (ref) => ref.watch(authRepositoryProvider).currentUser);
final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(authRepositoryProvider).authStateChanges());

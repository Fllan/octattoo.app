import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/user_roles.dart';
import 'package:octattoo_app/core/services/firebase/firestore/firestore_providers.dart';
import 'package:octattoo_app/core/models/user.dart';
import 'package:octattoo_app/core/utils/logger.dart';

/// A service that handles anonymous authentication.
class AnonymousAuthService {
  final firebase_auth.FirebaseAuth _auth;
  final ProviderRef ref;

  AnonymousAuthService(this._auth, this.ref);

  /// Signs in the user anonymously.
  ///
  /// This method will attempt to sign in the user anonymously. If the sign in is successful,
  /// it will then check if the user exists in the Firestore database. If the user does not exist,
  /// it will create a new user and add it to the Firestore database.
  Future<void> signInAnonymously() async {
    try {
      logger.i("Attempting to sign in anonymously");
      firebase_auth.UserCredential userCredential = await _auth.signInAnonymously();
      logger.i("Sign in anonymously successful");
      firebase_auth.User? user = userCredential.user;

      if (user != null) {
        await _handleNewUser(user);
      }
    } catch (e) {
      logger.e('Sign in anonymously failed', error: e);
      throw Exception('Sign in anonymously failed: $e');
    }
  }

  /// Handles a new user.
  ///
  /// This method will check if the user exists in the Firestore database. If the user does not exist,
  /// it will create a new user and add it to the Firestore database.
  Future<void> _handleNewUser(firebase_auth.User user) async {
    final userRepository = ref.read(userRepositoryProvider);
    final existingUser = await userRepository.getUser(user.uid);

    if (existingUser == null) {
      logger.i("User with uid: ${user.uid} does not exist");
      final newUser = _createNewUser(user);
      await userRepository.addUser(newUser);
      logger.i("Document created in Firestore for user with uid: ${user.uid}");
    }
  }

  /// Creates a new user.
  ///
  /// This method will create a new user with the provided Firebase user.
  User _createNewUser(firebase_auth.User user) {
    return User(
      id: user.uid,
      createdAt: DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
      role: UserRoles.artist,
      hasCompletedOnboarding: false,
      hasAnonymousAccount: true,
    );
  }
}
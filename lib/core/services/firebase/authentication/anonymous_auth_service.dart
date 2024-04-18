import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/user_roles.dart';
import 'package:octattoo_app/core/services/firebase/firestore/firestore_providers.dart';
import 'package:octattoo_app/core/utils/handle_async_error.dart';
import 'package:octattoo_app/core/models/app_user.dart';
import 'package:octattoo_app/core/utils/logger.dart';

class AnonymousAuthService {
  final FirebaseAuth _auth;
  final ProviderRef ref;

  AnonymousAuthService(this._auth, this.ref);

  Future<void> signInAnonymously() async {
    logger.i("Attempting to sign in anonymously");
    await handleAsyncError(
      title: 'Sign in anounymously failed',
      operation: () async {
        UserCredential userCredential = await _auth.signInAnonymously();
        logger.i("Sign in anonymously successful");
        User? user = userCredential.user;

        if (user != null) {
          final userRepository = ref.read(userRepositoryProvider);
          final existingUser = await userRepository.getUser(user.uid);

          if (existingUser == null) {
            logger.i("User with uid: ${user.uid} does not exist");
            final newUser = AppUser(
              uid: user.uid,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              role: UserRoles.artist,
              hasCompletedOnboarding: false,
              hasAnonymousAccount: true,
            );
            await userRepository.addUser(newUser);
            logger.i(
                "Document created in Firestore for user with uid: ${user.uid}");
          }
        }
      },
    );
  }
}

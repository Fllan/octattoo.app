import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/user_roles.dart';
import 'package:octattoo_app/core/services/firebase/firestore/firestore_providers.dart';
import 'package:octattoo_app/core/utils/handle_async_error.dart';
import 'package:octattoo_app/core/models/app_user.dart';



class AnonymousAuthService {
  final FirebaseAuth _auth;
  final ProviderRef ref;

  AnonymousAuthService(this._auth, this.ref);

  Future<void> signInAnonymously() async {
    await handleAsyncError(
      title: 'Sign in anounymously failed',
      operation: () async {
        UserCredential userCredential = await _auth.signInAnonymously();
        User? user = userCredential.user;

        if (user != null) {
          final userRepository = ref.read(userRepositoryProvider);
          final newUser = AppUser(
            uid: user.uid,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            role: UserRoles.artist,
            hasCompletedOnboarding: false,
            hasAnonymousAccount: true,
          );

          final existingUser = await userRepository.getUser(user.uid);
          if (existingUser == null) {
            await userRepository.addUser(newUser);
          }
        }
      },
        );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:octattoo_app/core/constants/user_roles.dart';
import 'package:octattoo_app/core/services/firestore/database_service.dart';
import 'package:octattoo_app/core/utils/handle_async_error.dart';

class AnonymousAuthService {
  final FirebaseAuth _auth;

  AnonymousAuthService(this._auth);

  Future<void> signInAnonymously() async {
    await handleAsyncError(
      title: 'Sign in anounymously failed',
      operation: () async {
            UserCredential userCredential = await _auth.signInAnonymously();
            User? user = userCredential.user;
            final userDoc = await FirebaseFirestore.instance
                .collection(usersCollectionRef)
                .doc(user!.uid)
                .get();
            if (!userDoc.exists) {
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .set(
                {
                  'uid': user.uid,
                  'createdAt': DateTime.now(),
                  'updatedAt': DateTime.now(),
                  'role': UserRoles.artist.toString(),
                  'hasCompletedOnboarding': false,
                  'hasAnonymousAccount': true,
                },
              );
            }
          },
        );
  }
}

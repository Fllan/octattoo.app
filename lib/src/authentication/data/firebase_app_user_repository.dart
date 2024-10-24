import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:octattoo_app/core/constants/user_roles.dart';
import 'package:octattoo_app/src/authentication/domain/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_app_user_repository.g.dart';

class AppUserRepository {
  AppUserRepository(this.firestore);
  final FirebaseFirestore firestore;

  CollectionReference get usersCollection => firestore.collection('users');

  Future<void> add(User user) async {
    final appUser = AppUser(
      uid: user.uid,
      email: user.email,
      isAnonymous: user.isAnonymous,
      emailVerified: user.emailVerified,
      onboardingCompleted: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      role: UserRoles.artist,
    );

    await usersCollection.doc(user.uid).set(AppUser.toFirestore(appUser));
  }

  Future<AppUser?> get(String uid) async {
    final snapshot = await usersCollection.doc(uid).get();
    if (snapshot.exists) {
      return AppUser.fromFirestore(snapshot, null);
    }
    return null;
  }

  Future<void> update(String uid, Map<String, dynamic> updatedData) async {
    await usersCollection.doc(uid).update(updatedData);
  }

  Future<void> delete(String uid) async {
    await usersCollection.doc(uid).delete();
  }
}

@Riverpod(keepAlive: true)
AppUserRepository appUserRepository(AppUserRepositoryRef ref) {
  return AppUserRepository(FirebaseFirestore.instance);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/user_roles.dart';
import 'package:octattoo_app/core/utils/logger.dart';
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
    logger.i('FIRESTORE : add user');
    await usersCollection.doc(user.uid).set(appUser.toFirestore());
  }

  Future<AppUser?> get(String uid) async {
    logger.i('FIRESTORE : get user');
    final snapshot = await usersCollection.doc(uid).get();
    if (snapshot.exists) {
      return AppUser.fromFirestore(snapshot, null);
    }
    return null;
  }

  Future<void> update(String uid, Map<String, dynamic> updatedData) async {
    logger.i('FIRESTORE : update user');
    await usersCollection.doc(uid).update(updatedData);
  }

  Future<void> delete(String uid) async {
    logger.i('FIRESTORE : delete user');
    await usersCollection.doc(uid).delete();
  }
}

@Riverpod(keepAlive: true)
AppUserRepository appUserRepository(Ref ref) {
  return AppUserRepository(FirebaseFirestore.instance);
}

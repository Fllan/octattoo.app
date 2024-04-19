import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:octattoo_app/core/models/user.dart';
import 'package:octattoo_app/core/services/firebase/firestore/firestore_collections.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/features/onboarding/domain/repositories/user_repository.dart';

class FirestoreUserRepository implements UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<User> _usersRef;

  FirestoreUserRepository() {
    _usersRef = _firestore
        .collection(FirestoreCollections.users.value)
        .withConverter<User>(
          fromFirestore: (snapshots, _) => User.fromJson(snapshots.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  @override
  Future<void> addUser(User user) async {
    try {
      await _usersRef.doc(user.uid).set(user);
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<void> updateUser(String uid, User user) async {
    try {
  await _usersRef.doc(uid).set(user);
} on Exception catch (e) {
      logger.e(e);
}
  }

  @override
  Future<void> deleteUser(String uid) async {
    try {
  await _usersRef.doc(uid).delete();
} on Exception catch (e) {
      logger.e(e);
}
  }

  @override
  Future<User?> getUser(String uid) async {
    final docSnapshot = await _usersRef.doc(uid).get();
    return docSnapshot.exists ? docSnapshot.data() : null;
  }
}

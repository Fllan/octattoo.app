import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:octattoo_app/core/models/app_user.dart';
import 'package:octattoo_app/core/services/firebase/firestore/firestore_collections.dart';
import 'package:octattoo_app/src/features/onboarding/domain/repositories/user_repository.dart';

class FirestoreUserRepository implements UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<AppUser> _usersRef;

  FirestoreUserRepository() {
    _usersRef = _firestore.collection(FirestoreCollections.users.value)
        .withConverter<AppUser>(
          fromFirestore: (snapshots, _) => AppUser.fromJson(snapshots.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  @override
  Future<void> addUser(AppUser user) async {
    await _usersRef.add(user);
  }

  @override
  Future<void> updateUser(String uid, AppUser user) async {
    await _usersRef.doc(uid).set(user);
  }

  @override
  Future<void> deleteUser(String uid) async {
    await _usersRef.doc(uid).delete();
  }

  @override
  Future<AppUser?> getUser(String uid) async {
    final docSnapshot = await _usersRef.doc(uid).get();
    return docSnapshot.exists ? docSnapshot.data() : null;
  }
}

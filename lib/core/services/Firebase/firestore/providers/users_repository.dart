import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:octattoo_app_mvp/core/models/user.dart';
import 'package:octattoo_app_mvp/core/services/firebase/firestore/base_repository.dart';
import 'package:octattoo_app_mvp/core/services/firebase/firestore/collections.dart';
import 'package:octattoo_app_mvp/core/services/firebase/firestore/providers/firestore_provider.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_repository.g.dart';

class UsersRepository implements BaseRepository<User> {
  UsersRepository(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Future<String> create(User user, String userId) async {
    try {
      DocumentReference docRef =
          _firestore.collection(FirestoreCollections.users.value).doc(userId);
      await docRef.set(user.toJson());
      logger.d('User created successfully with ID: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      throw Exception('Failed to create the new user ${user.id}');
    }
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Stream<List<User>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<User?> read(String id) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> update(String id, User item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
UsersRepository usersRepository(UsersRepositoryRef ref) {
  return UsersRepository(ref.watch(firebaseFirestoreProvider));
}

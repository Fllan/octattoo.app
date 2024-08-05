import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:octattoo_app_mvp/core/models/user.dart';
import 'package:octattoo_app_mvp/core/services/firebase/firestore/firestore_collections.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/firestore_provider.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_repository.g.dart';

class UsersRepository {
  UsersRepository(this._firestore) {
    logger.d('UsersRepository initialized');
    _usersCollection = _firestore.collection(FirestoreCollections.users.value);
  }

  final FirebaseFirestore _firestore;
  late final CollectionReference _usersCollection;

  Future<String> create(User user, String authUserId) async {
    try {
      DocumentReference docRef = _usersCollection.doc(authUserId);
      await docRef.set(User.toFirestore(user));
      logger.d('User created successfully with ID: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      throw Exception('Failed to create the new user $authUserId');
    }
  }

  Future<bool> delete(String userId) async {
    try {
      await _usersCollection.doc(userId).delete();
      logger.d('User deleted successfully with ID: $userId');
      return true;
    } catch (e) {
      throw Exception('Failed to delete the user $userId');
    }
  }

  Future<User?> read(String userId) async {
    try {
      DocumentSnapshot docSnap = await _usersCollection.doc(userId).get();
      if (docSnap.exists) {
        logger.d('User read successfully with ID: $userId');
        return User.fromFirestore(docSnap, null);
      } else {
        logger.d('User not found with ID: $userId');
        return null;
      }
    } catch (e) {
      throw Exception('Failed to read the user $userId');
    }
  }

  Future<bool> isOnboardingCompleted(String userId) async {
    try {
      DocumentSnapshot docSnap = await _usersCollection.doc(userId).get();
      if (docSnap.exists) {
        final user = User.fromFirestore(docSnap, null);
        logger.d('User read successfully with ID: $userId');
        return user.hasCompletedOnboarding;
      } else {
        throw Exception('User not found with ID: $userId');
      }
    } catch (e) {
      throw Exception('Failed to read the user $userId');
    }
  }
}

@riverpod
UsersRepository usersRepository(UsersRepositoryRef ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return UsersRepository(firestore);
}

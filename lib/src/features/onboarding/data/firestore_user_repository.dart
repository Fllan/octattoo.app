import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:octattoo_app/core/models/user.dart';
import 'package:octattoo_app/core/services/firebase/firestore/firestore_collections.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/features/onboarding/domain/repositories/user_repository.dart';

/// `FirestoreUserRepository` is a concrete implementation of `UserRepository` that uses Firestore as the backend.
/// It uses the Singleton pattern to ensure that only one instance of `FirestoreUserRepository` is created.
class FirestoreUserRepository implements UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<User> _usersRef;

  // Singleton instance of FirestoreUserRepository
  static final FirestoreUserRepository _instance = FirestoreUserRepository._();

  // Private constructor
  FirestoreUserRepository._() {
    // Initialize the reference to the 'users' collection in Firestore
    _usersRef = _firestore
        .collection(FirestoreCollections.users.value)
        .withConverter<User>(
          // Convert data from Firestore to a User object
          fromFirestore: (snapshots, _) => User.fromJson(snapshots.data()!),
          // Convert a User object to a format that can be stored in Firestore
          toFirestore: (user, _) => user.toJson(),
        );
  }

  // Getter to access the singleton instance
  static FirestoreUserRepository get instance => _instance;

  /// Adds a new user to Firestore.
  @override
  Future<void> addUser(User user) async {
    try {
      await _usersRef.doc(user.id).set(user);
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  /// Updates an existing user in Firestore.
  @override
  Future<void> updateUser(String id, User user) async {
    try {
      await _usersRef.doc(id).set(user);
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  /// Deletes a user from Firestore.
  @override
  Future<void> deleteUser(String id) async {
    try {
      await _usersRef.doc(id).delete();
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  /// Retrieves a user from Firestore by ID.
  @override
  Future<User?> getUser(String id) async {
    final docSnapshot = await _usersRef.doc(id).get();
    return docSnapshot.exists ? docSnapshot.data() : null;
  }
}
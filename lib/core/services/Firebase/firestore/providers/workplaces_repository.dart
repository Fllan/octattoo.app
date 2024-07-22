import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:octattoo_app_mvp/core/models/workplace.dart';
import 'package:octattoo_app_mvp/core/services/firebase/firestore/base_repository.dart';
import 'package:octattoo_app_mvp/core/services/firebase/firestore/collections.dart';
import 'package:octattoo_app_mvp/core/services/firebase/firestore/providers/firestore_provider.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workplaces_repository.g.dart';

class WorkplacesRepository implements BaseRepository<Workplace> {
  WorkplacesRepository(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Future<String> create(Workplace workplace, String userId) async {
    try {
      DocumentReference docRef =
          _firestore.collection(FirestoreCollections.workplaces.value).doc();
      await docRef.set(workplace.toJson());
      logger.d('Workplace created successfully with ID: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      logger.e('Failed to create the new workplace ${workplace.name}: $e');
      throw Exception('Failed to create the new workplace ${workplace.name}');
    }
  }

  @override
  Future<Workplace?> read(String id) async {
    try {
      DocumentReference docRef = _firestore
          .collection(FirestoreCollections.workplaces.value)
          .doc(id)
          .withConverter<Workplace>(
            fromFirestore: (snapshot, _) =>
                Workplace.fromJson(snapshot.data()!),
            toFirestore: (Workplace workplace, _) => workplace.toJson(),
          );
      DocumentSnapshot docSnap = await docRef.get();
      final workplace = docSnap.data();
      if (workplace != null) {
        logger.d('Workplace with id $id found successfully');
        return workplace as Workplace;
      } else {
        logger.d('Workplace with id $id not found');
        return null;
      }
    } catch (e) {
      logger.e('Failed to get the workplace with id $id : $e');
      throw Exception('Failed to get the workplace with id $id');
    }
  }

  @override
  Future<void> update(String id, Workplace workplace) async {
    try {
      DocumentReference docRef =
          _firestore.collection(FirestoreCollections.workplaces.value).doc(id);
      await docRef.update(workplace.toJson());
      logger.d('Workplace with id $id updated successfully');
    } catch (e) {
      logger.e('Failed to update the workplace with id $id : $e');
      throw Exception('Failed to update the workplace with id $id');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      DocumentReference docRef =
          _firestore.collection(FirestoreCollections.workplaces.value).doc(id);
      await docRef.delete();
      logger.d('Workplace with id $id deleted successfully');
    } catch (e) {
      logger.e('Failed to delete the workplace with id $id : $e');
      throw Exception('Failed to delete the workplace with id $id');
    }
  }

  @override
  Stream<List<Workplace>> getAll() {
    return _firestore
        .collection(FirestoreCollections.workplaces.value)
        .withConverter<Workplace>(
          fromFirestore: (snapshot, _) => Workplace.fromJson(snapshot.data()!),
          toFirestore: (Workplace workplace, _) => workplace.toJson(),
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }
}

@Riverpod(keepAlive: true)
WorkplacesRepository workplacesRepository(WorkplacesRepositoryRef ref) {
  return WorkplacesRepository(ref.watch(firebaseFirestoreProvider));
}

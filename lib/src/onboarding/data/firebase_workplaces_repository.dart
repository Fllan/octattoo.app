import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/onboarding/domain/workplace.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_workplaces_repository.g.dart';

class WorkplacesRepository {
  WorkplacesRepository(this.firestore);
  final FirebaseFirestore firestore;

  CollectionReference get workplacesCollection =>
      firestore.collection('workplaces');

  Future<String?> add(Workplace workplace) async {
    logger.i('FIRESTORE : add workplace');
    final DocumentReference docRef = workplacesCollection.doc();
    await workplacesCollection
        .doc(docRef.id)
        .set((workplace.copyWith(id: docRef.id)).toFirestore());
    return docRef.id;
  }

  Future<Workplace?> get(String id) async {
    logger.i('FIRESTORE : get workplace');
    final snapshot = await workplacesCollection.doc(id).get();
    if (snapshot.exists) {
      return Workplace.fromFirestore(snapshot, null);
    }
    return null;
  }

  Future<void> update(String id, Map<String, dynamic> updatedData) async {
    logger.i('FIRESTORE : update workplace');
    await workplacesCollection.doc(id).update(updatedData);
  }

  Future<void> delete(String id) async {
    logger.i('FIRESTORE : delete workplace');
    await workplacesCollection.doc(id).delete();
  }
}

@Riverpod(keepAlive: true)
WorkplacesRepository workplacesRepository(Ref ref) {
  return WorkplacesRepository(FirebaseFirestore.instance);
}

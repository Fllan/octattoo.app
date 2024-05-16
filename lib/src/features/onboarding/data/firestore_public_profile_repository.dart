import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:octattoo_app/core/models/public_profile.dart';
import 'package:octattoo_app/core/services/firebase/firestore/firestore_collections.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/features/onboarding/domain/repositories/public_profile_repository.dart';

abstract class FirestorePublicProfileRepository implements PublicProfileRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<PublicProfile> _publicProfilesRef;

  FirestorePublicProfileRepository() {
    _publicProfilesRef = _firestore
        .collection(FirestoreCollections.publicProfiles.value)
        .withConverter<PublicProfile>(
          fromFirestore: (snapshots, _) => PublicProfile.fromJson(snapshots.data()!),
          toFirestore: (publicProfile, _) => publicProfile.toJson(),
        );
  }

  @override
  Future<void> addPublicProfile(PublicProfile publicProfile) async {
    try {
      await _publicProfilesRef.doc(publicProfile.id).set(publicProfile);
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<void> updatePublicProfile(String uid, PublicProfile publicProfile) async {
    try {
      await _publicProfilesRef.doc(uid).set(publicProfile);
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<void> deletePublicProfile(String uid) async {
    try {
      await _publicProfilesRef.doc(uid).delete();
    } on Exception catch (e) {
      logger.e(e);
    }
  }
}
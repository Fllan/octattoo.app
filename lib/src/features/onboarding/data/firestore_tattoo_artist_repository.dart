import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:octattoo_app/core/models/tattoo_artist.dart';
import 'package:octattoo_app/core/services/firebase/firestore/firestore_collections.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/features/onboarding/domain/repositories/tattoo_artist_repository.dart';

abstract class FirestoreTattooArtistRepository
    implements TattooArtistRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<TattooArtist> _tattooArtistsRef;

  FirestoreTattooArtistRepository() {
    _tattooArtistsRef = _firestore
        .collection(FirestoreCollections.tattooArtists.value)
        .withConverter<TattooArtist>(
          fromFirestore: (snapshots, _) =>
              TattooArtist.fromJson(snapshots.data()!),
          toFirestore: (tattooArtist, _) => tattooArtist.toJson(),
        );
  }

  @override
  Future<void> addTattooArtist(TattooArtist tattooArtist) async {
    try {
      await _tattooArtistsRef.doc(tattooArtist.id).set(tattooArtist);
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<void> updateTattooArtist(String uid, TattooArtist tattooArtist) async {
    try {
      await _tattooArtistsRef.doc(uid).set(tattooArtist);
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<void> deleteTattooArtist(String uid) async {
    try {
      await _tattooArtistsRef.doc(uid).delete();
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<TattooArtist?> getTattooArtist(String uid) async {
    final docSnapshot = await _tattooArtistsRef.doc(uid).get();
    return docSnapshot.exists ? docSnapshot.data() : null;
  }
}

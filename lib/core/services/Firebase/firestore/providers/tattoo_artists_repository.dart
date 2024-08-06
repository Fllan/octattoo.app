import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:octattoo_app_mvp/core/models/tattoo_artist.dart';
import 'package:octattoo_app_mvp/core/services/firebase/firestore/firestore_collections.dart';
import 'package:octattoo_app_mvp/core/services/firebase/initialization/providers/firestore_provider.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tattoo_artists_repository.g.dart';

class TattooArtistsRepository {
  TattooArtistsRepository(this._firestore) {
    logger.d('TattooArtistsRepository initialized');
    _tattooArtistsCollection =
        _firestore.collection(FirestoreCollections.tattooArtists.value);
  }

  final FirebaseFirestore _firestore;
  late final CollectionReference _tattooArtistsCollection;

  Future<String> create(TattooArtist tattooArtist) async {
    try {
      DocumentReference docRef = _tattooArtistsCollection.doc();
      await docRef.set(tattooArtist.toJson());
      logger.d('Tattoo artist created successfully with ID: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      logger.e(
          'Failed to create the new tattoo artist ${tattooArtist.artistName}: $e');
      throw Exception(
          'Failed to create the new tattoo artist ${tattooArtist.artistName}');
    }
  }
}

@riverpod
TattooArtistsRepository tattooArtistsRepository(
    TattooArtistsRepositoryRef ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return TattooArtistsRepository(firestore);
}

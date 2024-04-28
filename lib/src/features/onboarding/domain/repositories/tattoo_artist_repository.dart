import 'package:octattoo_app/core/models/tattoo_artist.dart';

abstract class TattooArtistRepository {
  Future<void> addTattooArtist(TattooArtist tattooArtist);
  Future<void> updateTattooArtist(String uid, TattooArtist tattooArtist);
  Future<void> deleteTattooArtist(String uid);
  Future<TattooArtist?> getTattooArtist(String uid);
  Future<void> saveTattooArtist(TattooArtist tattooArtist);
  Future<void> uploadTattooArtist(TattooArtist tattooArtist);
}

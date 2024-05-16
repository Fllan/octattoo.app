import 'package:octattoo_app/core/models/tattoo_artist.dart';
//import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/features/onboarding/domain/repositories/tattoo_artist_repository.dart';

abstract class LocalTattooArtistRepository extends TattooArtistRepository {

  @override
  Future<void> saveTattooArtist(TattooArtist tattooArtist) {
    // TODO: implement saveTattooArtist
    throw UnimplementedError();
  }

  @override
  Future<void> uploadTattooArtist(TattooArtist tattooArtist) {
    // TODO: implement uploadTattooArtist
    throw UnimplementedError();
  }}

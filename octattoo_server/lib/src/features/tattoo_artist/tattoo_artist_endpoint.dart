import 'package:octattoo_server/src/features/asset_endpoint.dart';
import 'package:octattoo_server/src/generated/features/tattoo_artist/tattoo_artist.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

class TattooArtistEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Gets the tattoo artist associated with the currently authenticated user.
  Future<TattooArtist?> getCurrentTattooArtist(Session session) async {
    var authUserId = await _getAuthenticatedUserId(session);
    return await TattooArtist.db.findById(session, authUserId);
  }

  /// Updates the tattoo artist.
  Future<TattooArtist> updateTattooArtist(
    Session session,
    TattooArtist updatedTattooArtist,
  ) async {
    var existingTattooArtist = await TattooArtist.db.findById(
      session,
      updatedTattooArtist.id!,
    );
    if (existingTattooArtist == null) {
      throw Exception('Tattoo artist not found');
    }
    // Ensure the authenticated user is updating their own profile
    var authUserId = await _getAuthenticatedUserId(session);
    if (authUserId != existingTattooArtist.authUserId) {
      throw Exception('Unauthorized to update this tattoo artist');
    }
    // Ensure unique constraints are maintained
    if (updatedTattooArtist.artistName != existingTattooArtist.artistName) {
      var isAvailable = await _isArtistNameAvailable(
        session,
        updatedTattooArtist.artistName,
      );
      if (!isAvailable) {
        throw Exception('Artist name is already taken');
      }
    }
    final updatedRow = await TattooArtist.db.updateRow(
      session,
      updatedTattooArtist,
    );
    return updatedRow;
  }

  /// Checks if the given artist name is available (not taken by another artist).
  @doNotGenerate
  Future<bool> _isArtistNameAvailable(
    Session session,
    String artistName,
  ) async {
    var existingArtists = await TattooArtist.db.find(
      session,
      where: (t) => t.artistName.equals(artistName),
    );
    return existingArtists.isEmpty;
  }

  /// Gets the authenticated user ID.
  @doNotGenerate
  Future<UuidValue> _getAuthenticatedUserId(Session session) async {
    final authUserId = session.authenticated?.authUserId;
    if (authUserId == null) {
      throw Exception('No AuthenticatedUserId found in session');
    }
    return authUserId;
  }

  Future<String?> getProfilePictureUploadDescription(Session session) async {
    final authUserId = await _getAuthenticatedUserId(session);
    final path = AssetEndpoint().buildAssetPath(
      'tattoo-artist',
      authUserId,
      'profile-picture.jpg',
    );
    return await AssetEndpoint().getUploadDescription(session, path);
  }

  Future<bool> verifyProfilePictureUpload(Session session) async {
    final authUserId = await _getAuthenticatedUserId(session);
    final path = AssetEndpoint().buildAssetPath(
      'tattoo-artist',
      authUserId,
      'profile-picture.jpg',
    );
    return await AssetEndpoint().verifyUpload(session, path);
  }

  Future<Uri?> getProfilePictureUrl(Session session) async {
    final authUserId = await _getAuthenticatedUserId(session);
    final path = AssetEndpoint().buildAssetPath(
      'tattoo-artist',
      authUserId,
      'profile-picture.jpg',
    );
    return await AssetEndpoint().getAssetUrl(session, path);
  }

  Future<String?> getBannerPictureUploadDescription(Session session) async {
    final authUserId = await _getAuthenticatedUserId(session);
    final path = AssetEndpoint().buildAssetPath(
      'tattoo-artist',
      authUserId,
      'banner-picture.jpg',
    );
    return await AssetEndpoint().getUploadDescription(session, path);
  }

  Future<bool> verifyBannerPictureUpload(Session session) async {
    final authUserId = await _getAuthenticatedUserId(session);
    final path = AssetEndpoint().buildAssetPath(
      'tattoo-artist',
      authUserId,
      'banner-picture.jpg',
    );
    return await AssetEndpoint().verifyUpload(session, path);
  }

  Future<Uri?> getBannerPictureUrl(Session session) async {
    final authUserId = await _getAuthenticatedUserId(session);
    final path = AssetEndpoint().buildAssetPath(
      'tattoo-artist',
      authUserId,
      'banner-picture.jpg',
    );
    return await AssetEndpoint().getAssetUrl(session, path);
  }
}

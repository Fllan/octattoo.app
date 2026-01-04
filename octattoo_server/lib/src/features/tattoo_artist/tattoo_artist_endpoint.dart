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

  /// Gets a direct file upload description for a profile picture.
  Future<String?> getProfilePictureUploadDescription(Session session) async {
    return _getImageUploadDescription(session, 'profile-picture.jpg');
  }

  /// Verifies a profile picture upload.
  Future<bool> verifyProfilePictureUpload(Session session) async {
    return _verifyImageUpload(session, 'profile-picture.jpg');
  }

  /// Gets the profile picture URL.
  Future<Uri?> getProfilePictureUrl(Session session) async {
    return _getImageUrl(session, 'profile-picture.jpg');
  }

  /// Gets a direct file upload description for a banner image.
  Future<String?> getBannerUploadDescription(Session session) async {
    return _getImageUploadDescription(session, 'banner.jpg');
  }

  /// Verifies a banner image upload.
  Future<bool> verifyBannerUpload(Session session) async {
    return _verifyImageUpload(session, 'banner.jpg');
  }

  /// Gets the banner image URL.
  Future<Uri?> getBannerUrl(Session session) async {
    return _getImageUrl(session, 'banner.jpg');
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

  /// Verifies an image upload.
  @doNotGenerate
  Future<bool> _verifyImageUpload(Session session, String filename) async {
    final authUserId = await _getAuthenticatedUserId(session);
    final path = _buildImagePath(authUserId, filename);

    return await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
  }

  /// Gets a direct file upload description for an image.
  @doNotGenerate
  Future<String?> _getImageUploadDescription(
    Session session,
    String filename,
  ) async {
    final authUserId = await _getAuthenticatedUserId(session);
    final path = _buildImagePath(authUserId, filename);

    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  /// Gets the authenticated user ID.
  @doNotGenerate
  Future<UuidValue> _getAuthenticatedUserId(Session session) async {
    final authUserId = session.authenticated?.authUserId;
    if (authUserId == null) {
      throw Exception('Not authenticated');
    }
    return authUserId;
  }

  /// Builds the image path for the given user ID and filename.
  @doNotGenerate
  String _buildImagePath(UuidValue authUserId, String filename) {
    return 'tattoo-artist/$authUserId/$filename';
  }

  @doNotGenerate
  Future<Uri?> _getImageUrl(Session session, String filename) async {
    final authUserId = await _getAuthenticatedUserId(session);

    final path = _buildImagePath(authUserId, filename);

    final exists = await session.storage.fileExists(
      storageId: 'public',
      path: path,
    );

    if (!exists) return null;

    return await session.storage.getPublicUrl(
      storageId: 'public',
      path: path,
    );
  }
}

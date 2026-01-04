import 'package:serverpod/serverpod.dart';

class AssetEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<String?> getUploadDescription(Session session, String path) async {
    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  Future<bool> verifyUpload(Session session, String path) async {
    return await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
  }

  /// Gets the public URL for an asset at the specified path.
  Future<Uri?> getAssetUrl(Session session, String path) async {
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

  /// Deletes an asset at the specified path and returns true if deletion was successful.
  Future<bool> deleteAsset(Session session, String path) async {
    await session.storage.deleteFile(
      storageId: 'public',
      path: path,
    );
    final exists = await session.storage.fileExists(
      storageId: 'public',
      path: path,
    );
    return !exists;
  }

  /// Builds a standardized asset path from components.
  String buildAssetPath(String feature, UuidValue userId, String filename) {
    return '$feature/$userId/$filename';
  }
}

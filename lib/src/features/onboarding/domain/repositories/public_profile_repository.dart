import 'package:octattoo_app/core/models/public_profile.dart';

abstract class PublicProfileRepository {
  Future<void> addPublicProfile(PublicProfile publicProfile);
  Future<void> updatePublicProfile(String uid, PublicProfile publicProfile);
  Future<void> deletePublicProfile(String uid);
  Future<PublicProfile?> getPublicProfile(String uid);
  Future<void> savePublicProfile(PublicProfile publicProfile);
  Future<void> uploadPublicProfile(PublicProfile publicProfile);
}

/// Enum representing the different Firestore collections.
enum FirestoreCollections {
  users,
  tattooArtists,
  publicProfiles,
  workplaces,
}

/// Extension on FirestoreCollections to get the string representation of the enum value.
extension FirestoreCollectionsRef on FirestoreCollections {
  String get value {
    switch (this) {
      case FirestoreCollections.users:
        return "users";
      case FirestoreCollections.tattooArtists:
        return "tattoo_artists";
      case FirestoreCollections.publicProfiles:
        return "public_profiles";
      case FirestoreCollections.workplaces:
        return "workplaces";
      default:
        throw UnimplementedError('Missing string representation for $this');
    }
  }
}

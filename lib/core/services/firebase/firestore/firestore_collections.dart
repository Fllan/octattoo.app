enum FirestoreCollections {
  users,
  tattooArtists,
  publicProfiles,
}


extension FirestoreCollectionsRef on FirestoreCollections {
  String get value {
    switch (this) {
      case FirestoreCollections.users:
        return "users";
      case FirestoreCollections.tattooArtists:
        return "tattoo_artists";
      case FirestoreCollections.publicProfiles:
        return "public_profiles";
    }
  }
}
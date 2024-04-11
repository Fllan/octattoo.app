enum FirestoreCollections {
  users,
  tattooArtists,
}


extension FirestoreCollectionsRef on FirestoreCollections {
  String get value {
    switch (this) {
      case FirestoreCollections.users:
        return "users";
      case FirestoreCollections.tattooArtists:
        return "tattoo_artist";
    }
  }
}
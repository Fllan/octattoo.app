import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:octattoo_app/src/features/onboarding/data/firestore_public_profile_repository.dart';
// import 'package:octattoo_app/src/features/onboarding/data/firestore_tattoo_artist_repository.dart';
import 'package:octattoo_app/src/features/onboarding/data/firestore_user_repository.dart';
// import 'package:octattoo_app/src/features/onboarding/domain/repositories/public_profile_repository.dart';
// import 'package:octattoo_app/src/features/onboarding/domain/repositories/tattoo_artist_repository.dart';
import 'package:octattoo_app/src/features/onboarding/domain/repositories/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return FirestoreUserRepository();
});

// final tattooArtistRepositoryProvider = Provider<TattooArtistRepository>((ref) {
//   return FirestoreTattooArtistRepository();
// });

// final publicProfileRepositoryProvider = Provider<PublicProfileRepository>((ref) {
//   return FirestorePublicProfileRepository();
// });
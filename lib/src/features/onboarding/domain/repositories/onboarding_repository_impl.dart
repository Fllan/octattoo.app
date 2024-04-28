import 'package:octattoo_app/core/models/public_profile.dart';
import 'package:octattoo_app/core/models/tattoo_artist.dart';
import 'package:octattoo_app/src/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:octattoo_app/src/features/onboarding/domain/repositories/tattoo_artist_repository.dart';
import 'package:octattoo_app/src/features/onboarding/domain/repositories/user_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final TattooArtistRepository tattooArtistRepository;
  final UserRepository userRepository;

  OnboardingRepositoryImpl({required this.tattooArtistRepository, required this.userRepository});

  @override
  Future<void> saveOnboardingInfoLocally(TattooArtist tattooArtist, PublicProfile publicProfile) async {
    // Use tattooArtistRepository & userRepository to save data using SharedPreferences
  }

  @override
  Future<void> submitOnboardingInfoToFirebase() async {
    // Retrieve locally stored data and submit to Firebase
  }
}
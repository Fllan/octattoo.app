

import 'package:octattoo_app/core/models/public_profile.dart';
import 'package:octattoo_app/core/models/tattoo_artist.dart';

abstract class OnboardingRepository {
  Future<void> saveOnboardingInfoLocally(TattooArtist tattooArtist, PublicProfile publicProfile);
  Future<void> submitOnboardingInfoToFirebase();
}
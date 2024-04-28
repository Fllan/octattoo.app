import 'package:octattoo_app/core/models/public_profile.dart';
import 'package:octattoo_app/core/models/tattoo_artist.dart';
import 'package:octattoo_app/src/features/onboarding/domain/repositories/onboarding_repository.dart';

abstract class SaveOnboardingInfoUseCase {
  Future<void> call(TattooArtist tattooArtist, PublicProfile publicProfile);
}

class SaveOnboardingInfo implements SaveOnboardingInfoUseCase {
  final OnboardingRepository repository;

  SaveOnboardingInfo(this.repository);

  @override
  Future<void> call(TattooArtist tattooArtist, PublicProfile publicProfile) async {
    await repository.saveOnboardingInfoLocally(tattooArtist, publicProfile);
  }
}

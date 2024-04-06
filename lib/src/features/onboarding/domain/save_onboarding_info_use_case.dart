import 'package:octattoo_app/src/features/onboarding/domain/user_onboarding_repository.dart';
import 'package:octattoo_app/src/features/onboarding/domain/user_onboarding_info.dart';

abstract class SaveOnboardingInfoUseCase {
  Future<void> call(UserOnboardingInfo info);
}

class SaveOnboardingInfo implements SaveOnboardingInfoUseCase {
  final UserOnboardingRepository repository;

  SaveOnboardingInfo(this.repository);

  @override
  Future<void> call(UserOnboardingInfo info) async {
    await repository.saveOnboardingInfoLocally(info);
  }
}

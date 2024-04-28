import 'package:octattoo_app/src/features/onboarding/domain/repositories/onboarding_repository.dart';

abstract class SubmitOnboardingInfoUseCase {
  Future<void> call();
}

class SubmitOnboardingInfo implements SubmitOnboardingInfoUseCase {
  final OnboardingRepository repository;

  SubmitOnboardingInfo(this.repository);

  @override
  Future<void> call() async {
    await repository.submitOnboardingInfoToFirebase();
  }
}

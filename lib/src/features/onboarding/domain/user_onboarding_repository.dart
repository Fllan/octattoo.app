import 'package:octattoo_app/src/features/onboarding/domain/user_onboarding_info.dart';

abstract class UserOnboardingRepository {
  Future<void> saveOnboardingInfoLocally(UserOnboardingInfo info);
  Future<void> submitOnboardingInfoToFirebase();
}
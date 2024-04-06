import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/features/onboarding/domain/save_onboarding_info_use_case.dart';
import 'package:octattoo_app/src/features/onboarding/domain/user_onboarding_info.dart';
import 'package:octattoo_app/src/features/onboarding/presentation/onboarding_provider.dart';

class OnboardingArtistNameController extends StateNotifier<UserOnboardingInfo> {
  final SaveOnboardingInfoUseCase _saveOnboardingInfo;

  OnboardingArtistNameController(this._saveOnboardingInfo)
      : super(UserOnboardingInfo());

  void setArtistName(String name) {
    state = state.copyWith(artistName: name);
  }

  // ... Other methods to manipulate the state

  Future<void> saveOnboardingInfo() async {
    await _saveOnboardingInfo(state);
  }
}

final onboardingArtistNameControllerProvider = StateNotifierProvider<OnboardingArtistNameController, UserOnboardingInfo>((ref) {
  final saveOnboardingInfo = ref.watch(saveOnboardingInfoUseCaseProvider);
  return OnboardingArtistNameController(saveOnboardingInfo);
});

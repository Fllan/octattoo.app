import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_onboarding_info.freezed.dart';
part 'user_onboarding_info.g.dart';

@freezed
class UserOnboardingInfo with _$UserOnboardingInfo {
  factory UserOnboardingInfo({
    @Default('') String artistName,
    @Default('') String pronoun,
    @Default('') String firstName,
    @Default('') String lastName,
  }) = _UserOnboardingInfo;

  factory UserOnboardingInfo.fromJson(Map<String, dynamic> json) =>
      _$UserOnboardingInfoFromJson(json);
}

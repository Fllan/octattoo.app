// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_onboarding_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserOnboardingInfoImpl _$$UserOnboardingInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserOnboardingInfoImpl(
      artistName: json['artistName'] as String? ?? '',
      pronoun: json['pronoun'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
    );

Map<String, dynamic> _$$UserOnboardingInfoImplToJson(
        _$UserOnboardingInfoImpl instance) =>
    <String, dynamic>{
      'artistName': instance.artistName,
      'pronoun': instance.pronoun,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

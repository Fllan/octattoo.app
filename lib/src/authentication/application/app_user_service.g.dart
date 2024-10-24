// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appUserServiceHash() => r'58d33c485e1518dc8cc01de357547bcf517eef24';

/// See also [appUserService].
@ProviderFor(appUserService)
final appUserServiceProvider = Provider<AppUserService>.internal(
  appUserService,
  name: r'appUserServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appUserServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppUserServiceRef = ProviderRef<AppUserService>;
String _$currentAppUserHash() => r'191261e0b1cf5a42177645ec65f8b1f95469e675';

/// See also [CurrentAppUser].
@ProviderFor(CurrentAppUser)
final currentAppUserProvider =
    AutoDisposeAsyncNotifierProvider<CurrentAppUser, AppUser?>.internal(
  CurrentAppUser.new,
  name: r'currentAppUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentAppUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentAppUser = AutoDisposeAsyncNotifier<AppUser?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

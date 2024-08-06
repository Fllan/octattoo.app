// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_preferences_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesRepositoryHash() =>
    r'385519f6db3c2152610e418a4b0528b77f4793a7';

/// Provides an instance of [SharedPreferencesRepository] using Riverpod.
///
/// This provider ensures that the [SharedPreferencesRepository] is properly initialized
/// and available for use throughout the application.
///
/// Copied from [sharedPreferencesRepository].
@ProviderFor(sharedPreferencesRepository)
final sharedPreferencesRepositoryProvider =
    AutoDisposeProvider<SharedPreferencesRepository>.internal(
  sharedPreferencesRepository,
  name: r'sharedPreferencesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPreferencesRepositoryRef
    = AutoDisposeProviderRef<SharedPreferencesRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

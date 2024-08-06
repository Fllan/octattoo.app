// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_preferences_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesHash() => r'dfa8c7776c359e99f9e2eb2f8e7f84d92d49a26d';

/// Provides an instance of [SharedPreferences] and handles its initialization.
///
/// This provider ensures that SharedPreferences is properly initialized and available for
/// use throughout the application. It logs the initialization status and handles any
/// errors that may occur during the process.
///
/// ### Key Components:
/// - **Initialization**: Attempts to initialize SharedPreferences and logs the result.
/// - **Error Handling**: Catches and logs any errors that occur during initialization.
///
/// Copied from [sharedPreferences].
@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = FutureProvider<SharedPreferences>.internal(
  sharedPreferences,
  name: r'sharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPreferencesRef = FutureProviderRef<SharedPreferences>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

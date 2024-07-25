// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appcheck_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAppCheckHash() => r'5311514b451bcddb10f9c3934a16e515a54740e3';

/// Provides an instance of [FirebaseAppCheck] and handles its initialization.
///
/// This provider ensures that Firebase App Check is properly initialized and available for
/// use throughout the application. It checks for platform compatibility and uses appropriate
/// providers for web, Android, and Apple platforms.
///
/// ### Key Components:
/// - **Platform Check**: Ensures Firebase App Check is not initialized on unsupported platforms (e.g., Windows).
/// - **Initialization**: Activates Firebase App Check with the correct provider based on the platform.
/// - **Error Handling**: Catches and logs any errors that occur during initialization.
///
/// Copied from [firebaseAppCheck].
@ProviderFor(firebaseAppCheck)
final firebaseAppCheckProvider = FutureProvider<FirebaseAppCheck>.internal(
  firebaseAppCheck,
  name: r'firebaseAppCheckProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAppCheckHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAppCheckRef = FutureProviderRef<FirebaseAppCheck>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

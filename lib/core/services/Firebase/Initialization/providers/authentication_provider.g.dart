// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAuthHash() => r'd11f4a68037f39a53743cbae169867cf911d9c98';

/// Provides an instance of [FirebaseAuth] and handles its initialization.
///
/// This provider ensures that Firebase Authentication is properly initialized and available for
/// use throughout the application. It logs the initialization status and handles any
/// errors that may occur during the process.
///
/// ### Key Components:
/// - **Initialization**: Attempts to initialize Firebase Authentication and logs the result.
/// - **Error Handling**: Catches and logs any errors that occur during initialization.
///
/// Copied from [firebaseAuth].
@ProviderFor(firebaseAuth)
final firebaseAuthProvider = Provider<FirebaseAuth>.internal(
  firebaseAuth,
  name: r'firebaseAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firebaseAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthRef = ProviderRef<FirebaseAuth>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

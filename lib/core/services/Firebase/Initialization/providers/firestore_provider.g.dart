// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseFirestoreHash() => r'de2393ac0ba3d74621137d90802122fe9b217153';

/// Provides an instance of [FirebaseFirestore] and handles its initialization.
///
/// This provider ensures that Firestore is properly initialized with specific settings,
/// such as enabling persistence for offline data access. It logs the initialization status
/// and handles any errors that may occur during the process.
///
/// ### Key Components:
/// - **Initialization**: Attempts to initialize Firestore with persistence enabled and logs the result.
/// - **Error Handling**: Catches and logs any errors that occur during initialization.
///
/// Copied from [firebaseFirestore].
@ProviderFor(firebaseFirestore)
final firebaseFirestoreProvider = Provider<FirebaseFirestore>.internal(
  firebaseFirestore,
  name: r'firebaseFirestoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseFirestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseFirestoreRef = ProviderRef<FirebaseFirestore>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

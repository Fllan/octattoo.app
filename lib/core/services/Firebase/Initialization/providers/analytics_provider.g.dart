// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAnalyticsHash() => r'a613756aa38788dfbc7b25c678233aa6be5b662d';

/// Provides an instance of [FirebaseAnalytics] and handles its initialization.
///
/// This provider ensures that Firebase Analytics is properly initialized and available for
/// use throughout the application. It logs the initialization status and handles any
/// errors that may occur during the process.
///
/// ### Key Components:
/// - **Initialization**: Attempts to initialize Firebase Analytics and logs the result.
/// - **Error Handling**: Catches and logs any errors that occur during initialization.
///
/// Copied from [firebaseAnalytics].
@ProviderFor(firebaseAnalytics)
final firebaseAnalyticsProvider = Provider<FirebaseAnalytics>.internal(
  firebaseAnalytics,
  name: r'firebaseAnalyticsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAnalyticsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAnalyticsRef = ProviderRef<FirebaseAnalytics>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

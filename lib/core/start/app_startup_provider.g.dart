// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_startup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appStartupHash() => r'4f00717f1e0fb1385cefa6c33527d6c2f5392401';

/// Handles the application's startup process by initializing necessary services and providers.
///
/// This provider is responsible for initializing and managing the lifecycle of various Firebase services
/// and other essential providers. It ensures that all required services are ready before the application
/// starts.
///
/// - **Disposal**: Invalidates all dependent providers upon disposal to clean up resources.
/// - **Initialization**: Asynchronously initializes Firebase App Check, Shared Preferences, Analytics,
/// Authentication, and Firestore providers.
///
/// Copied from [appStartup].
@ProviderFor(appStartup)
final appStartupProvider = FutureProvider<void>.internal(
  appStartup,
  name: r'appStartupProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appStartupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppStartupRef = FutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

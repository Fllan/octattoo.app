// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$goRouterHash() => r'279f0428ee5319e612feea12ef1ad91eb7374902';

/// This file defines the application's routing configuration using GoRouter and Riverpod.
///
/// The `goRouter` provider initializes the routing system with authentication, route definitions,
/// and navigation keys to manage different navigation stacks in the app.
///
/// ### Key Components:
///
/// - **Navigator Keys**: Used to manage navigation stacks for different parts of the app.
/// - **Routes**: Defines all the routes and their respective widgets in the app.
/// - **Authentication**: Integrates with the authentication repository to manage route access based on user state.
///
/// Copied from [goRouter].
@ProviderFor(goRouter)
final goRouterProvider = Provider<GoRouter>.internal(
  goRouter,
  name: r'goRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$goRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GoRouterRef = ProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

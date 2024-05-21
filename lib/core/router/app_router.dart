import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/router/models/route_path.dart';
import 'package:octattoo_app/src/features/artist_profile/artist_profile_screen.dart';
import 'package:octattoo_app/src/features/sign_in/presentation/signin_screen.dart';
import 'package:octattoo_app/src/features/onboarding/presentation/onboarding_artist_name_screen.dart';
import 'package:octattoo_app/src/features/onboarding/presentation/onboarding_workplaces_screen.dart';
import 'package:octattoo_app/src/features/onboarding/onboarding_wrapper_screen.dart';
import 'package:octattoo_app/core/router/app_router_listenable.dart';
import 'package:octattoo_app/core/router/app_router_redirection.dart';
import 'package:octattoo_app/src/features/welcome/welcome_screen.dart';
import 'package:octattoo_app/core/utils/logger.dart';

/// Provider for the GoRouter.
final goRouterProvider = Provider<GoRouter>((ref) {
  logger.i('Initializing GoRouter');

  // Key for the root navigator
  final rootNaveKey = GlobalKey<NavigatorState>(debugLabel: 'rootNav');

  // Listen for changes in the app state
  final listenable = ref.read(appRouterListenableProvider);

  return GoRouter(
    navigatorKey: rootNaveKey,
    refreshListenable: listenable,
    redirect: (context, state) {
      logger.i('Redirecting route: ${state.path}');
      return appRouteRedirect(context, ref, state);
    },
    routes: [
      GoRoute(
        path: RoutePath.root.path,
        name: RoutePath.root.name,
        builder: (context, state) {
          logger.i('Building WelcomeScreen');
          return const WelcomeScreen();
        },
        routes: [
          GoRoute(
            path: RoutePath.signin.path,
            name: RoutePath.signin.name,
            pageBuilder: (context, state) {
              logger.i('Building SigninScreen');
              return const MaterialPage(child: SigninScreen());
            },
          ),
          GoRoute(
            path: RoutePath.onboarding.path,
            name: RoutePath.onboarding.name,
            pageBuilder: (context, state) {
              logger.i('Building OnboardingWrapperScreen');
              return const MaterialPage(child: OnboardingWrapperScreen());
            },
            routes: [
              GoRoute(
                path: RoutePath.workplaces.path,
                name: RoutePath.workplaces.name,
                pageBuilder: (context, state) {
                  logger.i('Building OnboardingWorkplacesScreen');
                  return const MaterialPage(child: OnboardingWorkplacesScreen());
                },
              ),
              GoRoute(
                path: RoutePath.artistName.path,
                name: RoutePath.artistName.name,
                pageBuilder: (context, state) {
                  logger.i('Building OnboardingArtistNameScreen');
                  return const MaterialPage(child: OnboardingArtistNameScreen());
                },
              ),
            ],
          ),
          GoRoute(
            path: RoutePath.artistProfile.path,
            name: RoutePath.artistProfile.name,
            pageBuilder: (context, state) {
              logger.i('Building ArtistProfileScreen');
              return const MaterialPage(child: ArtistProfileScreen());
            },
          ),
        ],
      ),
    ],
  );
});
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/adaptive_scaffold.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/router/app_startup.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/authentication/data/firebase_auth_repository.dart';
import 'package:octattoo_app/src/authentication/presentation/sign_in_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorSignInKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorSignIn');
final _shellNavigatorRegisterKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorRegister');
final _shellNavigatorOnboardingArtistNameKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorOnboardingArtistName');
final _shellNavigatorOnboardingWorkplaceKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorOnboardingWorkplace');
final _shellNavigatorAppointmentsKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorAppointments');
final _shellNavigatorCustomersKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorCustomers');
final _shellNavigatorProjectsKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorProjects');
final _shellNavigatorArtistProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorArtistProfile');
final _shellNavigatorFinanceKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorFinance');
final _shellNavigatorInventoryKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorInventory');
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorSettings');

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final appStartupState = ref.watch(appStartupProvider);
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: '/startup',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    redirect: (context, state) {
      // * If the app is still initializing, show the /startup route
      if (appStartupState.isLoading || appStartupState.hasError) {
        logger.d('App is still loading or has an error...');
        return '/startup';
      }
      logger.d('App startup is complete');
      //final isLoggedIn = authRepository.currentUser != null;
      // ! Test only
      const isLoggedIn = true;
      const isOnboarded = false;
      // ! Test only
      final isSigningIn = state.uri.pathSegments.first == 'signIn';
      final isRegistering = state.uri.pathSegments.first == 'register';
      final isForgotPassword =
          state.uri.pathSegments.first == 'forgot-password';
      final isWelcoming = isSigningIn || isRegistering || isForgotPassword;

      final isOnboardingArtistName =
          state.uri.pathSegments.first == 'artist-name';
      final isOnboardingWorkplace = state.uri.pathSegments.first == 'workplace';
      final isOnboarding = isOnboardingArtistName || isOnboardingWorkplace;

      final isAppointments = state.uri.pathSegments.first == 'appointments';
      final isCustomers = state.uri.pathSegments.first == 'customers';
      final isProjects = state.uri.pathSegments.first == 'projects';
      final isArtistProfile = state.uri.pathSegments.first == 'artist-profile';
      final isFinance = state.uri.pathSegments.first == 'finance';
      final isInventory = state.uri.pathSegments.first == 'inventory';
      final isSettings = state.uri.pathSegments.first == 'settings';
      final isAppShell = isAppointments ||
          isCustomers ||
          isProjects ||
          isArtistProfile ||
          isFinance ||
          isInventory ||
          isSettings;

      // * If the user is not logged in, redirect to the /home route
      if (!isLoggedIn) {
        if (!isWelcoming) {
          logger.d('User is not logged in. Redirect to /signIn');
          return '/signIn';
        }
      } else {
        logger.d('User is logged in');
        if (!isOnboarded) {
          if (!isOnboarding) {
            logger.d('User is not onboarded. Redirect to /artist-name');
            return '/artist-name';
          }
        } else {
          if (!isAppShell) {
            logger.d('User is logged in. Redirect to /home');
            return '/appointments';
          }
          return null;
        }
        return null;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/startup',
        pageBuilder: (context, state) => NoTransitionPage(
          child: AppStartupWidget(
            // * This is just a placeholder
            // * The loaded route will be managed by GoRouter on state change
            onLoaded: (_) => const SizedBox.shrink(),
          ),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          List<PrimaryDestination> welcomeDestinations =
              createWelcomeDestinations(context);
          return AdaptiveScaffold(
            navigationShell: navigationShell,
            destinations: welcomeDestinations,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSignInKey,
            routes: [
              GoRoute(
                path: '/signIn',
                pageBuilder: (context, state) => const MaterialPage(
                  child: SignInScreen(),
                ),
                routes: [
                  GoRoute(
                    path: 'forgot-password',
                    pageBuilder: (context, state) => NoTransitionPage(
                      child:
                          DefaultTestScreen(title: context.loc.forgotPassword),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorRegisterKey,
            routes: [
              GoRoute(
                path: '/register',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: DefaultTestScreen(title: context.loc.register),
                ),
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          List<PrimaryDestination> onboardingDestinations =
              createOnboardingDestinations(context);
          return AdaptiveScaffold(
            navigationShell: navigationShell,
            destinations: onboardingDestinations,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorOnboardingArtistNameKey,
            routes: [
              GoRoute(
                path: '/artist-name',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: DefaultTestScreen(title: 'Onboarding Artist Name'),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorOnboardingWorkplaceKey,
            routes: [
              GoRoute(
                path: '/workplace',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: DefaultTestScreen(title: 'Onboarding Workplace'),
                ),
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          List<PrimaryDestination> appDestinations =
              createAppDestinations(context);
          return AdaptiveScaffold(
            navigationShell: navigationShell,
            destinations: appDestinations,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAppointmentsKey,
            routes: [
              GoRoute(
                path: '/appointments',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: DefaultTestScreen(title: context.loc.appointments),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCustomersKey,
            routes: [
              GoRoute(
                path: '/customers',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: DefaultTestScreen(title: context.loc.customers),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProjectsKey,
            routes: [
              GoRoute(
                path: '/projects',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: DefaultTestScreen(title: context.loc.projects),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorArtistProfileKey,
            routes: [
              GoRoute(
                path: '/artist-profile',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: DefaultTestScreen(title: context.loc.artistProfile),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorFinanceKey,
            routes: [
              GoRoute(
                path: '/finance',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: DefaultTestScreen(title: context.loc.finance),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorInventoryKey,
            routes: [
              GoRoute(
                path: '/inventory',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: DefaultTestScreen(title: context.loc.inventory),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettingsKey,
            routes: [
              GoRoute(
                path: '/settings',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: DefaultTestScreen(title: context.loc.settings),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class DefaultTestScreen extends StatelessWidget {
  const DefaultTestScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    logger.d('Building DefaultTestScreen with title: $title');
    return Center(
      child: Text(title),
    );
  }
}

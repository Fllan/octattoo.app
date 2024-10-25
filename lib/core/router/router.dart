import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/adaptive_scaffold.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/router/routes/app_routes.dart';
import 'package:octattoo_app/core/router/app_startup.dart';
import 'package:octattoo_app/core/router/go_router_refresh_stream.dart';
import 'package:octattoo_app/core/router/routes/welcome_routes.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/app/appointments/presentation/appointment_details_screen.dart';
import 'package:octattoo_app/src/authentication/application/app_user_service.dart';
import 'package:octattoo_app/src/authentication/data/firebase_auth_repository.dart';
import 'package:octattoo_app/src/onboarding/presentation/onboarding_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  final appStartupState = ref.watch(appStartupProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  final currentAppUserAsync = ref.watch(currentAppUserProvider);

  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorSignInKey =
      GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorSignIn');
  final shellNavigatorRegisterKey =
      GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorRegister');
  final shellNavigatorOnboardingKey =
      GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorOnboarding');
  final shellNavigatorAppointmentsKey =
      GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorAppointments');
  final shellNavigatorCustomersKey =
      GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorCustomers');
  final shellNavigatorProjectsKey =
      GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorProjects');
  final shellNavigatorArtistProfileKey =
      GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorArtistProfile');
  final shellNavigatorFinanceKey =
      GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorFinance');
  final shellNavigatorInventoryKey =
      GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorInventory');
  final shellNavigatorSettingsKey =
      GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorSettings');

  return GoRouter(
    initialLocation: '/startup',
    navigatorKey: rootNavigatorKey,
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    debugLogDiagnostics: false,
    redirect: (context, state) {
      // * If the app is still initializing, show the /startup route
      if (appStartupState.isLoading || appStartupState.hasError) {
        logger.d('App is still loading or has an error...');
        return '/startup';
      }
      logger.d('App startup is complete');
      final isLoggedIn = authRepository.currentUser != null;
      // ! Test only
      // const isOnboarded = false;
      if (currentAppUserAsync.isLoading || currentAppUserAsync.hasError) {
        return null;
      }
      final appUser = currentAppUserAsync.value;
      final isOnboarded = appUser?.isOnboarded() ?? false;
      // ! Test only
      final isSigningIn =
          state.uri.pathSegments.first == WelcomeRoutes.signIn.name;
      final isRegistering =
          state.uri.pathSegments.first == WelcomeRoutes.register.name;
      final isForgotPassword =
          state.uri.pathSegments.first == WelcomeRoutes.forgotPassword.name;
      final isWelcoming = isSigningIn || isRegistering || isForgotPassword;

      final isOnboarding = state.uri.pathSegments.first == '/onboarding';

      final isAppointments = state.uri.pathSegments.first == 'appointments';
      final isCustomers = state.uri.pathSegments.first == 'customers';
      final isProjects = state.uri.pathSegments.first == 'projects';
      final isArtistProfile = state.uri.pathSegments.first == 'artist-profile';
      final isFinance = state.uri.pathSegments.first == 'finance';
      final isInventory = state.uri.pathSegments.first == 'inventory';
      final isSettings = state.uri.pathSegments.first == 'settings';
      //! Will be used later...
      // ignore: unused_local_variable
      final isAppShell = isAppointments ||
          isCustomers ||
          isProjects ||
          isArtistProfile ||
          isFinance ||
          isInventory ||
          isSettings;

      if (!isLoggedIn) {
        if (!isWelcoming) {
          logger.d('User is not logged in. Redirect to /signIn');
          return WelcomeRoutes.signIn.path;
        }
      } else {
        logger.d('User is logged in');
        if (!isOnboarded) {
          if (!isOnboarding) {
            logger.d('User is not onboarded. Redirect to /onboarding');
            return '/onboarding';
          }
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
            navigatorKey: shellNavigatorSignInKey,
            routes: [
              GoRoute(
                path: WelcomeRoutes.signIn.path,
                name: WelcomeRoutes.signIn.name,
                builder: (context, state) => WelcomeRoutes.signIn.screen,
                routes: [
                  GoRoute(
                    path: WelcomeRoutes.forgotPassword.path,
                    name: WelcomeRoutes.forgotPassword.name,
                    pageBuilder: (context, state) => NoTransitionPage(
                        child: WelcomeRoutes.forgotPassword.screen),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorRegisterKey,
            routes: [
              GoRoute(
                path: WelcomeRoutes.register.path,
                name: WelcomeRoutes.register.name,
                builder: (context, state) => WelcomeRoutes.register.screen,
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          List<PrimaryDestination> onboardingDest =
              createOnboardingDestinations(context);
          return AdaptiveScaffold(
            navigationShell: navigationShell,
            destinations: onboardingDest,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: shellNavigatorOnboardingKey,
            routes: [
              GoRoute(
                path: '/onboarding',
                name: 'onboarding',
                builder: (context, state) => const OnBoardingScreen(),
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
            navigatorKey: shellNavigatorAppointmentsKey,
            routes: [
              GoRoute(
                path: AppRoutes.appointments.path,
                name: AppRoutes.appointments.name,
                builder: (context, state) => AppRoutes.appointments.screen,
                routes: [
                  GoRoute(
                    path: AppRoutes.appointmentDetails.path,
                    name: AppRoutes.appointmentDetails.name,
                    builder: (context, state) => AppointmentDetailsScreen(
                      idAppointment: state.pathParameters['id']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorCustomersKey,
            routes: [
              GoRoute(
                path: AppRoutes.customers.path,
                name: AppRoutes.customers.name,
                builder: (context, state) => AppRoutes.customers.screen,
                routes: [
                  GoRoute(
                    path: AppRoutes.customerDetails.path,
                    name: AppRoutes.customerDetails.name,
                    builder: (context, state) =>
                        AppRoutes.customerDetails.screen,
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorProjectsKey,
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
            navigatorKey: shellNavigatorArtistProfileKey,
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
            navigatorKey: shellNavigatorFinanceKey,
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
            navigatorKey: shellNavigatorInventoryKey,
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
            navigatorKey: shellNavigatorSettingsKey,
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold.dart';
import 'package:octattoo_app/core/layouts/bodies.dart';
import 'package:octattoo_app/core/layouts/navigations.dart';
import 'package:octattoo_app/core/router/app_startup.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/appointments/presentation/appointments_details.dart';
import 'package:octattoo_app/src/appointments/presentation/appointments_list_widget.dart';
import 'package:octattoo_app/src/customers/presentation/customer_details.dart';
import 'package:octattoo_app/src/customers/presentation/customers_list_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAppointmentsKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorAppointments');
final _shellNavigatorCustomersKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorCustomers');

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final appStartupState = ref.watch(appStartupProvider);
  // final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: '/startup',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    redirect: (context, state) {
      if (appStartupState.isLoading || appStartupState.hasError) {
        logger.d('App is still loading or has an error...');
        return '/startup';
      }
      logger.d('App startup is complete');
      //final isLoggedIn = authRepository.currentUser != null;
      // ! Test only
      const isLoggedIn = true;
      const isOnboarded = true;
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
      final isAppShell = isAppointments || isCustomers;

      if (!isLoggedIn) {
        if (!isWelcoming) {
          return '/signIn';
        }
      } else {
        logger.d('GoRouter redirect : User is logged in');
        if (!isOnboarded) {
          if (!isOnboarding) {
            return '/artist-name';
          }
        } else {
          if (!isAppShell) {
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
        // ! Test only - not yet implemented
        builder: (context, state, StatefulNavigationShell navigationShell) {
          final destinations = createAppDestinations(context);
          final navigation = getNavigation(context);
          final body = getBody(
            context,
            overrides: destinations[navigationShell.currentIndex].bodyOverrides,
          );
          return AdaptiveScaffold(
            navigation: navigation,
            body: body,
            destinations: destinations,
            navigationShell: navigationShell,
          );
        },
        // ! or.... ?
        // pageBuilder: (context, state, navigationShell) {
        //   return const MaterialPage(child: Placeholder());
        // },
        // !
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAppointmentsKey,
            routes: [
              GoRoute(
                path: '/appointments',
                name: 'appointments',
                // ! Test only - not yet implemented
                builder: (context, state) {
                  return AppointmentsListWidget();
                },
                // ! or.... ?
                pageBuilder: (context, state) {
                  return MaterialPage(child: AppointmentsListWidget());
                },
                routes: [
                  GoRoute(
                    path: 'details/:idAppointment',
                    name: 'appointmentDetails',
                    // ! Test only - not yet implemented
                    builder: (context, state) {
                      return AppointmentsDetails();
                    },
                    // ! or.... ?
                    pageBuilder: (context, state) {
                      return MaterialPage(child: AppointmentsDetails());
                    },
                    // ! Test only - not yet implemented
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCustomersKey,
            routes: [
              GoRoute(
                path: '/customers',
                name: 'customers',
                // ! Test only - not yet implemented
                builder: (context, state) {
                  return CustomersListWidget();
                },
                // ! or.... ?
                pageBuilder: (context, state) {
                  return MaterialPage(child: CustomersListWidget());
                },
                // ! Test only - not yet implemented
                routes: [
                  GoRoute(
                    path: 'details/:idCustomer',
                    name: 'customerDetails',
                    // ! Test only - not yet implemented
                    builder: (context, state) {
                      return CustomerDetails(
                        idCustomer: state.pathParameters['idCustomer'],
                      );
                    },
                    // ! or.... ?
                    pageBuilder: (context, state) {
                      return MaterialPage(
                        child: CustomerDetails(
                          idCustomer: state.pathParameters['idCustomer'],
                        ),
                      );
                    },
                    // ! Test only - not yet implemented
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

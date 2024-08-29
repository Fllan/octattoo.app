// lib/core/router/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/layouts/responsive_layout.dart';
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
  logger.d('GoRouter: build');
  final appStartupState = ref.watch(appStartupProvider);

  return GoRouter(
    initialLocation: '/startup',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      if (appStartupState.isLoading || appStartupState.hasError) {
        logger.d('Router: redirect to /startup');
        return '/startup';
      }

      const isLoggedIn = true;
      const isOnboarded = true;

      if (!isLoggedIn) {
        return '/signIn';
      } else if (!isOnboarded) {
        return '/artist-name';
      } else if (!state.uri.pathSegments.contains('appointments') &&
          !state.uri.pathSegments.contains('customers')) {
        logger.d('Router: redirect to /appointments');
        return '/appointments';
      }
      logger.d('Router: redirect to null (${state.uri})');
      return null;
    },
    routes: [
      GoRoute(
        path: '/startup',
        pageBuilder: (context, state) => NoTransitionPage(
          child: AppStartupWidget(
            onLoaded: (_) => const SizedBox.shrink(),
          ),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, goRouterstate, statefulNavigationShell) {
          logger.d(
              'Router: StatefulShellRoute.indexedStack Builder: [state.uri] ${goRouterstate.uri} - [navigationShell.currentIndex] ${statefulNavigationShell.currentIndex}');
          final destinations = createAppDestinations(context);
          return ResponsiveLayout(
            navigationShell: statefulNavigationShell,
            destinations: destinations,
            goRouterState: goRouterstate,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAppointmentsKey,
            routes: [
              GoRoute(
                path: '/appointments',
                name: 'appointments',
                builder: (context, state) {
                  return const AppointmentsListWidget();
                },
                routes: [
                  GoRoute(
                    path: 'details/:idAppointment',
                    name: 'appointmentDetails',
                    pageBuilder: (context, state) {
                      return MaterialPage(
                        key: state.pageKey,
                        child: AppointmentDetails(
                          idAppointment: state.pathParameters['idAppointment'],
                        ),
                      );
                    },
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
                builder: (context, state) {
                  return const CustomersListWidget();
                },
                routes: [
                  GoRoute(
                    path: 'details/:idCustomer',
                    name: 'customerDetails',
                    builder: (context, state) {
                      return CustomerDetails(
                        idCustomer: state.pathParameters['idCustomer'],
                      );
                    },
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

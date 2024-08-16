// lib/core/router/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold.dart';
import 'package:octattoo_app/core/layouts/bodies.dart';
import 'package:octattoo_app/core/layouts/navigations.dart';
import 'package:octattoo_app/core/router/app_startup.dart';
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

  return GoRouter(
    initialLocation: '/startup',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    redirect: (context, state) {
      if (appStartupState.isLoading || appStartupState.hasError) {
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
        return '/appointments';
      }
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
        builder: (context, state, StatefulNavigationShell navigationShell) {
          final destinations = createAppDestinations(context);
          final navigation = getNavigation(context);
          final body = getBody(
            context,
            overrides: destinations[navigationShell.currentIndex].bodyOverrides,
          );

          // Determine what should be in each pane based on the current branch
          Widget firstPane = const SizedBox.shrink();
          Widget? secondPane;

          if (navigationShell.currentIndex == 0) {
            // Appointments
            firstPane = const AppointmentsListWidget();
            if (state.uri.path.contains('/appointments/details')) {
              final idAppointment = state.pathParameters['idAppointment'];
              secondPane = AppointmentsDetails(idAppointment: idAppointment);
            }
          } else if (navigationShell.currentIndex == 1) {
            // Customers
            firstPane = const CustomersListWidget();
            if (state.uri.path.contains('/customers/details')) {
              final idCustomer = state.pathParameters['idCustomer'];
              secondPane = CustomerDetails(idCustomer: idCustomer);
            }
          }

          return AdaptiveScaffold(
            navigation: navigation,
            body: body,
            destinations: destinations,
            navigationShell: navigationShell,
            firstPane: firstPane,
            secondPane: secondPane,
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
                    builder: (context, state) {
                      return const AppointmentsDetails();
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

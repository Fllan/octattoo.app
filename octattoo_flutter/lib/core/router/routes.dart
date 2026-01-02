import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/src/features/appointments/presentation/screens/add_appointment_screen.dart';
import 'package:octattoo_flutter/src/features/appointments/presentation/screens/appointment_details_screen.dart';
import 'package:octattoo_flutter/src/features/appointments/presentation/screens/appointments_screen.dart';
import 'package:octattoo_flutter/src/features/appointments/presentation/screens/edit_appointment_screen.dart';
import 'package:octattoo_flutter/src/features/artist_profile/presentation/screens/add_availability_screen.dart';
import 'package:octattoo_flutter/src/features/artist_profile/presentation/screens/add_workplace_screen.dart';
import 'package:octattoo_flutter/src/features/artist_profile/presentation/screens/artist_profile_screen.dart';
import 'package:octattoo_flutter/src/features/artist_profile/presentation/screens/availabilities_screen.dart';
import 'package:octattoo_flutter/src/features/artist_profile/presentation/screens/edit_availability_screen.dart';
import 'package:octattoo_flutter/src/features/artist_profile/presentation/screens/edit_workplace_screen.dart';
import 'package:octattoo_flutter/src/features/artist_profile/presentation/screens/public_profile_screen.dart';
import 'package:octattoo_flutter/src/features/artist_profile/presentation/screens/workplace_details_screen.dart';
import 'package:octattoo_flutter/src/features/artist_profile/presentation/screens/workplaces_screen.dart';
import 'package:octattoo_flutter/src/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:octattoo_flutter/src/features/customers/presentation/screens/add_customer_screen.dart';
import 'package:octattoo_flutter/src/features/customers/presentation/screens/customer_details_screen.dart';
import 'package:octattoo_flutter/src/features/customers/presentation/screens/customers_screen.dart';
import 'package:octattoo_flutter/src/features/customers/presentation/screens/edit_customer_screen.dart';
import 'package:octattoo_flutter/src/features/inventory/presentation/screens/inventory_screen.dart';
import 'package:octattoo_flutter/src/features/invoices/presentation/screens/invoices_screen.dart';
import 'package:octattoo_flutter/src/features/more/presentation/screens/more_screen.dart';
import 'package:octattoo_flutter/src/features/projects/presentation/screens/add_project_screen.dart';
import 'package:octattoo_flutter/src/features/projects/presentation/screens/edit_project_screen.dart';
import 'package:octattoo_flutter/src/features/projects/presentation/screens/project_details_screen.dart';
import 'package:octattoo_flutter/src/features/projects/presentation/screens/projects_screen.dart';
import 'package:octattoo_flutter/src/features/quotes/presentation/screens/quotes_screen.dart';
import 'package:octattoo_flutter/src/features/settings/presentation/screens/settings_screen.dart';
import 'package:octattoo_flutter/src/navigation/scaffold_with_nav_bar.dart';

part 'routes.g.dart';
part 'routes/branch_data.dart';
part 'routes/auth_routes.dart';
part 'routes/artist_profile_routes.dart';
part 'routes/appointments_routes.dart';
part 'routes/customers_routes.dart';
part 'routes/projects_routes.dart';
part 'routes/more_routes.dart';

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<CustomersBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ProjectsRoute>(
          path: '/projects',
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<AddProjectRoute>(path: 'add'),
            TypedGoRoute<EditProjectRoute>(path: 'edit/:projectId'),
            TypedGoRoute<ProjectDetailsRoute>(path: ':projectId'),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<AppointmentsBranchData>(
      routes: [
        TypedGoRoute<AppointmentsRoute>(
          path: '/appointments',
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<AddAppointmentRoute>(path: 'add'),
            TypedGoRoute<EditAppointmentRoute>(path: 'edit/:appointmentId'),
            TypedGoRoute<AppointmentDetailsRoute>(path: ':appointmentId'),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<ArtistProfileBranchData>(
      routes: [
        TypedGoRoute<ArtistProfileRoute>(
          path: '/artist-profile',
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<PublicProfileRoute>(path: 'public-profile'),
            TypedGoRoute<MyWorkplacesRoute>(
              path: 'my-workplaces',
              routes: <TypedRoute<RouteData>>[
                TypedGoRoute<EditWorkplaceRoute>(path: 'edit/:workplaceId'),
                TypedGoRoute<AddWorkplaceRoute>(path: 'add'),
                TypedGoRoute<WorkplaceDetailsRoute>(
                  path: ':id',
                  routes: <TypedRoute<RouteData>>[
                    TypedGoRoute<AvailabilitiesRoute>(
                      path: 'availabilities',
                      routes: <TypedRoute<RouteData>>[
                        TypedGoRoute<AddAvailabilityRoute>(path: 'add'),
                        TypedGoRoute<EditAvailabilityRoute>(
                          path: 'edit/:availabilityId',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<MoreBranchData>(
      routes: [
        TypedGoRoute<MoreRoute>(
          path: '/more',
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<SettingsRoute>(path: 'settings'),
            TypedGoRoute<InvoicesRoute>(path: 'invoices'),
            TypedGoRoute<QuotesRoute>(path: 'quotes'),
            TypedGoRoute<InventoryRoute>(path: 'inventory'),
            TypedGoRoute<CustomersRoute>(
              path: 'customers',
              routes: <TypedRoute<RouteData>>[
                TypedGoRoute<AddCustomerRoute>(path: 'add'),
                TypedGoRoute<EditCustomerRoute>(path: 'edit/:customerId'),
                TypedGoRoute<CustomerDetailsRoute>(path: ':customerId'),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return navigationShell;
  }

  static const String $restorationScopeId = 'restorationScopeId';

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return ScaffoldWithNavBar(
      navigationShell: navigationShell,
      children: children,
    );
  }
}

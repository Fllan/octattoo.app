// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$appShellRouteData, $authenticationRoute];

RouteBase get $appShellRouteData => StatefulShellRouteData.$route(
  restorationScopeId: AppShellRouteData.$restorationScopeId,
  navigatorContainerBuilder: AppShellRouteData.$navigatorContainerBuilder,
  factory: $AppShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/projects',
          factory: $ProjectsRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'add',
              factory: $AddProjectRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'edit/:projectId',
              factory: $EditProjectRoute._fromState,
            ),
            GoRouteData.$route(
              path: ':projectId',
              factory: $ProjectDetailsRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/appointments',
          factory: $AppointmentsRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'add',
              factory: $AddAppointmentRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'edit/:appointmentId',
              factory: $EditAppointmentRoute._fromState,
            ),
            GoRouteData.$route(
              path: ':appointmentId',
              factory: $AppointmentDetailsRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/artist-profile',
          factory: $ArtistProfileRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'public-profile',
              factory: $PublicProfileRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'my-workplaces',
              factory: $MyWorkplacesRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'edit/:workplaceId',
                  factory: $EditWorkplaceRoute._fromState,
                ),
                GoRouteData.$route(
                  path: 'add',
                  factory: $AddWorkplaceRoute._fromState,
                ),
                GoRouteData.$route(
                  path: ':id',
                  factory: $WorkplaceDetailsRoute._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'availabilities',
                      factory: $AvailabilitiesRoute._fromState,
                      routes: [
                        GoRouteData.$route(
                          path: 'add',
                          factory: $AddAvailabilityRoute._fromState,
                        ),
                        GoRouteData.$route(
                          path: 'edit/:availabilityId',
                          factory: $EditAvailabilityRoute._fromState,
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
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/more',
          factory: $MoreRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'settings',
              factory: $SettingsRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'invoices',
              factory: $InvoicesRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'quotes',
              factory: $QuotesRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'inventory',
              factory: $InventoryRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'customers',
              factory: $CustomersRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'add',
                  factory: $AddCustomerRoute._fromState,
                ),
                GoRouteData.$route(
                  path: 'edit/:customerId',
                  factory: $EditCustomerRoute._fromState,
                ),
                GoRouteData.$route(
                  path: ':customerId',
                  factory: $CustomerDetailsRoute._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      const AppShellRouteData();
}

mixin $ProjectsRoute on GoRouteData {
  static ProjectsRoute _fromState(GoRouterState state) => const ProjectsRoute();

  @override
  String get location => GoRouteData.$location('/projects');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AddProjectRoute on GoRouteData {
  static AddProjectRoute _fromState(GoRouterState state) =>
      const AddProjectRoute();

  @override
  String get location => GoRouteData.$location('/projects/add');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $EditProjectRoute on GoRouteData {
  static EditProjectRoute _fromState(GoRouterState state) =>
      EditProjectRoute(projectId: state.pathParameters['projectId']!);

  EditProjectRoute get _self => this as EditProjectRoute;

  @override
  String get location => GoRouteData.$location(
    '/projects/edit/${Uri.encodeComponent(_self.projectId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProjectDetailsRoute on GoRouteData {
  static ProjectDetailsRoute _fromState(GoRouterState state) =>
      ProjectDetailsRoute(projectId: state.pathParameters['projectId']!);

  ProjectDetailsRoute get _self => this as ProjectDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/projects/${Uri.encodeComponent(_self.projectId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AppointmentsRoute on GoRouteData {
  static AppointmentsRoute _fromState(GoRouterState state) =>
      const AppointmentsRoute();

  @override
  String get location => GoRouteData.$location('/appointments');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AddAppointmentRoute on GoRouteData {
  static AddAppointmentRoute _fromState(GoRouterState state) =>
      const AddAppointmentRoute();

  @override
  String get location => GoRouteData.$location('/appointments/add');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $EditAppointmentRoute on GoRouteData {
  static EditAppointmentRoute _fromState(GoRouterState state) =>
      EditAppointmentRoute(
        appointmentId: state.pathParameters['appointmentId']!,
      );

  EditAppointmentRoute get _self => this as EditAppointmentRoute;

  @override
  String get location => GoRouteData.$location(
    '/appointments/edit/${Uri.encodeComponent(_self.appointmentId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AppointmentDetailsRoute on GoRouteData {
  static AppointmentDetailsRoute _fromState(GoRouterState state) =>
      AppointmentDetailsRoute(
        appointmentId: state.pathParameters['appointmentId']!,
      );

  AppointmentDetailsRoute get _self => this as AppointmentDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/appointments/${Uri.encodeComponent(_self.appointmentId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ArtistProfileRoute on GoRouteData {
  static ArtistProfileRoute _fromState(GoRouterState state) =>
      const ArtistProfileRoute();

  @override
  String get location => GoRouteData.$location('/artist-profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PublicProfileRoute on GoRouteData {
  static PublicProfileRoute _fromState(GoRouterState state) =>
      const PublicProfileRoute();

  @override
  String get location =>
      GoRouteData.$location('/artist-profile/public-profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $MyWorkplacesRoute on GoRouteData {
  static MyWorkplacesRoute _fromState(GoRouterState state) =>
      const MyWorkplacesRoute();

  @override
  String get location => GoRouteData.$location('/artist-profile/my-workplaces');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $EditWorkplaceRoute on GoRouteData {
  static EditWorkplaceRoute _fromState(GoRouterState state) =>
      EditWorkplaceRoute(workplaceId: state.pathParameters['workplaceId']!);

  EditWorkplaceRoute get _self => this as EditWorkplaceRoute;

  @override
  String get location => GoRouteData.$location(
    '/artist-profile/my-workplaces/edit/${Uri.encodeComponent(_self.workplaceId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AddWorkplaceRoute on GoRouteData {
  static AddWorkplaceRoute _fromState(GoRouterState state) =>
      const AddWorkplaceRoute();

  @override
  String get location =>
      GoRouteData.$location('/artist-profile/my-workplaces/add');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $WorkplaceDetailsRoute on GoRouteData {
  static WorkplaceDetailsRoute _fromState(GoRouterState state) =>
      WorkplaceDetailsRoute(id: state.pathParameters['id']!);

  WorkplaceDetailsRoute get _self => this as WorkplaceDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/artist-profile/my-workplaces/${Uri.encodeComponent(_self.id)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AvailabilitiesRoute on GoRouteData {
  static AvailabilitiesRoute _fromState(GoRouterState state) =>
      AvailabilitiesRoute(id: state.pathParameters['id']!);

  AvailabilitiesRoute get _self => this as AvailabilitiesRoute;

  @override
  String get location => GoRouteData.$location(
    '/artist-profile/my-workplaces/${Uri.encodeComponent(_self.id)}/availabilities',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AddAvailabilityRoute on GoRouteData {
  static AddAvailabilityRoute _fromState(GoRouterState state) =>
      AddAvailabilityRoute(id: state.pathParameters['id']!);

  AddAvailabilityRoute get _self => this as AddAvailabilityRoute;

  @override
  String get location => GoRouteData.$location(
    '/artist-profile/my-workplaces/${Uri.encodeComponent(_self.id)}/availabilities/add',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $EditAvailabilityRoute on GoRouteData {
  static EditAvailabilityRoute _fromState(GoRouterState state) =>
      EditAvailabilityRoute(
        id: state.pathParameters['id']!,
        availabilityId: state.pathParameters['availabilityId']!,
      );

  EditAvailabilityRoute get _self => this as EditAvailabilityRoute;

  @override
  String get location => GoRouteData.$location(
    '/artist-profile/my-workplaces/${Uri.encodeComponent(_self.id)}/availabilities/edit/${Uri.encodeComponent(_self.availabilityId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $MoreRoute on GoRouteData {
  static MoreRoute _fromState(GoRouterState state) => const MoreRoute();

  @override
  String get location => GoRouteData.$location('/more');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/more/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $InvoicesRoute on GoRouteData {
  static InvoicesRoute _fromState(GoRouterState state) => const InvoicesRoute();

  @override
  String get location => GoRouteData.$location('/more/invoices');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $QuotesRoute on GoRouteData {
  static QuotesRoute _fromState(GoRouterState state) => const QuotesRoute();

  @override
  String get location => GoRouteData.$location('/more/quotes');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $InventoryRoute on GoRouteData {
  static InventoryRoute _fromState(GoRouterState state) =>
      const InventoryRoute();

  @override
  String get location => GoRouteData.$location('/more/inventory');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CustomersRoute on GoRouteData {
  static CustomersRoute _fromState(GoRouterState state) =>
      const CustomersRoute();

  @override
  String get location => GoRouteData.$location('/more/customers');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AddCustomerRoute on GoRouteData {
  static AddCustomerRoute _fromState(GoRouterState state) =>
      const AddCustomerRoute();

  @override
  String get location => GoRouteData.$location('/more/customers/add');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $EditCustomerRoute on GoRouteData {
  static EditCustomerRoute _fromState(GoRouterState state) =>
      EditCustomerRoute(customerId: state.pathParameters['customerId']!);

  EditCustomerRoute get _self => this as EditCustomerRoute;

  @override
  String get location => GoRouteData.$location(
    '/more/customers/edit/${Uri.encodeComponent(_self.customerId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CustomerDetailsRoute on GoRouteData {
  static CustomerDetailsRoute _fromState(GoRouterState state) =>
      CustomerDetailsRoute(customerId: state.pathParameters['customerId']!);

  CustomerDetailsRoute get _self => this as CustomerDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/more/customers/${Uri.encodeComponent(_self.customerId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $authenticationRoute => GoRouteData.$route(
  path: '/authentication',
  factory: $AuthenticationRoute._fromState,
);

mixin $AuthenticationRoute on GoRouteData {
  static AuthenticationRoute _fromState(GoRouterState state) =>
      const AuthenticationRoute();

  @override
  String get location => GoRouteData.$location('/authentication');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

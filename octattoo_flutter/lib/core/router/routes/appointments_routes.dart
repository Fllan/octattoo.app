part of '../routes.dart';

class AppointmentsRoute extends GoRouteData with $AppointmentsRoute {
  const AppointmentsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AppointmentsScreen();
}

class AppointmentDetailsRoute extends GoRouteData with $AppointmentDetailsRoute {
  const AppointmentDetailsRoute({required this.appointmentId});

  final String appointmentId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AppointmentDetailsScreen(appointmentId: appointmentId);
}

class AddAppointmentRoute extends GoRouteData with $AddAppointmentRoute {
  const AddAppointmentRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AddAppointmentScreen();
}

class EditAppointmentRoute extends GoRouteData with $EditAppointmentRoute {
  const EditAppointmentRoute({required this.appointmentId});

  final String appointmentId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EditAppointmentScreen(appointmentId: appointmentId);
}

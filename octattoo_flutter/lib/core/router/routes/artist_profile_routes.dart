part of '../routes.dart';

class ArtistProfileRoute extends GoRouteData with $ArtistProfileRoute {
  const ArtistProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ArtistProfileScreen();
}

class MyWorkplacesRoute extends GoRouteData with $MyWorkplacesRoute {
  const MyWorkplacesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WorkplacesScreen();
}

class WorkplaceDetailsRoute extends GoRouteData with $WorkplaceDetailsRoute {
  const WorkplaceDetailsRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WorkplaceDetailsScreen(id: id);
  }
}

class PublicProfileRoute extends GoRouteData with $PublicProfileRoute {
  const PublicProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PublicProfileScreen();
}

class EditWorkplaceRoute extends GoRouteData with $EditWorkplaceRoute {
  const EditWorkplaceRoute({required this.workplaceId});

  final String workplaceId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EditWorkplaceScreen(workplaceId: workplaceId);
}

class AddWorkplaceRoute extends GoRouteData with $AddWorkplaceRoute {
  const AddWorkplaceRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AddWorkplaceScreen();
}

class AvailabilitiesRoute extends GoRouteData with $AvailabilitiesRoute {
  const AvailabilitiesRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AvailabilitiesScreen(workplaceId: id);
}

class AddAvailabilityRoute extends GoRouteData with $AddAvailabilityRoute {
  const AddAvailabilityRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AddAvailabilityScreen(workplaceId: id);
}

class EditAvailabilityRoute extends GoRouteData with $EditAvailabilityRoute {
  const EditAvailabilityRoute({required this.id, required this.availabilityId});

  final String id;
  final String availabilityId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EditAvailabilityScreen(workplaceId: id, availabilityId: availabilityId);
}

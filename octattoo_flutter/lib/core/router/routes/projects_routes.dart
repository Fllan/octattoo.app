part of '../routes.dart';

class ProjectsRoute extends GoRouteData with $ProjectsRoute {
  const ProjectsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProjectsScreen();
}

class ProjectDetailsRoute extends GoRouteData with $ProjectDetailsRoute {
  const ProjectDetailsRoute({required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ProjectDetailsScreen(projectId: projectId);
}

class AddProjectRoute extends GoRouteData with $AddProjectRoute {
  const AddProjectRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AddProjectScreen();
}

class EditProjectRoute extends GoRouteData with $EditProjectRoute {
  const EditProjectRoute({required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EditProjectScreen(projectId: projectId);
}

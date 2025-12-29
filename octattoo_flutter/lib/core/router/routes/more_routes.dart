part of '../routes.dart';

class MoreRoute extends GoRouteData with $MoreRoute {
  const MoreRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const MoreScreen();
}

class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsScreen();
}

class InvoicesRoute extends GoRouteData with $InvoicesRoute {
  const InvoicesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const InvoicesScreen();
}

class QuotesRoute extends GoRouteData with $QuotesRoute {
  const QuotesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const QuotesScreen();
}

class InventoryRoute extends GoRouteData with $InventoryRoute {
  const InventoryRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const InventoryScreen();
}

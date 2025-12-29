part of '../routes.dart';

class CustomersRoute extends GoRouteData with $CustomersRoute {
  const CustomersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CustomersScreen();
}

class CustomerDetailsRoute extends GoRouteData with $CustomerDetailsRoute {
  const CustomerDetailsRoute({required this.customerId});

  final String customerId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CustomerDetailsScreen(customerId: customerId);
}

class AddCustomerRoute extends GoRouteData with $AddCustomerRoute {
  const AddCustomerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AddCustomerScreen();
}

class EditCustomerRoute extends GoRouteData with $EditCustomerRoute {
  const EditCustomerRoute({required this.customerId});

  final String customerId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EditCustomerScreen(customerId: customerId);
}

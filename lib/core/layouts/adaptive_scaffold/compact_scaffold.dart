import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/layouts/adaptive_navigation/modal_drawer.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/appointments/application/appointment_provider.dart';
import 'package:octattoo_app/src/customers/application/customer_provider.dart';

class CompactScaffold extends StatelessWidget {
  const CompactScaffold({
    super.key,
    required this.navigationShell,
    required this.destinations,
    required this.goRouterState,
  });

  final StatefulNavigationShell navigationShell;
  final List<PrimaryDestination> destinations;
  final GoRouterState goRouterState;

  @override
  Widget build(BuildContext context) {
    logger.d('CompactScaffold: build');
    return Consumer(builder: (context, ref, _) {
      final currentPath = goRouterState.fullPath!
          .split('/')
          .where((e) => e.isNotEmpty)
          .toList();
      final rootLocation = currentPath[0];
      final subLocation = currentPath.length > 1 ? currentPath[1] : null;
      final isSubLocation = subLocation != null;

      // final title = getTitle(subLocation, rootLocation, context, ref);
      const title = 'Compact Scaffold';

      final appBar = AppBar(
        title: const Text(title),
        leading: isSubLocation
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              )
            : null,
      );
      final body = navigationShell;
      final drawer = ModalDrawer(
        destinations: destinations,
        navigationShell: navigationShell,
      );

      return Scaffold(
        appBar: appBar,
        body: body,
        drawer: drawer,
      );
    });
  }

  String getTitle(String? subLocation, String rootLocation,
      BuildContext context, WidgetRef ref) {
    late String title;
    switch (subLocation == null) {
      case true:
        switch (rootLocation) {
          case 'appointments':
            title = context.loc.appointments;
          case 'customers':
            title = context.loc.customers;
        }
      case false:
        switch (rootLocation) {
          case 'appointments':
            final idAppointment = goRouterState.pathParameters['idAppointment'];
            final hasState = ref.read(selectedAppointmentProvider) != null;
            switch (hasState) {
              case true:
                final selectedAppointment =
                    ref.watch(selectedAppointmentProvider);
                final appointmentTitle =
                    selectedAppointment?.name ?? 'No appointment selected';
                return appointmentTitle;
              case false:
                final appointmentTitle = ref
                    .watch(appointmentRepositoryProvider)
                    .getAppointmentById(int.parse(idAppointment!))
                    .name;
                title = appointmentTitle;
            }
          case 'customers':
            final idCustomer = goRouterState.pathParameters['idCustomer'];
            final hasState = ref.read(selectedCustomerProvider) != null;
            switch (hasState) {
              case true:
                final selectedCustomer = ref.watch(selectedCustomerProvider);
                final customerTitle =
                    selectedCustomer?.name ?? 'No Customer selected';
                title = customerTitle;
              case false:
                final customerTitle = ref
                    .watch(customerRepositoryProvider)
                    .getCustomerById(int.parse(idCustomer!))
                    .name;
                title = customerTitle;
            }
        }
    }
    return title;
  }
}

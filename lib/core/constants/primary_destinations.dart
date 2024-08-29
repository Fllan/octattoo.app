import 'package:flutter/material.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/core/utils/logger.dart';

/// Class representing a primary destination in the app's navigation.
class PrimaryDestination {
  PrimaryDestination(
    this.icon,
    this.label,
    this.selectedIcon,
  );

  final Widget icon;
  final Widget selectedIcon;
  final String label;
}

/// Creates a list of the primary destinations for the app.
List<PrimaryDestination> createAppDestinations(BuildContext context) {
  logger.d('PrimaryDestination: createAppDestinations');
  return <PrimaryDestination>[
    appointmentsDestination(context),
    customersDestination(context),
  ];
}

PrimaryDestination customersDestination(BuildContext context) {
  return PrimaryDestination(
    const Icon(Icons.people),
    context.loc.customers,
    const Icon(Icons.people_outlined),
  );
}

PrimaryDestination appointmentsDestination(BuildContext context) {
  return PrimaryDestination(
    const Icon(Icons.calendar_today),
    context.loc.appointments,
    const Icon(Icons.calendar_today_outlined),
  );
}

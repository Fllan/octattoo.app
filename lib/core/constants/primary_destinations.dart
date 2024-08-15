import 'package:flutter/material.dart';
import 'package:octattoo_app/core/layouts/bodies.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';

class PrimaryDestination {
  const PrimaryDestination(
    this.icon,
    this.label,
    this.selectedIcon, {
    this.bodyOverrides,
  });

  final Widget icon;
  final Widget selectedIcon;
  final String label;
  final BodyOverride? bodyOverrides;

  List<PrimaryDestination> createAppDestinations(BuildContext context) {
    return <PrimaryDestination>[
      PrimaryDestination(
        const Icon(Icons.calendar_today),
        context.loc.appointments,
        const Icon(Icons.calendar_today_outlined),
        bodyOverrides: {},
      ),
      PrimaryDestination(
        const Icon(Icons.people),
        context.loc.customers,
        const Icon(Icons.people_outlined),
        bodyOverrides: {},
      ),
    ];
  }
}

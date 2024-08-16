import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/breakpoints.dart';
import 'package:octattoo_app/core/layouts/bodies.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';

/// Class representing a primary destination in the app's navigation.
class PrimaryDestination {
  PrimaryDestination(
    this.icon,
    this.label,
    this.selectedIcon, {
    this.bodyOverrides,
  });

  final Widget icon;
  final Widget selectedIcon;
  final String label;
  final BodyOverride? bodyOverrides;
}

/// Creates a list of the primary destinations for the app.
List<PrimaryDestination> createAppDestinations(BuildContext context) {
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
    bodyOverrides: {
      BreakpointType.extraLarge: Body(BodyType.twoPane, BodyLayout.firstFixed),
      BreakpointType.large: Body(BodyType.twoPane, BodyLayout.firstFixed),
      BreakpointType.expanded: Body(BodyType.twoPane, BodyLayout.flexible),
      BreakpointType.medium: Body(BodyType.singlePane, BodyLayout.flexible),
      BreakpointType.compact: Body(BodyType.singlePane, BodyLayout.flexible),
    },
  );
}

PrimaryDestination appointmentsDestination(BuildContext context) {
  return PrimaryDestination(
    const Icon(Icons.calendar_today),
    context.loc.appointments,
    const Icon(Icons.calendar_today_outlined),
    bodyOverrides: {
      BreakpointType.extraLarge: Body(BodyType.singlePane, BodyLayout.flexible),
      BreakpointType.large: Body(BodyType.singlePane, BodyLayout.flexible),
      BreakpointType.expanded: Body(BodyType.singlePane, BodyLayout.flexible),
      BreakpointType.medium: Body(BodyType.singlePane, BodyLayout.flexible),
      BreakpointType.compact: Body(BodyType.singlePane, BodyLayout.flexible),
    },
  );
}

import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/breakpoints.dart';
import 'package:octattoo_app/core/layouts/cannonical_layouts/list_detail_layout.dart';
import 'package:octattoo_app/src/app/appointments/presentation/appointment_details.dart';
import 'package:octattoo_app/src/app/appointments/presentation/appointments.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isExpandedOrMore = BreakpointsExtension.isExpanded(context) ||
        BreakpointsExtension.isLarge(context) ||
        BreakpointsExtension.isExtraLarge(context);
    final isCompactOrMedium = BreakpointsExtension.isCompact(context) ||
        BreakpointsExtension.isMedium(context);

    if (isCompactOrMedium) {
      return const Appointments();
    }
    if (isExpandedOrMore) {
      return const ListDetailLayout(
        listPane: Appointments(),
        detailPane: AppointmentDetails(idAppointment: ''),
      );
    }

    return const Placeholder();
  }
}

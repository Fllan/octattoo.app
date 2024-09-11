import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/breakpoints.dart';
import 'package:octattoo_app/core/layouts/cannonical_layouts/list_detail_layout.dart';
import 'package:octattoo_app/src/app/appointments/presentation/appointment_details.dart';
import 'package:octattoo_app/src/app/appointments/presentation/appointments.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  final String idAppointment;
  const AppointmentDetailsScreen({super.key, required this.idAppointment});

  @override
  State<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final isCompactOrMedium = BreakpointsExtension.isCompact(context) ||
        BreakpointsExtension.isMedium(context);
    final isExpandedOrMore = BreakpointsExtension.isExpanded(context) ||
        BreakpointsExtension.isLarge(context) ||
        BreakpointsExtension.isExtraLarge(context);

    if (isCompactOrMedium) {
      return AppointmentDetails(idAppointment: widget.idAppointment);
    }
    if (isExpandedOrMore) {
      return ListDetailLayout(
        listPane: const Appointments(),
        detailPane: AppointmentDetails(idAppointment: widget.idAppointment),
      );
    }

    return const Placeholder();
  }
}

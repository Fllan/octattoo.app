import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/window_size_class.dart';
import 'package:octattoo_app/src/appointments/presentation/appointments_details.dart';
import 'package:octattoo_app/src/appointments/presentation/appointments_list.dart';

class AppointmentsListScreen extends StatelessWidget {
  final String? appointmentId;

  const AppointmentsListScreen({
    super.key,
    this.appointmentId,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final currentWidth = constraints.maxWidth;
      final isCompactOrMediumScaffold =
          currentWidth <= WindowSizeClass.medium.endWidthRange;

      switch (isCompactOrMediumScaffold) {
        case true:
          return const AppointmentsList();
        case false:
          return Row(
            children: [
              const Expanded(
                child: AppointmentsList(),
              ),
              Expanded(
                child: AppointmentDetails(idAppointment: appointmentId),
              ),
            ],
          );
      }
    });
  }
}

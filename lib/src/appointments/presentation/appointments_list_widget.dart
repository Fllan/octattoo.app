// lib/src/appointments/presentation/appointments_list_widget.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/src/appointments/data/appointments_data.dart';

class AppointmentsListWidget extends StatefulWidget {
  const AppointmentsListWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppointmentsListWidgetState createState() => _AppointmentsListWidgetState();
}

class _AppointmentsListWidgetState extends State<AppointmentsListWidget> {
  int? selectedAppointmentId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointmentsList.length,
      itemBuilder: (context, index) {
        final appointment = appointmentsList[index];
        final isSelected = selectedAppointmentId == appointment.id;

        return ListTile(
          title: Text(appointment.name),
          subtitle: Text(appointment.customer.name),
          selected: isSelected,
          onTap: () {
            setState(() {
              selectedAppointmentId = appointment.id;
            });
            context.pushNamed(
              'appointmentDetails',
              pathParameters: {'idAppointment': appointment.id.toString()},
            );
          },
        );
      },
    );
  }
}

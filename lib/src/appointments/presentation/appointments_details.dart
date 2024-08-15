import 'package:flutter/material.dart';
import 'package:octattoo_app/src/appointments/presentation/appointments_list_widget.dart';
import 'package:octattoo_app/src/customers/presentation/customers_list_widget.dart';

class AppointmentsDetails extends StatelessWidget {
  final String? idAppointment;
  final List<Appointments> appointments = [
    Appointments(
      Customer(id: 1, name: 'John Doe'),
      DateTime.now(),
      DateTime.now().add(const Duration(hours: 1)),
      '123 Main St',
      'Bring all the things',
      id: 1,
      name: 'First Appointment',
    ),
    Appointments(
      Customer(id: 2, name: 'Jane Smith'),
      DateTime.now().add(const Duration(days: 1)),
      DateTime.now().add(const Duration(days: 1, hours: 1)),
      '456 Elm St',
      'Bring all the things',
      id: 2,
      name: 'Second Appointment',
    ),
    Appointments(
      Customer(id: 3, name: 'Alice Johnson'),
      DateTime.now().add(const Duration(days: 2)),
      DateTime.now().add(const Duration(days: 2, hours: 1)),
      '789 Cedar St',
      'Bring all the things',
      id: 3,
      name: 'Third Appointment',
    ),
    // Add more fake appointments here
  ];

  AppointmentsDetails({super.key, this.idAppointment});

  @override
  Widget build(BuildContext context) {
    if (idAppointment == null) {
      return const Text('No appointment selected');
    } else {
      final appointment = appointments.firstWhere(
        (element) => element.id == int.parse(idAppointment!),
      );
      return Column(
        children: [
          Text(appointment.name),
          Text(appointment.customer.name),
          Text(appointment.startDate.toString()),
          Text(appointment.endDate.toString()),
          Text(appointment.location),
          Text(appointment.notes),
        ],
      );
    }
  }
}

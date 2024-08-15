import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/src/customers/presentation/customers_list_widget.dart';

class AppointmentsListWidget extends StatelessWidget {
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

  AppointmentsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return ListTile(
          title: Text(appointment.name),
          subtitle: Text(appointment.customer.name),
          onTap: () {
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

class Appointments {
  final int id;
  final String name;
  final Customer customer;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final String notes;

  Appointments(
      this.customer, this.startDate, this.endDate, this.location, this.notes,
      {required this.id, required this.name});
}

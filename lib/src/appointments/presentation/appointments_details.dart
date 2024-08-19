// lib/src/appointments/presentation/appointments_details.dart
import 'package:flutter/material.dart';
import 'package:octattoo_app/src/appointments/data/appointments_data.dart';

class AppointmentsDetails extends StatelessWidget {
  final String? idAppointment;

  const AppointmentsDetails({super.key, this.idAppointment});

  @override
  Widget build(BuildContext context) {
    if (idAppointment == null) {
      return Center(
        child: Text(
          'No appointment selected',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      );
    } else {
      final appointment = appointmentsList.firstWhere(
        (element) => element.id == int.parse(idAppointment!),
      );
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appointment.name,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8.0),
              Text('Customer: ${appointment.customer.name}'),
              Text('Start: ${appointment.startDate}'),
              Text('End: ${appointment.endDate}'),
              Text('Location: ${appointment.location}'),
              Text('Notes: ${appointment.notes}'),
            ],
          ),
        ),
      );
    }
  }
}

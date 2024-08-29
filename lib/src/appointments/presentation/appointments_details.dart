import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/appointments/application/appointment_provider.dart';

class AppointmentDetails extends ConsumerWidget {
  final String? idAppointment;

  const AppointmentDetails({super.key, required this.idAppointment});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (idAppointment == null) {
      return Center(
        child: Text(
          'No appointment selected',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      );
    } else {
      final appointment = ref
          .read(appointmentRepositoryProvider)
          .getAppointmentById(int.parse(idAppointment!));

      return SingleChildScrollView(
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
      );
    }
  }
}

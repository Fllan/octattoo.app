import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/router/routes.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({super.key, required this.appointmentId});

  final String appointmentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge(
          '$appointmentId (Appointment Details)',
          context,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialText.bodyMedium(
              'Appointment Details Screen - Coming Soon\nAppointment ID: $appointmentId',
              context,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () => EditAppointmentRoute(
                appointmentId: appointmentId,
              ).go(context),
              child: const Text('Edit Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/router/routes.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Appointments', context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialText.bodyMedium(
              'Appointments Screen - Coming Soon',
              context,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () => AppointmentDetailsRoute(
                appointmentId: 'test-appointment-1',
              ).go(context),
              child: const Text('View Appointment Details'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () => AddAppointmentRoute().pushReplacement(context),
              child: const Text('Add New Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({super.key, required this.appointmentId});

  final String appointmentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Appointment Details', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Appointment Details Screen - Coming Soon\nAppointment ID: $appointmentId', context),
      ),
    );
  }
}

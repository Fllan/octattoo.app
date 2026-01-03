import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class EditAppointmentScreen extends StatelessWidget {
  const EditAppointmentScreen({super.key, required this.appointmentId});

  final String appointmentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge(
          '$appointmentId (Edit Appointment)',
          context,
        ),
      ),
      body: Center(
        child: MaterialText.bodyMedium(
          'Edit Appointment Screen - Coming Soon\nAppointment ID: $appointmentId',
          context,
        ),
      ),
    );
  }
}

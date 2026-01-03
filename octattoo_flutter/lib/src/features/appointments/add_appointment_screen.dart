import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class AddAppointmentScreen extends StatelessWidget {
  const AddAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Add Appointment', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Add Appointment Screen - Coming Soon', context),
      ),
    );
  }
}

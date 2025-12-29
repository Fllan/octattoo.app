import 'package:flutter/material.dart';
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
        child: MaterialText.bodyMedium('Appointments Screen - Coming Soon', context),
      ),
    );
  }
}

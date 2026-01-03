import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class AddAvailabilityScreen extends StatelessWidget {
  const AddAvailabilityScreen({super.key, required this.workplaceId});

  final String workplaceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Add Availability', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Add Availability Screen - Coming Soon\nWorkplace ID: $workplaceId', context),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class EditAvailabilityScreen extends StatelessWidget {
  const EditAvailabilityScreen({super.key, required this.workplaceId, required this.availabilityId});

  final String workplaceId;
  final String availabilityId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Edit Availability', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Edit Availability Screen - Coming Soon\nWorkplace ID: $workplaceId\nAvailability ID: $availabilityId', context),
      ),
    );
  }
}

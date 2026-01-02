import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/router/routes.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class AvailabilitiesScreen extends StatelessWidget {
  const AvailabilitiesScreen({super.key, required this.workplaceId});

  final String workplaceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Availabilities', context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialText.bodyMedium('Availabilities Screen - Coming Soon\nWorkplace ID: $workplaceId', context),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () => AddAvailabilityRoute(id: workplaceId).go(context),
              child: const Text('Add Availability'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () => EditAvailabilityRoute(id: workplaceId, availabilityId: 'test-availability-1').go(context),
              child: const Text('Edit Availability'),
            ),
          ],
        ),
      ),
    );
  }
}

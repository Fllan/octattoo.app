import 'package:flutter/material.dart';
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
        child: MaterialText.bodyMedium('Availabilities Screen - Coming Soon\nWorkplace ID: $workplaceId', context),
      ),
    );
  }
}

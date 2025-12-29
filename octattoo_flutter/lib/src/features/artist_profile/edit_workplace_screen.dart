import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class EditWorkplaceScreen extends StatelessWidget {
  const EditWorkplaceScreen({super.key, required this.workplaceId});

  final String workplaceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Edit Workplace', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Edit Workplace Screen - Coming Soon\nWorkplace ID: $workplaceId', context),
      ),
    );
  }
}

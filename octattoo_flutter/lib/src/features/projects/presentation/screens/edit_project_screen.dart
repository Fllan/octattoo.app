import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class EditProjectScreen extends StatelessWidget {
  const EditProjectScreen({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Edit Project', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Edit Project Screen - Coming Soon\nProject ID: $projectId', context),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Project Details', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Project Details Screen - Coming Soon\nProject ID: $projectId', context),
      ),
    );
  }
}

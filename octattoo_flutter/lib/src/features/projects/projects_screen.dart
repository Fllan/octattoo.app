import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Projects', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Projects Screen - Coming Soon', context),
      ),
    );
  }
}

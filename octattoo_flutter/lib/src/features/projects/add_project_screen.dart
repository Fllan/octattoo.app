import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class AddProjectScreen extends StatelessWidget {
  const AddProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Add Project', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Add Project Screen - Coming Soon', context),
      ),
    );
  }
}

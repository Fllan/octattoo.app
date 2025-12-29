import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class AddWorkplaceScreen extends StatelessWidget {
  const AddWorkplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Add Workplace', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Add Workplace Screen - Coming Soon', context),
      ),
    );
  }
}

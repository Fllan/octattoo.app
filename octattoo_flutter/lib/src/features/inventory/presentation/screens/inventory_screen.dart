import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Inventory', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Inventory Screen - Coming Soon', context),
      ),
    );
  }
}

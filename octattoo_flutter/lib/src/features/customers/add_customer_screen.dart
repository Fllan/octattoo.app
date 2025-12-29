import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class AddCustomerScreen extends StatelessWidget {
  const AddCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Add Customer', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Add Customer Screen - Coming Soon', context),
      ),
    );
  }
}

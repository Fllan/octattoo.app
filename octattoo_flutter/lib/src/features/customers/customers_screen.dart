import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Customers', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Customers Screen - Coming Soon', context),
      ),
    );
  }
}

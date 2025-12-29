import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({super.key, required this.customerId});

  final String customerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Customer Details', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Customer Details Screen - Coming Soon\nCustomer ID: $customerId', context),
      ),
    );
  }
}

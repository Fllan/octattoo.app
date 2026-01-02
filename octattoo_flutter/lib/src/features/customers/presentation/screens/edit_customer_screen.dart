import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class EditCustomerScreen extends StatelessWidget {
  const EditCustomerScreen({super.key, required this.customerId});

  final String customerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Edit Customer', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Edit Customer Screen - Coming Soon\nCustomer ID: $customerId', context),
      ),
    );
  }
}

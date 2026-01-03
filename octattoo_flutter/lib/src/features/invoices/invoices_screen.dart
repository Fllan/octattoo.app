import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Invoices', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Invoices Screen - Coming Soon', context),
      ),
    );
  }
}

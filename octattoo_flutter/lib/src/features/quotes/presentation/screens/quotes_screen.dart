import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Quotes', context),
      ),
      body: Center(
        child: MaterialText.bodyMedium('Quotes Screen - Coming Soon', context),
      ),
    );
  }
}

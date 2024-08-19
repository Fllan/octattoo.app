// lib/src/customers/presentation/customer_details.dart
import 'package:flutter/material.dart';
import 'package:octattoo_app/src/customers/data/customers_data.dart';

class CustomerDetails extends StatelessWidget {
  final String? idCustomer;

  const CustomerDetails({super.key, required this.idCustomer});

  @override
  Widget build(BuildContext context) {
    if (idCustomer == null) {
      return Center(
        child: Text(
          'No customer selected',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      );
    } else {
      Customer customer = customersList
          .firstWhere((element) => element.id == int.parse(idCustomer!));

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Customer Details',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8.0),
              Text('Customer ID: ${customer.id}'),
              Text('Customer Name: ${customer.name}'),
            ],
          ),
        ),
      );
    }
  }
}

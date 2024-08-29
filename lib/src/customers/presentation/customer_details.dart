import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/customers/application/customer_provider.dart';

class CustomerDetails extends ConsumerWidget {
  final String? idCustomer;

  const CustomerDetails({super.key, required this.idCustomer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (idCustomer == null) {
      return Center(
        child: Text(
          'No customer selected',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      );
    } else {
      final customer = ref
          .read(customerRepositoryProvider)
          .getCustomerById(int.parse(idCustomer!));

      return SingleChildScrollView(
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
      );
    }
  }
}

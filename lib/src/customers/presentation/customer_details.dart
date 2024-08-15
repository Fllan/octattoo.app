import 'package:flutter/material.dart';
import 'package:octattoo_app/src/customers/presentation/customers_list_widget.dart';

class CustomerDetails extends StatelessWidget {
  final String? idCustomer;
  final List<Customer> customers = [
    Customer(id: 1, name: 'John Doe'),
    Customer(id: 2, name: 'Jane Smith'),
    // Add more fake customers here
  ];

  CustomerDetails({super.key, required this.idCustomer});

  @override
  Widget build(BuildContext context) {
    if (idCustomer == null) {
      return const Text('No customer selected');
    } else {
      Customer customer = customers
          .firstWhere((element) => element.id == int.parse(idCustomer!));

      return Center(
        child: Text(
            'Customer ID: ${customer.id}\nCustomer Name: ${customer.name}'),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomersListWidget extends StatelessWidget {
  final List<Customer> customers = [
    Customer(id: 1, name: 'John Doe'),
    Customer(id: 2, name: 'Jane Smith'),
    // Add more fake customers here
  ];

  CustomersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customers.length,
      itemBuilder: (context, index) {
        final customer = customers[index];
        return ListTile(
          title: Text(customer.name),
          onTap: () {
            context.pushNamed(
              'customerDetails',
              pathParameters: {'idCustomer': customer.id.toString()},
            );
          },
        );
      },
    );
  }
}

class Customer {
  final int id;
  final String name;

  Customer({required this.id, required this.name});
}

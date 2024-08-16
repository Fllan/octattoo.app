// lib/src/customers/presentation/customers_list_widget.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/src/customers/data/customers_data.dart';

class CustomersListWidget extends StatefulWidget {
  const CustomersListWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomersListWidgetState createState() => _CustomersListWidgetState();
}

class _CustomersListWidgetState extends State<CustomersListWidget> {
  int? selectedCustomerId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customersList.length,
      itemBuilder: (context, index) {
        final customer = customersList[index];
        final isSelected = selectedCustomerId == customer.id;

        return ListTile(
          title: Text(customer.name),
          selected: isSelected,
          onTap: () {
            setState(() {
              selectedCustomerId = customer.id;
            });
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

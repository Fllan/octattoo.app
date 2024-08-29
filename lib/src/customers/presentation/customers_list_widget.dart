import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/window_size_class.dart';
import 'package:octattoo_app/src/customers/application/customer_provider.dart';

class CustomersListWidget extends ConsumerWidget {
  const CustomersListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customersList = ref.watch(customerListProvider);
    final selectedCustomer = ref.watch(selectedCustomerProvider);

    return ListView.builder(
      itemCount: customersList.length,
      itemBuilder: (context, index) {
        final customer = customersList[index];
        final currentWidth = MediaQuery.sizeOf(context).width;
        final isCompactOrMediumScaffold =
            currentWidth <= WindowSizeClass.medium.endWidthRange;

        final isSelected = selectedCustomer?.id == customer.id;

        return ListTile(
          title: Text(customer.name),
          selected: isCompactOrMediumScaffold ? false : isSelected,
          onTap: () {
            ref.read(selectedCustomerProvider.notifier).state = customer;
            context.goNamed(
              'customerDetails',
              pathParameters: {'idCustomer': customer.id.toString()},
            );
          },
        );
      },
    );
  }
}

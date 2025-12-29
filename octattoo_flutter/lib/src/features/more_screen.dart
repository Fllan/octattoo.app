import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/router/routes.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => SettingsRoute().go(context),
        ),
        ListTile(
          leading: const Icon(Icons.receipt_long),
          title: const Text('Invoices'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => InvoicesRoute().go(context),
        ),
        ListTile(
          leading: const Icon(Icons.request_quote),
          title: const Text('Quotes'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => QuotesRoute().go(context),
        ),
        ListTile(
          leading: const Icon(Icons.inventory_2),
          title: const Text('Inventory'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => InventoryRoute().go(context),
        ),
        ListTile(
          leading: const Icon(Icons.people),
          title: const Text('Customers'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => CustomersRoute().go(context),
        ),
      ],
    );
  }
}

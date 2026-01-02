import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/router/routes.dart';
import 'package:octattoo_flutter/core/serverpod_client_service.dart';
import 'package:octattoo_flutter/src/shared/gaps.dart';
import 'package:octattoo_flutter/src/shared/l10n_extensions.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final client = ServerpodClientService().client;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            gapH12,
            Row(
              children: [
                gapW16,
                MaterialText.titleSmall('Finance'.hardcoded, context),
              ],
            ),
            gapH12,
            ListTile(
              leading: const Icon(Icons.request_quote_outlined),
              title: Text('Quotes'.hardcoded),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => QuotesRoute().go(context),
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long_outlined),
              title: Text('Invoices'.hardcoded),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => InvoicesRoute().go(context),
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on_outlined),
              title: Text('Payments'.hardcoded),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            gapH12,
            Divider(),
            gapH12,
            Row(
              children: [
                gapW16,
                MaterialText.titleSmall(
                  'Hygiene & Cleanliness'.hardcoded,
                  context,
                ),
              ],
            ),
            gapH12,
            ListTile(
              leading: const Icon(Icons.track_changes_outlined),
              title: Text('Traceability'.hardcoded),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.inventory_outlined),
              title: const Text('Inventory'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => InventoryRoute().go(context),
            ),
            gapH12,
            Divider(),
            gapH12,
            Row(
              children: [
                gapW16,
                MaterialText.titleSmall(
                  'Settings'.hardcoded,
                  context,
                ),
              ],
            ),
            gapH12,
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => SettingsRoute().go(context),
            ),
            gapH12,
            Divider(),
            gapH12,
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: Text('Log out'.hardcoded),
              onTap: () => client.auth.signOutDevice(),
              textColor: Theme.of(context).colorScheme.onErrorContainer,
              iconColor: Theme.of(context).colorScheme.onErrorContainer,
            ),
          ],
        ),
      ),
    );
  }
}

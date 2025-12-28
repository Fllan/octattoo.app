import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/async_button.dart';
import 'package:octattoo_flutter/src/shared/gaps.dart';
import 'package:octattoo_flutter/src/shared/l10n_extensions.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class AddWorkplace extends StatelessWidget {
  const AddWorkplace({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          gapH20,
          MaterialText.titleLarge('Add a workplace'.hardcoded, context),
          gapH16,
          gapH32,
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: _buildTypeCard(
                    context,
                    'Guest'.hardcoded,
                    'When you tattoo for a period of time in a specific workplace'
                        .hardcoded,
                    Icons.work_history_outlined,
                    'guest',
                  ),
                ),
                gapW16,
                Expanded(
                  flex: 1,
                  child: _buildTypeCard(
                    context,
                    'Permanent'.hardcoded,
                    'Where you tattoo most of your time'.hardcoded,
                    Icons.storefront_outlined,
                    'permanent',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    String selectedType,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  gapH24,
                  Icon(
                    icon,
                    size: 68,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  gapH24,
                  Text(
                    description,
                    textAlign: TextAlign.center,
                  ),
                  gapH24,
                ],
              ),
              AsyncButton.elevated(
                callback: () {
                  return Future.value();
                },
                label: 'New $title'.hardcoded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

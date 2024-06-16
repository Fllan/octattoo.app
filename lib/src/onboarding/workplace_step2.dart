import 'package:flutter/material.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';

class WorkplaceStep2 extends StatefulWidget {
  const WorkplaceStep2({super.key});

  @override
  State<WorkplaceStep2> createState() => _WorkplaceStep2State();
}

class _WorkplaceStep2State extends State<WorkplaceStep2> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('Guest'.hardcoded,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          gapH24,
                          Icon(Icons.work_history_outlined,
                            size: 68,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          gapH24,
                          const Text(
                            'When you tattoo for a period of time in a specific workplace',
                            textAlign: TextAlign.center,
                          ),
                          gapH24,
                        ],
                      ),
                      FilledButton(
                        onPressed: (){
                          // TODO: Implement New guest button
                        },
                        child: const Text('New guest'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Permanent'.hardcoded,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          gapH24,
                          Icon(Icons.storefront_outlined,
                            size: 68,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          gapH24,
                          const Text(
                            'Where you tattoo most of your time',
                            textAlign: TextAlign.center,
                          ),
                          gapH24,
                        ],
                      ),
                      FilledButton(
                        onPressed: (){
                          // TODO: Implement New guest button
                        },
                        child: const Text('New Permanent'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

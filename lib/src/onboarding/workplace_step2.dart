import 'package:flutter/material.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/constants/worplace_types.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';

class WorkplaceStep2 extends StatefulWidget {
  const WorkplaceStep2({super.key});

  @override
  State<WorkplaceStep2> createState() => _WorkplaceStep2State();
}

class _WorkplaceStep2State extends State<WorkplaceStep2>
    with TickerProviderStateMixin {
  WorplaceTypes? selectedWorkplaceType;

  void _showAddWorkplaceModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheet(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Add a new ${selectedWorkplaceType == WorplaceTypes.guest ? 'guest' : 'permanent'} workplace'
                      .hardcoded,
                ),
                leading: IconButton(
                  icon: Icon(Icons.adaptive.arrow_back),
                  onPressed: () {
                    selectedWorkplaceType = null;
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
            );
          },
          onClosing: () {},
        );
      },
      isScrollControlled:
          true, // This allows the modal to take up the full screen
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                25.0)), // This gives the modal rounded corners at the top
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (selectedWorkplaceType == null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select a type of workplace to add your first one. You can add other workplaces later.'
                    .hardcoded,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              gapH32,
              IntrinsicHeight(
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
                                    Text(
                                      'Guest'.hardcoded,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    gapH24,
                                    Icon(
                                      Icons.work_history_outlined,
                                      size: 68,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
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
                                  onPressed: () {
                                    setState(() {
                                      selectedWorkplaceType =
                                          WorplaceTypes.guest;
                                    });
                                    _showAddWorkplaceModal(context);
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
                                    Text(
                                      'Permanent'.hardcoded,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    gapH24,
                                    Icon(
                                      Icons.storefront_outlined,
                                      size: 68,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
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
                                  onPressed: () {
                                    setState(() {
                                      selectedWorkplaceType =
                                          WorplaceTypes.permanent;
                                    });
                                    _showAddWorkplaceModal(context);
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
              ),
            ],
          ),
        if (selectedWorkplaceType != null)
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedWorkplaceType = null;
                  });
                },
                icon: const Icon(Icons.refresh),
              ),
              const Placeholder(),
            ],
          )
      ],
    );
  }
}

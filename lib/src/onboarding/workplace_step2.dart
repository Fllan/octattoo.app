import 'package:flutter/material.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/constants/worplace_types.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';

/// This widget is used to select the type of workplace to add.
/// It has two options: Guest and Permanent.
/// When the user selects one, it opens the [AddWorkplaceWidget] to add the workplace.
class WorkplaceStep2 extends StatefulWidget {
  const WorkplaceStep2({super.key});

  @override
  State<WorkplaceStep2> createState() => _WorkplaceStep2State();
}

/// This is the state of the [WorkplaceStep2].
class _WorkplaceStep2State extends State<WorkplaceStep2> {
  WorkplaceTypes? selectedWorkplaceType;

  void _showAddWorkplaceModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheet(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Select your workplace'),
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
              body: const AddWorkplaceWidget(),
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
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
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
                                        WorkplaceTypes.guest;
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
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
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
                                        WorkplaceTypes.permanent;
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
      ],
    );
  }
}

/// This widget is used to add a workplace to the user's profile.
///
/// It has two tabs: Search and Create new.
class AddWorkplaceWidget extends StatefulWidget {
  const AddWorkplaceWidget({super.key});

  @override
  State<AddWorkplaceWidget> createState() => _AddWorkplaceWidgetState();
}

/// This is the state of the [AddWorkplaceWidget].
class _AddWorkplaceWidgetState extends State<AddWorkplaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  'Add to your profile an existing workplace or create a new one.'
                      .hardcoded,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                gapH32,
                TabBar(
                  tabs: [
                    Tab(
                      text: 'Search'.hardcoded,
                    ),
                    Tab(
                      text: 'Create new'.hardcoded,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      gapH12,
                      SearchBar(
                        leading: const Icon(Icons.search),
                        hintText: 'Search for a workplace'.hardcoded,
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemBuilder: itemBuilder, itemCount: 2)),
                    ],
                  ),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Workplace name'.hardcoded,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Address'.hardcoded,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'City'.hardcoded,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Country'.hardcoded,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        gapH24,
                        FilledButton(
                          onPressed: () {},
                          child: const Text('Create'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return ListTile(
      title: Text('Workplace $index'),
      subtitle: Text('Address $index'),
      onTap: () {
        // Add the workplace to the user's profile
        Navigator.of(context).pop();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/constants/worplace_types.dart';
import 'package:octattoo_app_mvp/core/models/workplace.dart';
import 'package:octattoo_app_mvp/core/router/routes.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';
import 'package:octattoo_app_mvp/core/services/firebase/firestore/providers/workplaces_repository.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:octattoo_app_mvp/src/shared/widgets/app_async_elevated_button.dart';

class AddWorkplaceScreen extends StatefulWidget {
  final String selectedType;
  const AddWorkplaceScreen({super.key, required this.selectedType});

  @override
  State<AddWorkplaceScreen> createState() => _AddWorkplaceScreenState();
}

class _AddWorkplaceScreenState extends State<AddWorkplaceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String selectedType;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedType = widget.selectedType;
    final selectedTypeIsPermanent =
        selectedType == WorkplaceTypes.permanent.value;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          selectedTypeIsPermanent
              ? Text('Select your permanent workplace'.hardcoded,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ))
              : Text('Select your guest workplace'.hardcoded,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
          gapH16,
          Text(
              'Add to your profile an existing workplace or create a new one'
                  .hardcoded,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  )),
          gapH32,
          SizedBox(
            width: double.maxFinite,
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'Search'.hardcoded),
                Tab(text: 'Create new'.hardcoded),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const SearchTab(),
                CreateNewTab(selectedType),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchTab extends StatefulWidget {
  const SearchTab({
    super.key,
  });

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gapH24,
        const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            labelText: 'Search a workplace',
            border: OutlineInputBorder(),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.store),
                title: const Text('La Vipère Rose'),
                subtitle: const Text('Lyon - France'),
                trailing: const Icon(Icons.add),
                onTap: () {
                  // Implement add workplace logic
                },
              ),
              ListTile(
                leading: const Icon(Icons.store),
                title: const Text('La Cygogne piqueuse'),
                subtitle: const Text('Nantes - France'),
                trailing: const Icon(Icons.add),
                onTap: () {
                  // Implement add workplace logic
                },
              ),
              // Add more ListTiles here
            ],
          ),
        ),
      ],
    );
  }
}

class CreateNewTab extends ConsumerStatefulWidget {
  final String selectedType;
  const CreateNewTab(this.selectedType, {super.key});

  @override
  ConsumerState<CreateNewTab> createState() => _CreateNewTabState();
}

class _CreateNewTabState extends ConsumerState<CreateNewTab> {
  var _isManager = false;

  final _formKey = GlobalKey<FormState>();
  final _workplaceNameController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _provinceController = TextEditingController();
  final _countryController = TextEditingController();
  final _postalCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var isFormValid = _formKey.currentState?.validate();
    return Form(
      onChanged: () => setState(() {}),
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH24,
            Text('Workplace name'.hardcoded,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
            gapH16,
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              controller: _workplaceNameController,
              decoration: InputDecoration(
                labelText: 'Workplace name'.hardcoded,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name'.hardcoded;
                }
                return null;
              },
            ),
            gapH8,
            SwitchListTile(
              value: _isManager,
              title: Text(
                'I manage this place'.hardcoded,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'As manager of the workplace, you will be able to add photos and details about the place later.'
                    .hardcoded,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              onChanged: (newValue) {
                setState(() {
                  _isManager = newValue;
                });
              },
            ),
            gapH32,
            Text('Address'.hardcoded,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
            gapH16,
            TextFormField(
              keyboardType: TextInputType.streetAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _streetController,
              decoration: InputDecoration(
                labelText: 'Street'.hardcoded,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a street name & number'.hardcoded;
                }
                return null;
              },
            ),
            gapH8,
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _cityController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'City'.hardcoded,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a city name'.hardcoded;
                      }
                      return null;
                    },
                  ),
                ),
                gapW8,
                Expanded(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.streetAddress,
                    controller: _provinceController,
                    decoration: InputDecoration(
                      labelText: 'Province'.hardcoded,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a province name'.hardcoded;
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            gapH8,
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _postalCodeController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'Postal Code'.hardcoded,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a postal code'.hardcoded;
                      }
                      return null;
                    },
                  ),
                ),
                gapW8,
                Expanded(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _countryController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'Country'.hardcoded,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a country name'.hardcoded;
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            gapH32,
            Row(
              children: [
                gapW16,
                if (isFormValid ?? false)
                  Expanded(
                    flex: 2,
                    child: AppAsyncElevatedButton(
                      callback: _createGuestWorkplace,
                      label: 'Add'.hardcoded,
                    ),
                  ),
                if (isFormValid == null || !isFormValid)
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: null,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.add_business),
                          gapW4,
                          Text('Add'.hardcoded),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _createGuestWorkplace() async {
    if (!_validateForm()) return;

    try {
      final workplaceId = await _addNewWorkplaceinFirestore();
      _navigateToNextScreen(workplaceId);
    } catch (e) {
      logger.e('Failed to add the new workplace: $e');
      _showErrorMessage();
    }
  }

  bool _validateForm() {
    return _formKey.currentState?.validate() ?? false;
  }

  _addNewWorkplaceinFirestore() async {
    final workplaceRepository = ref.watch(workplacesRepositoryProvider);
    final createdBy = ref.watch(authStateChangesProvider).value!.uid;

    final workplaceId = workplaceRepository.create(
        Workplace(
          name: _workplaceNameController.text,
          description: '',
          updatedAt: DateTime.now(),
          createdAt: DateTime.now(),
          createdBy: createdBy,
          permanentTattooArtists: null,
          guestTattooArtists: null,
          street: _streetController.text,
          city: _cityController.text,
          province: _provinceController.text,
          country: _countryController.text,
          postalCode: _postalCodeController.text,
          managedBy: _isManager ? createdBy : null,
        ),
        createdBy);

    return workplaceId;
  }

  void _navigateToNextScreen(String workplaceId) {
    GoRouter.of(context).pushNamed(WorkplaceSubRoutes.details.name,
        pathParameters: {'id': workplaceId});
  }

  void _showErrorMessage() async {
    if (context.mounted) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                  title: Text('Error Occured'.hardcoded),
                  content: Text(
                      'Something went wrong while adding the workplace. Please try again later.'
                          .hardcoded),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("OK"))
                  ]));
    }
  }
}

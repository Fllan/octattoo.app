import 'package:flutter/material.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/constants/worplace_types.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences.dart';

class AddWorkplaceScreen extends StatefulWidget {
  const AddWorkplaceScreen({super.key});

  @override
  State<AddWorkplaceScreen> createState() => _AddWorkplaceScreenState();
}

class _AddWorkplaceScreenState extends State<AddWorkplaceScreen>
    with SingleTickerProviderStateMixin {
  Future<String?> getselectedWorkplaceType() async {
    final prefs = SharedPreferencesService.instance;
    return prefs.getString(SharedPreferencesKeys.onboardingWorkplaceType);
  }

  late TabController _tabController;

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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: getselectedWorkplaceType(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return _buildContent(snapshot.data);
        },
      ),
    );
  }

  Widget _buildContent(String? data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (data == WorkplaceTypes.permanent.value)
          Text('Select your permanent workplace'.hardcoded,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  )),
        if (data == WorkplaceTypes.guest.value)
          Text('Select your guest workplace'.hardcoded,
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
            children: const [
              SearchTab(),
              CreateNewTab(),
            ],
          ),
        ),
      ],
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

class CreateNewTab extends StatefulWidget {
  const CreateNewTab({
    super.key,
  });

  @override
  State<CreateNewTab> createState() => _CreateNewTabState();
}

class _CreateNewTabState extends State<CreateNewTab> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const TextField(
          decoration: InputDecoration(
            labelText: 'Workplace name',
            border: OutlineInputBorder(),
          ),
        ),
        gapH8,
        SwitchListTile(
          value: value,
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
              value = newValue;
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
      ],
    );
  }
}

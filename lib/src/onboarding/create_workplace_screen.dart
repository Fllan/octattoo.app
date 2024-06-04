import 'package:flutter/material.dart';

class CreateWorkplaceScreen extends StatelessWidget {
  const CreateWorkplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF4FF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select your permanent workplace',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Add to your profile an existing workplace or create a new one',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TabBarView(
              children: [
                // Search Tab
                Column(
                  children: [
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
                ),
                // Create New Tab
                Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Workplace name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SwitchListTile(
                      title: const Text('I manage this place'),
                      value: true,
                      onChanged: (value) {
                        // Implement manage this place logic
                      },
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Street',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'City',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Province',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Country',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Implement add workplace logic
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchWorkplaceScreen extends StatelessWidget {
  const SearchWorkplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF4FF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select your permanent workplace',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Add to your profile an existing workplace or create a new one',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
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
        ),
      ),
    );
  }
}

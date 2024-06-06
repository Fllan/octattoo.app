// lib/src/workplaces/workplace_details_screen.dart 
import 'package:flutter/material.dart';

class WorkplaceDetailsScreen extends StatelessWidget {
  const WorkplaceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF4FF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Expanded(
                  child: Text(
                    'La Vipère Rose',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Implement edit logic
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Image.network('https://via.placeholder.com/600x300', fit: BoxFit.cover),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 10),
                Text('Permanent'),
                Spacer(),
                Text('8 months'),
              ],
            ),
            const SizedBox(height: 5),
            const Text('since 25 december 2018 to 24 february 2024'),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 10),
                Text('15 rue Cuvier, Lyon - Rhône, France'),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Permanent artists', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Column(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Text('A')),
                  title: Text('LEPETIROI'),
                  subtitle: Text('Naïma Riou'),
                ),
                ListTile(
                  leading: CircleAvatar(child: Text('A')),
                  title: Text('Semper Eadem'),
                  subtitle: Text('Camilia'),
                ),
                ListTile(
                  leading: CircleAvatar(child: Text('A')),
                  title: Text('Didolido'),
                  subtitle: Text(''),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Availabilities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Monday'),
            const Text('10:00 - 13:30\n15:00 - 18:30'),
            const SizedBox(height: 10),
            const Text('Tuesday'),
            const Text('Not available.'),
            const SizedBox(height: 10),
            const Text('Wednesday'),
            const Text('Not available.'),
            const SizedBox(height: 10),
            const Text('Thursday'),
            const Text('10:00 - 13:30\n10:00 - 13:30'),
            const SizedBox(height: 10),
            const Text('Friday'),
            const Text('10:00 - 13:30\n10:00 - 13:30'),
            const SizedBox(height: 10),
            const Text('Saturday'),
            const Text('Not available.'),
            const SizedBox(height: 10),
            const Text('Sunday'),
            const Text('Not available.'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement save logic
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Save'),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Implement cancel logic
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    side: const BorderSide(color: Colors.purple),
                  ),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

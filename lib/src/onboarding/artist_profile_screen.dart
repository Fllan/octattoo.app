import 'package:flutter/material.dart';

class ArtistProfileScreen extends StatelessWidget {
  const ArtistProfileScreen({super.key});

  final bool showRealNames = false;
  final bool showPronoun = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Artist Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'First let’s set your public artist identity',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Your artist name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('I want to show my real names'),
              value: showRealNames,
              onChanged: (value) {},
            ),
            if (showRealNames) ...[
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Firstname',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Lastname',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
            SwitchListTile(
              title: const Text('I want to show my pronoun'),
              value: showPronoun,
              onChanged: (value) {},
            ),
            if (showPronoun) ...[
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Pronoun',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement continue logic
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Continue'),
            ),
          ],
        ),
      );
  }
}

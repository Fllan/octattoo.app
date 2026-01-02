import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/router/routes.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class WorkplacesScreen extends StatelessWidget {
  const WorkplacesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MaterialText.titleLarge('Workplaces', context),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialText.bodyMedium(
                'Workplaces Screen - Coming Soon',
                context,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => AddWorkplaceRoute().go(context),
                child: const Text('Add Workplace'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () =>
                    WorkplaceDetailsRoute(id: 'test-workplace-1').go(context),
                child: const Text('View Workplace Details'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => EditWorkplaceRoute(
                  workplaceId: 'test-workplace-1',
                ).go(context),
                child: const Text('Edit Workplace'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

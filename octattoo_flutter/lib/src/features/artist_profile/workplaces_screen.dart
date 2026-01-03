import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/router/routes.dart';
import 'package:octattoo_flutter/src/features/workplaces/add_workplace.dart';

class WorkplacesScreen extends StatelessWidget {
  const WorkplacesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AddWorkplace(),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () => WorkplaceDetailsRoute(id: 'test-workplace-1').go(context),
              child: const Text('View Workplace Details'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () => EditWorkplaceRoute(workplaceId: 'test-workplace-1').go(context),
              child: const Text('Edit Workplace'),
            ),
          ],
        ),
      ),
    );
  }
}

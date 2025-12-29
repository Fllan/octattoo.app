import 'package:flutter/material.dart';
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
          crossAxisAlignment: .center,
          children: [
            AddWorkplace(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:octattoo_app_mvp/core/constants/worplace_types.dart';

class WorkplaceAvailabilitiesScreen extends StatefulWidget {
  final WorkplaceTypes workplaceType;
  const WorkplaceAvailabilitiesScreen({super.key, required this.workplaceType});

  @override
  State<WorkplaceAvailabilitiesScreen> createState() =>
      _WorkplaceAvailabilitiesScreenState();
}

class _WorkplaceAvailabilitiesScreenState
    extends State<WorkplaceAvailabilitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

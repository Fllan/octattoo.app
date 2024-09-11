import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/router/app_routes.dart';

class Appointments extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey<String>('appointments'),
      itemCount: 103,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
          onTap: () => context.goNamed(
            AppRoutes.appointmentDetails.name,
            pathParameters: {'id': '$index'},
          ),
        );
      },
    );
  }
}

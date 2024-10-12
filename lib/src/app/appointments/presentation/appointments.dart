import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/router/routes/app_routes.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      key: const PageStorageKey('appointmentsList'),
      itemCount: 103,
      itemBuilder: (context, index) {
        return ListTile(
          key: ValueKey('appointment_$index'),
          title: Text('Item $index'),
          onTap: () => context.goNamed(
            AppRoutes.appointmentDetails.name,
            pathParameters: {'id': '$index'},
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

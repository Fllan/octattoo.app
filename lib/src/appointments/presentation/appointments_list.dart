import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/window_size_class.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/appointments/application/appointment_provider.dart';

class AppointmentsList extends ConsumerWidget {
  const AppointmentsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.d('AppointmentsList: build');
    final appointmentsList = ref.watch(appointmentListProvider);
    final selectedAppointment = ref.watch(selectedAppointmentProvider);

    return ListView.builder(
      itemCount: appointmentsList.length,
      itemBuilder: (context, index) {
        final appointment = appointmentsList[index];
        final currentWidth = MediaQuery.sizeOf(context).width;
        final isCompactOrMediumScaffold =
            currentWidth <= WindowSizeClass.medium.endWidthRange;

        final isSelected = selectedAppointment?.id == appointment.id;

        return ListTile(
          title: Text(appointment.name),
          subtitle: Text(appointment.customer.name),
          selected: isCompactOrMediumScaffold ? false : isSelected,
          onTap: () {
            ref.read(selectedAppointmentProvider.notifier).state = appointment;
            context.goNamed(
              'appointmentDetails',
              pathParameters: {'idAppointment': appointment.id.toString()},
            );
          },
        );
      },
    );
  }
}

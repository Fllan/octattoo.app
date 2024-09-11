import 'package:flutter/material.dart';

class AppointmentDetails extends StatefulWidget {
  final String idAppointment;
  const AppointmentDetails({super.key, required this.idAppointment});

  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          key: ValueKey(widget.idAppointment),
          'Appointment detail with id : ${widget.idAppointment}'),
    );
  }
}

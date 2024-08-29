import 'package:octattoo_app/src/appointments/application/appointment.dart';
import 'package:octattoo_app/src/customers/data/customers_data.dart';

final List<Appointment> appointmentsList = List.generate(
  20,
  (index) => Appointment(
    customer: customersList[index % customersList.length],
    id: index + 1,
    name: 'Appointment ${index + 1}',
    startDate: DateTime.now().add(Duration(days: index)),
    endDate: DateTime.now().add(Duration(days: index, hours: 1)),
    location: '${index + 1} Main St',
    notes: 'Notes for appointment ${index + 1}',
  ),
);

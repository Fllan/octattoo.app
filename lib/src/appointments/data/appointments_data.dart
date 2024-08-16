import 'package:octattoo_app/src/customers/data/customers_data.dart';

class Appointments {
  final int id;
  final String name;
  final Customer customer;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final String notes;

  Appointments(
      this.customer, this.startDate, this.endDate, this.location, this.notes,
      {required this.id, required this.name});
}

final List<Appointments> appointmentsList = List.generate(
  20,
  (index) => Appointments(
    customersList[index % customersList.length],
    DateTime.now().add(Duration(days: index)),
    DateTime.now().add(Duration(days: index, hours: 1)),
    '${index + 1} Main St',
    'Notes for appointment ${index + 1}',
    id: index + 1,
    name: 'Appointment ${index + 1}',
  ),
);

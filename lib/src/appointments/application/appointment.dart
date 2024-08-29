import 'package:octattoo_app/src/customers/application/customer.dart';

class Appointment {
  final int id;
  final String name;
  final Customer customer;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final String notes;

  Appointment({
    required this.id,
    required this.name,
    required this.customer,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.notes,
  });
}

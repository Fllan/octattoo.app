import 'package:octattoo_app/src/appointments/application/appointment.dart';
import 'package:octattoo_app/src/appointments/application/appointment_repository.dart';
import 'package:octattoo_app/src/customers/data/customers_data.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final List<Appointment> _appointmentsList = List.generate(
    20,
    (index) => Appointment(
      id: index + 1,
      name: 'Appointment ${index + 1}',
      customer: customersList[index % customersList.length],
      startDate: DateTime.now().add(Duration(days: index)),
      endDate: DateTime.now().add(Duration(days: index, hours: 1)),
      location: '${index + 1} Main St',
      notes: 'Notes for appointment ${index + 1}',
    ),
  );

  @override
  List<Appointment> getAppointments() => _appointmentsList;

  @override
  Appointment getAppointmentById(int id) {
    return _appointmentsList.firstWhere((appointment) => appointment.id == id);
  }
}

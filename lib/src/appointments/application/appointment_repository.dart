import 'package:octattoo_app/src/appointments/application/appointment.dart';

abstract class AppointmentRepository {
  List<Appointment> getAppointments();
  Appointment getAppointmentById(int id);
}

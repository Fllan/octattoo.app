import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/appointments/application/appointment.dart';
import 'package:octattoo_app/src/appointments/application/appointment_repository.dart';
import 'package:octattoo_app/src/appointments/data/appointment_repository_impl.dart';

final appointmentRepositoryProvider = Provider<AppointmentRepository>((ref) {
  return AppointmentRepositoryImpl();
});

final appointmentListProvider = Provider<List<Appointment>>((ref) {
  final repository = ref.watch(appointmentRepositoryProvider);
  return repository.getAppointments();
});

final selectedAppointmentProvider = StateProvider<Appointment?>((ref) => null);

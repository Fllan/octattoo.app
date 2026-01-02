import 'package:octattoo_flutter/core/base/base_repository.dart';
import 'package:octattoo_flutter/src/features/appointments/data/repositories/appointments_repository.dart';
import 'package:octattoo_flutter/src/features/appointments/domain/models/appointment.dart';

/// Mock implementation of AppointmentsRepository for development.
///
/// This provides fake data and simulates async operations.
/// Replace with a real implementation when backend APIs are ready.
class MockAppointmentsRepository extends BaseRepository
    implements AppointmentsRepository {
  MockAppointmentsRepository();

  final List<Appointment> _appointments = [
    Appointment(
      id: 'apt-1',
      customerId: 'cust-1',
      customerName: 'John Doe',
      dateTime: DateTime.now().add(const Duration(days: 1)),
      description: 'Tribal sleeve tattoo session 1',
      status: AppointmentStatus.confirmed,
    ),
    Appointment(
      id: 'apt-2',
      customerId: 'cust-2',
      customerName: 'Jane Smith',
      dateTime: DateTime.now().add(const Duration(days: 3)),
      description: 'Small flower tattoo',
      status: AppointmentStatus.scheduled,
    ),
    Appointment(
      id: 'apt-3',
      customerId: 'cust-3',
      customerName: 'Bob Johnson',
      dateTime: DateTime.now().add(const Duration(days: 7)),
      description: 'Cover-up consultation',
      status: AppointmentStatus.scheduled,
    ),
  ];

  /// Simulate network delay
  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 500));

  @override
  Future<List<Appointment>> getAppointments() async {
    return executeWithLogging(() async {
      await _delay();
      return List.unmodifiable(_appointments);
    }, 'getAppointments');
  }

  @override
  Future<Appointment?> getAppointmentById(String id) async {
    return executeWithLogging(() async {
      await _delay();
      return _appointments.where((apt) => apt.id == id).firstOrNull;
    }, 'getAppointmentById($id)');
  }

  @override
  Future<Appointment> createAppointment(Appointment appointment) async {
    return executeWithLogging(() async {
      await _delay();
      final newAppointment = appointment.copyWith(
        id: 'apt-${DateTime.now().millisecondsSinceEpoch}',
      );
      _appointments.add(newAppointment);
      return newAppointment;
    }, 'createAppointment');
  }

  @override
  Future<Appointment> updateAppointment(Appointment appointment) async {
    return executeWithLogging(() async {
      await _delay();
      final index = _appointments.indexWhere((apt) => apt.id == appointment.id);
      if (index == -1) {
        throw Exception('Appointment not found: ${appointment.id}');
      }
      _appointments[index] = appointment;
      return appointment;
    }, 'updateAppointment(${appointment.id})');
  }

  @override
  Future<void> deleteAppointment(String id) async {
    return executeWithLogging(() async {
      await _delay();
      _appointments.removeWhere((apt) => apt.id == id);
    }, 'deleteAppointment($id)');
  }

  @override
  Future<List<Appointment>> searchAppointments(String query) async {
    return executeWithLogging(() async {
      await _delay();
      final lowerQuery = query.toLowerCase();
      return _appointments
          .where((apt) =>
              apt.customerName.toLowerCase().contains(lowerQuery) ||
              (apt.description?.toLowerCase().contains(lowerQuery) ?? false))
          .toList();
    }, 'searchAppointments($query)');
  }
}

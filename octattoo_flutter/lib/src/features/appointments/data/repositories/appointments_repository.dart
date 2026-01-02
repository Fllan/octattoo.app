import 'package:octattoo_flutter/src/features/appointments/domain/models/appointment.dart';

/// Repository interface for managing appointments.
///
/// This defines the contract for appointment data operations.
/// Implementations can be real (API-based) or mock (for testing/development).
abstract class AppointmentsRepository {
  /// Fetch all appointments
  Future<List<Appointment>> getAppointments();

  /// Fetch a single appointment by ID
  Future<Appointment?> getAppointmentById(String id);

  /// Create a new appointment
  Future<Appointment> createAppointment(Appointment appointment);

  /// Update an existing appointment
  Future<Appointment> updateAppointment(Appointment appointment);

  /// Delete an appointment
  Future<void> deleteAppointment(String id);

  /// Search appointments by customer name
  Future<List<Appointment>> searchAppointments(String query);
}

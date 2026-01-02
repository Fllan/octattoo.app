import 'package:octattoo_flutter/core/base/base_view_model.dart';
import 'package:octattoo_flutter/src/features/appointments/data/repositories/appointments_repository.dart';
import 'package:octattoo_flutter/src/features/appointments/domain/models/appointment.dart';

/// ViewModel for the appointment details screen.
///
/// Manages the state and business logic for a single appointment.
class AppointmentDetailsViewModel extends BaseViewModel {
  AppointmentDetailsViewModel(this._repository, this.appointmentId);

  final AppointmentsRepository _repository;
  final String appointmentId;
  Appointment? _appointment;

  /// Current appointment
  Appointment? get appointment => _appointment;

  /// Load appointment details
  Future<void> loadAppointment() async {
    await executeAsync(() async {
      _appointment = await _repository.getAppointmentById(appointmentId);
      if (_appointment == null) {
        throw Exception('Appointment not found');
      }
    });
  }

  /// Update appointment status
  Future<void> updateStatus(AppointmentStatus status) async {
    if (_appointment == null) return;

    await executeAsync(() async {
      final updated = _appointment!.copyWith(status: status);
      _appointment = await _repository.updateAppointment(updated);
    });
  }

  /// Cancel appointment
  Future<void> cancelAppointment() async {
    await updateStatus(AppointmentStatus.cancelled);
  }

  /// Confirm appointment
  Future<void> confirmAppointment() async {
    await updateStatus(AppointmentStatus.confirmed);
  }

  /// Complete appointment
  Future<void> completeAppointment() async {
    await updateStatus(AppointmentStatus.completed);
  }
}

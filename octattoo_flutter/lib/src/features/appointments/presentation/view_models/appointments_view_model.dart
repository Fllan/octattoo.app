import 'package:octattoo_flutter/core/base/base_view_model.dart';
import 'package:octattoo_flutter/src/features/appointments/data/repositories/appointments_repository.dart';
import 'package:octattoo_flutter/src/features/appointments/domain/models/appointment.dart';

/// ViewModel for the appointments list screen.
///
/// Manages the state and business logic for displaying appointments.
/// Provides methods to fetch, search, and manage appointments.
class AppointmentsViewModel extends BaseViewModel {
  AppointmentsViewModel(this._repository);

  final AppointmentsRepository _repository;
  List<Appointment> _appointments = [];
  String _searchQuery = '';

  /// All appointments
  List<Appointment> get appointments => List.unmodifiable(_appointments);

  /// Current search query
  String get searchQuery => _searchQuery;

  /// Filtered appointments based on search
  List<Appointment> get filteredAppointments {
    if (_searchQuery.isEmpty) {
      return appointments;
    }
    final query = _searchQuery.toLowerCase();
    return _appointments
        .where((apt) =>
            apt.customerName.toLowerCase().contains(query) ||
            (apt.description?.toLowerCase().contains(query) ?? false))
        .toList();
  }

  /// Load all appointments
  Future<void> loadAppointments() async {
    await executeAsync(() async {
      _appointments = await _repository.getAppointments();
    });
  }

  /// Search appointments by query
  Future<void> searchAppointments(String query) async {
    _searchQuery = query;
    notifyListeners();

    if (query.isEmpty) {
      await loadAppointments();
    } else {
      await executeAsync(() async {
        _appointments = await _repository.searchAppointments(query);
      });
    }
  }

  /// Clear search
  void clearSearch() {
    _searchQuery = '';
    notifyListeners();
  }

  /// Refresh appointments
  Future<void> refresh() => loadAppointments();

  /// Delete an appointment
  Future<void> deleteAppointment(String id) async {
    await executeAsync(() async {
      await _repository.deleteAppointment(id);
      await loadAppointments();
    });
  }
}

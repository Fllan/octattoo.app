import 'package:flutter/foundation.dart';

/// Represents an appointment in the tattoo studio.
///
/// This is an immutable domain model that represents the business entity.
/// It uses the copyWith pattern for creating modified copies.
@immutable
class Appointment {
  const Appointment({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.dateTime,
    this.description,
    this.duration = const Duration(hours: 2),
    this.status = AppointmentStatus.scheduled,
  });

  final String id;
  final String customerId;
  final String customerName;
  final DateTime dateTime;
  final String? description;
  final Duration duration;
  final AppointmentStatus status;

  /// Create a copy with modified fields
  Appointment copyWith({
    String? id,
    String? customerId,
    String? customerName,
    DateTime? dateTime,
    String? description,
    Duration? duration,
    AppointmentStatus? status,
  }) {
    return Appointment(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      dateTime: dateTime ?? this.dateTime,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Appointment && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// Status of an appointment
enum AppointmentStatus {
  scheduled,
  confirmed,
  inProgress,
  completed,
  cancelled,
}

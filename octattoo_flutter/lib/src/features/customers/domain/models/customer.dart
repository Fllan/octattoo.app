import 'package:flutter/foundation.dart';

/// Represents a customer in the tattoo studio.
@immutable
class Customer {
  const Customer({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.notes,
    this.dateAdded,
  });

  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? notes;
  final DateTime? dateAdded;

  Customer copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? notes,
    DateTime? dateAdded,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      notes: notes ?? this.notes,
      dateAdded: dateAdded ?? this.dateAdded,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Customer && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

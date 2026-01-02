import 'package:flutter/foundation.dart';

/// Represents a tattoo project.
@immutable
class Project {
  const Project({
    required this.id,
    required this.title,
    required this.customerId,
    required this.customerName,
    this.description,
    this.status = ProjectStatus.planning,
    this.imageUrls = const [],
  });

  final String id;
  final String title;
  final String customerId;
  final String customerName;
  final String? description;
  final ProjectStatus status;
  final List<String> imageUrls;

  Project copyWith({
    String? id,
    String? title,
    String? customerId,
    String? customerName,
    String? description,
    ProjectStatus? status,
    List<String>? imageUrls,
  }) {
    return Project(
      id: id ?? this.id,
      title: title ?? this.title,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      description: description ?? this.description,
      status: status ?? this.status,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Project && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

enum ProjectStatus {
  planning,
  inProgress,
  completed,
  cancelled,
}

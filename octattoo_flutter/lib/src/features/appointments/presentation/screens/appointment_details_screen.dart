import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/features/appointments/data/repositories/mock_appointments_repository.dart';
import 'package:octattoo_flutter/src/features/appointments/domain/models/appointment.dart';
import 'package:octattoo_flutter/src/features/appointments/presentation/view_models/appointment_details_view_model.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

/// Appointment details screen following MVVM pattern.
class AppointmentDetailsScreen extends StatefulWidget {
  const AppointmentDetailsScreen({
    super.key,
    required this.appointmentId,
  });

  final String appointmentId;

  @override
  State<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  late final AppointmentDetailsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = AppointmentDetailsViewModel(
      MockAppointmentsRepository(),
      widget.appointmentId,
    );
    _viewModel.loadAppointment();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Details'),
      ),
      body: ListenableBuilder(
        listenable: _viewModel,
        builder: (context, _) {
          if (_viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_viewModel.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(_viewModel.errorMessage ?? 'An error occurred'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _viewModel.loadAppointment,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final appointment = _viewModel.appointment;
          if (appointment == null) {
            return const Center(
              child: Text('Appointment not found'),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatusCard(context, appointment),
                const SizedBox(height: 16),
                _buildInfoCard(context, appointment),
                const SizedBox(height: 16),
                _buildActionsCard(context, appointment),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context, Appointment appointment) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialText.titleMedium('Status', context),
            const SizedBox(height: 12),
            _StatusChip(status: appointment.status),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, Appointment appointment) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialText.titleMedium('Information', context),
            const SizedBox(height: 16),
            _InfoRow(
              icon: Icons.person,
              label: 'Customer',
              value: appointment.customerName,
            ),
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.calendar_today,
              label: 'Date',
              value: _formatDate(appointment.dateTime),
            ),
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.access_time,
              label: 'Time',
              value: _formatTime(appointment.dateTime),
            ),
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.timer,
              label: 'Duration',
              value: _formatDuration(appointment.duration),
            ),
            if (appointment.description != null) ...[
              const SizedBox(height: 12),
              _InfoRow(
                icon: Icons.description,
                label: 'Description',
                value: appointment.description!,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildActionsCard(BuildContext context, Appointment appointment) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialText.titleMedium('Actions', context),
            const SizedBox(height: 16),
            if (appointment.status == AppointmentStatus.scheduled) ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _viewModel.confirmAppointment,
                  icon: const Icon(Icons.check_circle),
                  label: const Text('Confirm Appointment'),
                ),
              ),
              const SizedBox(height: 8),
            ],
            if (appointment.status == AppointmentStatus.confirmed) ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _viewModel.completeAppointment,
                  icon: const Icon(Icons.done_all),
                  label: const Text('Mark as Completed'),
                ),
              ),
              const SizedBox(height: 8),
            ],
            if (appointment.status != AppointmentStatus.cancelled &&
                appointment.status != AppointmentStatus.completed) ...[
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _viewModel.cancelAppointment,
                  icon: const Icon(Icons.cancel),
                  label: const Text('Cancel Appointment'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    if (hours > 0 && minutes > 0) {
      return '${hours}h ${minutes}min';
    } else if (hours > 0) {
      return '${hours}h';
    } else {
      return '${minutes}min';
    }
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final AppointmentStatus status;

  @override
  Widget build(BuildContext context) {
    final (color, icon, text) = _getStatusInfo(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  (Color, IconData, String) _getStatusInfo(AppointmentStatus status) {
    return switch (status) {
      AppointmentStatus.scheduled => (
          Colors.blue,
          Icons.schedule,
          'Scheduled'
        ),
      AppointmentStatus.confirmed => (
          Colors.green,
          Icons.check_circle,
          'Confirmed'
        ),
      AppointmentStatus.inProgress => (
          Colors.orange,
          Icons.pending,
          'In Progress'
        ),
      AppointmentStatus.completed => (
          Colors.purple,
          Icons.done_all,
          'Completed'
        ),
      AppointmentStatus.cancelled => (Colors.red, Icons.cancel, 'Cancelled'),
    };
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

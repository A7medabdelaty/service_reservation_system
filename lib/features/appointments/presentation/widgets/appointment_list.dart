import 'package:flutter/material.dart';
import 'package:service_reservation_system/features/appointments/presentation/widgets/appointment_card.dart';

class AppointmentList extends StatelessWidget {
  final bool isActive;

  const AppointmentList({super.key, this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _getItemCount(),
      itemBuilder: (context, index) => _buildAppointmentCard(index),
    );
  }

  int _getItemCount() => isActive ? 2 : 3;

  AppointmentCard _buildAppointmentCard(int index) {
    if (!isActive) {
      return _buildPreviewCard(index);
    }
    return _buildActiveCard();
  }

  AppointmentCard _buildPreviewCard(int index) {
    final daysAgo = _getDaysAgo(index);
    final time = _getPreviewTime(index);

    return AppointmentCard(
      doctorName: 'Dr Denies Martine',
      specialty: 'Cardiologist',
      date: '15/02/2026',
      time: time,
      location: 'Serum Clinic, Rose Dam, Near Police Station, West Ham',
      showActions: false,
      daysAgo: daysAgo,
    );
  }

  AppointmentCard _buildActiveCard() {
    return AppointmentCard(
      doctorName: 'Dr. Denies Martine',
      specialty: 'Cardiologist',
      date: '15/02/2026',
      time: '08:30 AM',
      location: 'Serum Clinic, Rose Dam, Near Police Station, West Ham',
      showActions: true,
      onReschedule: _handleReschedule,
      onCancel: _handleCancel,
    );
  }

  String _getPreviewTime(int index) {
    switch (index) {
      case 0:
        return '08:30 AM';
      case 1:
        return '32';
      default:
        return '';
    }
  }

  int _getDaysAgo(int index) {
    switch (index) {
      case 0:
        return 3;
      case 1:
        return 8;
      default:
        return 12;
    }
  }

  void _handleReschedule() {
    // Handle reschedule
  }

  void _handleCancel() {
    // Handle cancel
  }
}

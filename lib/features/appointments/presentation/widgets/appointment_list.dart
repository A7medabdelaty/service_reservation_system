import 'package:flutter/material.dart';
import 'package:service_reservation_system/features/appointments/presentation/widgets/appointment_card.dart';

class AppointmentList extends StatelessWidget {
  final bool isActive;

  const AppointmentList({super.key, this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: 2, // Replace with actual data length
      itemBuilder: (context, index) {
        return AppointmentCard(
          doctorName: 'Dr. Denies Martine',
          specialty: 'Cardiologist',
          date: '15/02/2026',
          time: '08:30 AM',
          location: 'Serum Clinic, Rose Dam, Near Police Station, West Ham',
          showActions: isActive,
          onReschedule:
              isActive
                  ? () {
                    // Handle reschedule
                  }
                  : null,
          onCancel:
              isActive
                  ? () {
                    // Handle cancel
                  }
                  : null,
        );
      },
    );
  }
}

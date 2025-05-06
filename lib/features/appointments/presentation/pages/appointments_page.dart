import 'package:flutter/material.dart';
import 'package:service_reservation_system/features/appointments/presentation/widgets/appointment_list.dart';
import 'package:service_reservation_system/features/appointments/presentation/widgets/appointments_tab_bar.dart';

class MyAppointmentsPage extends StatelessWidget {
  const MyAppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Appointments'),
          bottom: const AppointmentsTabBar(),
        ),
        body: const TabBarView(
          children: [
            AppointmentList(isActive: true),
            AppointmentList(isActive: false),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EmptyAppointments extends StatelessWidget {
  const EmptyAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No previous appointments.'));
  }
}

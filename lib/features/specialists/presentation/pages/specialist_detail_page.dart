import 'package:flutter/material.dart';

class SpecialistDetailPage extends StatelessWidget {
  final String specialistId;

  const SpecialistDetailPage({super.key, required this.specialistId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Specialist Detail Page - ID: $specialistId')),
    );
  }
}

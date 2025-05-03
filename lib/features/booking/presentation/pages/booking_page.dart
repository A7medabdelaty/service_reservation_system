import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  final String specialistId;
  final DateTime dateTime;

  const BookingPage({
    super.key,
    required this.specialistId,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Booking Page\nSpecialist: $specialistId\nTime: $dateTime'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TopSpecialties extends StatelessWidget {
  const TopSpecialties({super.key});

  @override
  Widget build(BuildContext context) {
    final specialties = [
      'General',
      'Neurologist',
      'Cardiology',
      'ENT',
      'Dentist',
      'Gynecologist',
      'Pediatrician',
      'Urologist',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Top Specialties'),
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: specialties.length,
            itemBuilder:
                (_, index) => _SpecialtyItem(title: specialties[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Text('View All', style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}

class _SpecialtyItem extends StatelessWidget {
  final String title;

  const _SpecialtyItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CircleAvatar(radius: 24, backgroundColor: Colors.blue),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

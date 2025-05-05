import 'package:flutter/material.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSectionHeader('Top Doctors'),
        ...List.generate(3, (index) => const DoctorCard()),
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

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/doctor.png'),
          radius: 30,
        ),
        title: const Text('Dr. Denies Martine\nMBBS, MD\nCardiologist'),
        subtitle: const Text('10+ years experience\nApollo Hospital, Delhi'),
        trailing: Column(
          children: const [
            Icon(Icons.star, color: Colors.orange),
            Text('₹500'),
          ],
        ),
      ),
    );
  }
}

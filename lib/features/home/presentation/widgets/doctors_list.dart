import 'package:flutter/material.dart';
import 'package:service_reservation_system/core/constants/asset_paths.dart';
import 'package:service_reservation_system/core/widgets/app_image.dart';
import 'package:service_reservation_system/core/widgets/section_header.dart';
import 'package:service_reservation_system/features/doctors/presentation/pages/doctor_details_page.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Top Doctors',
          onViewAllTap: () {
            // Handle view all tap
          },
        ),
        ...List.generate(3, (index) => const DoctorCard()),
      ],
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
          radius: 30,
          child: AppImage(
            path: AssetPaths.doctorPlaceholder,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: const Text('Dr. Denies Martine\nMBBS, MD\nCardiologist'),
        subtitle: const Text('10+ years experience\nApollo Hospital, Delhi'),
        trailing: Column(
          children: const [
            Icon(Icons.star, color: Colors.orange),
            Text('₹500'),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DoctorDetailsPage()),
          );
        },
      ),
    );
  }
}

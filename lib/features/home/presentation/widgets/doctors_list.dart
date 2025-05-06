import 'package:flutter/material.dart';
import 'package:service_reservation_system/core/constants/asset_paths.dart';
import 'package:service_reservation_system/core/widgets/section_header.dart';
import 'package:service_reservation_system/features/doctors/presentation/pages/doctor_details_page.dart';
import 'package:service_reservation_system/features/doctors/presentation/widgets/doctor_card.dart';

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
        ...List.generate(
          3,
          (index) => DoctorCard(
            name: 'Dr Denies Martine',
            qualifications: 'MBBS, MD',
            specialty: 'Cardiologist',
            experience: '42 Year Experience',
            hospital: 'Apollo Hospital',
            location: 'West Ham',
            rating: 4.5,
            consultingFee: 500,
            imageUrl: AssetPaths.doctorPlaceholder,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoctorDetailsPage(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

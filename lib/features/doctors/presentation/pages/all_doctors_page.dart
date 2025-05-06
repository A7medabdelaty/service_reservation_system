import 'package:flutter/material.dart';
import 'package:service_reservation_system/core/constants/asset_paths.dart';
import 'package:service_reservation_system/features/doctors/presentation/pages/doctor_details_page.dart';

import '../widgets/doctor_card.dart';
import '../widgets/doctors_search_bar.dart';

class AllDoctorsPage extends StatelessWidget {
  const AllDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Doctors'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle menu action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          DoctorsSearchBar(
            location: 'West Ham',
            onLocationTap: () {
              // Handle location selection
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Replace with actual data length
              itemBuilder: (context, index) {
                return DoctorCard(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:service_reservation_system/core/constants/asset_paths.dart';
import 'package:service_reservation_system/core/widgets/app_image.dart';
import 'package:service_reservation_system/features/appointments/presentation/pages/booking_page.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Dr Denies Martine'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDoctorHeader(),
            _buildClinicSection(),
            _buildAboutSection(),
            _buildReviewsSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomButtons(context),
    );
  }

  Widget _buildDoctorHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            child: AppImage(
              path: AssetPaths.doctorPlaceholder,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dr Denies Martine',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'MBBS, MD',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text('Cardiologist'),
                const Text('42 Year Experience'),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    const Expanded(
                      child: Text(
                        'Apollo Hospital, West Ham',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Text('4.5'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClinicSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Clinic Visit', style: TextStyle(color: Colors.white)),
                Text(
                  'Consulting Fee: ₹500',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Clinic Address:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('Serum Clinic, Rose Dam,\nNear Police Station, West Ham'),
                SizedBox(height: 8),
                Text(
                  '• Free Consult Follow-Up 7 Days Post Consultation',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'About Doctor',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'A Career As A Doctor Is A Clinical Professional That Involves Providing Services In Healthcare Facilities. Individuals In The Doctor\'s Career Path Are Responsible For Diagnosing, Examining, And Identifying Diseases, Disorders, And Illnesses Of Patients.',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Reviews (23)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildReviewCard(),
          _buildReviewCard(),
        ],
      ),
    );
  }

  Widget _buildReviewCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://placeholder.com/user'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Sam Curren',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('12/12/2023', style: TextStyle(color: Colors.grey)),
                ],
              ),
              const Spacer(),
              Row(
                children: const [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star_half, color: Colors.amber, size: 16),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Responsible For Diagnosing, Examining Diseases, Disorders, And Illnesses Of Patients.',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                // Handle chat action
              },
              child: const Text('Chat'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => BookingPage(
                          doctorId:
                              'doctor_id', // Replace with actual doctor ID
                          doctorName: 'Dr Denies Martine',
                          specialty: 'Cardiologist',
                          location:
                              'Serum Clinic, Rose Dam, Near Police Station, West Ham',
                          consultingFee: 500,
                        ),
                  ),
                );
              },
              child: const Text('Book Now'),
            ),
          ),
        ],
      ),
    );
  }
}

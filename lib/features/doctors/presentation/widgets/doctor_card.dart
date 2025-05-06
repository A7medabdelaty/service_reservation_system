import 'package:flutter/material.dart';
import 'package:service_reservation_system/core/widgets/app_image.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String qualifications;
  final String specialty;
  final String experience;
  final String hospital;
  final String location;
  final double rating;
  final double consultingFee;
  final String imageUrl;
  final VoidCallback? onTap;

  const DoctorCard({
    super.key,
    required this.name,
    required this.qualifications,
    required this.specialty,
    required this.experience,
    required this.hospital,
    required this.location,
    required this.rating,
    required this.consultingFee,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                child: AppImage(
                  path: imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            Text(rating.toString()),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      qualifications,
                      style: const TextStyle(color: Colors.teal),
                    ),
                    Text(specialty, style: const TextStyle(color: Colors.grey)),
                    Text('$experience Experience'),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Text(
                            '$hospital, $location',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text(
                          'Consulting Fee',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '₹${consultingFee.toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

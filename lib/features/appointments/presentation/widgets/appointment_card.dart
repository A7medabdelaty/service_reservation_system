import 'package:flutter/material.dart';
import 'package:service_reservation_system/core/constants/asset_paths.dart';
import 'package:service_reservation_system/core/widgets/app_image.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String date;
  final String time;
  final String location;
  final String imageUrl;
  final VoidCallback? onReschedule;
  final VoidCallback? onCancel;
  final bool showActions;

  const AppointmentCard({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
    required this.location,
    this.imageUrl = AssetPaths.doctorPlaceholder,
    this.onReschedule,
    this.onCancel,
    this.showActions = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: AppImage(
                path: imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              doctorName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(specialty),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(Icons.calendar_today, date),
                const SizedBox(height: 8),
                _buildInfoRow(Icons.access_time, time),
                const SizedBox(height: 8),
                _buildInfoRow(Icons.location_on, location),
              ],
            ),
          ),
          if (showActions) ...[
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: onReschedule,
                    style: TextButton.styleFrom(foregroundColor: Colors.green),
                    child: const Text('Reschedule'),
                  ),
                  TextButton(
                    onPressed: onCancel,
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

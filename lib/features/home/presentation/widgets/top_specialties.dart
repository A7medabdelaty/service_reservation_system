import 'package:flutter/material.dart';
import 'package:service_reservation_system/core/constants/asset_paths.dart';
import 'package:service_reservation_system/core/widgets/app_image.dart';
import 'package:service_reservation_system/core/widgets/section_header.dart';

class TopSpecialties extends StatelessWidget {
  const TopSpecialties({super.key});

  @override
  Widget build(BuildContext context) {
    final specialties = [
      {'title': 'General', 'image': AssetPaths.topSpecialties[0]},
      {'title': 'Nephrologist', 'image': AssetPaths.topSpecialties[1]},
      {'title': 'Cardiology', 'image': AssetPaths.topSpecialties[2]},
      {'title': 'Neurologist', 'image': AssetPaths.topSpecialties[3]},
      {'title': 'Dentist', 'image': AssetPaths.topSpecialties[4]},
      {'title': 'Gynecologist', 'image': AssetPaths.topSpecialties[5]},
      {'title': 'Pediatrician', 'image': AssetPaths.topSpecialties[6]},
      {'title': 'G Surgeon', 'image': AssetPaths.topSpecialties[7]},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Top Specialties',
          onViewAllTap: () {
            // Handle view all tap
          },
        ),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.75, // Adjusted for more vertical space
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: specialties.length,
          itemBuilder:
              (_, index) => _SpecialtyItem(
                title: specialties[index]['title']!,
                imagePath: specialties[index]['image']!,
              ),
        ),
      ],
    );
  }
}

class _SpecialtyItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const _SpecialtyItem({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[100],
          ),
          clipBehavior: Clip.antiAlias,
          child: AppImage(path: imagePath, fit: BoxFit.cover),
        ),
        const SizedBox(height: 6),
        Flexible(
          child: Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

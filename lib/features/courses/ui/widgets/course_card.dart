import 'package:droosy_app/core/routing/app_routes.dart' show AppRoutes;
import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.accent,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // TODO: Handle course tap
            Get.toNamed(AppRoutes.courseDetails);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image(
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/course.jpeg'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Photoshop Design Social Media for Beginners',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    Text(
                      'Instructor Name',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.secondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '4.5',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.secondary),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.access_time,
                          size: 16,
                          color: AppColors.secondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '2h 30m',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.secondary),
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

import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CourseDetailsAppBar extends StatelessWidget {
  // final String imageUrl;
  final double expandedHeight;
  const CourseDetailsAppBar({
    super.key,
    // required this.imageUrl,
    this.expandedHeight = 250,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.primary,
      expandedHeight: expandedHeight,
      pinned: true,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.accent.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Image.asset(
              'assets/images/course.jpeg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

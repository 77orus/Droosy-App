import 'package:droosy_app/core/routing/app_routes.dart';
import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:droosy_app/features/courses/ui/widgets/course_details/action_buttons.dart';
import 'package:droosy_app/features/courses/ui/widgets/course_details/course_details_app_bar.dart';
import 'package:droosy_app/features/courses/ui/widgets/course_details/course_info_card.dart';
import 'package:droosy_app/features/courses/ui/widgets/course_details/lessons_list.dart';
import 'package:droosy_app/features/courses/ui/widgets/course_details/reviews_sevtion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CourseDetailsAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Introduction to Flutter",
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        "4.5",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "(50 reviews)",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Free",
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Master Flutter and dart from scratch to build read world cross platform apps",
                    style: theme.textTheme.bodyLarge,
                  ),
                  const CourseInfoCard(),
                  const SizedBox(height: 24),
                  Text(
                    'Course Content',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const LessonsList(isUnlocked: true),
                  const SizedBox(height: 24),
                  const ReviewsSection(),
                  const SizedBox(height: 24),
                  const ActionButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.all(16),
          ),
          onPressed: () {
            //! Navigate to payment screen
            Get.toNamed(AppRoutes.payment);
          },
          child: const Text("Buy Now for \$99"),
        ),
      ),
    );
  }
}

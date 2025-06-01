import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:droosy_app/features/courses/ui/widgets/course_card.dart';
import 'package:droosy_app/features/courses/ui/widgets/course_filter_dialog.dart';
import 'package:droosy_app/features/courses/ui/widgets/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),

        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primary,
            expandedHeight: 200,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () => _showFilterDialog(context),
                icon: const Icon(Icons.filter_list, color: AppColors.accent),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              title: Text(
                "All Courses",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.accent,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.primary, AppColors.primaryLight],
                  ),
                ),
              ),
            ),
          ),
          if (isEmpty == true)
            SliverFillRemaining(
              child: EmptyStateWidget(onActionPressed: Get.back),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const CourseCard(),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const CourseFilterDialog(),
    );
  }
}

import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CourseInfoCard extends StatelessWidget {
  const CourseInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoItem(context, Icons.people, '1200+', 'Students'),
                _buildInfoItem(context, Icons.star, '4.9', '245 Reviews'),
                _buildInfoItem(context, Icons.library_books, '20', 'Lessons'),
                _buildInfoItem(
                  context,
                  Icons.signal_cellular_alt,
                  "Beginner",
                  "Level",
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildSectionTitle(context, "Requirements"),
            const SizedBox(height: 16),
            _buildRequirementItem(context, 'Basic knowledge of Flutter'),
            _buildRequirementItem(context, 'Basic knowledge of Dart'),
            _buildRequirementItem(context, 'Basic knowledge of Git'),
            const SizedBox(height: 16),
            _buildSectionTitle(context, "What you'll learn"),
            const SizedBox(height: 16),
            _buildLearningItem(context, 'Build a Flutter app from scratch'),
            _buildLearningItem(context, 'Learn the basics of Flutter'),
            _buildLearningItem(context, 'Learn the basics of Dart'),
            _buildLearningItem(context, 'Learn the basics of Git'),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          value,
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildRequirementItem(BuildContext context, String requirement) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 4),
      child: Row(
        children: [
          const Text('. ', style: TextStyle(color: AppColors.primary)),
          Text(requirement, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildLearningItem(BuildContext context, String learning) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 4),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: AppColors.primary,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(learning, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

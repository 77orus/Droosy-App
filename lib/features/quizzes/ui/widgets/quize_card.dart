import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class QuizeCard extends StatelessWidget {
  const QuizeCard({super.key, required this.theme, required this.index});

  final ThemeData theme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // TODO: Handle quiz tap
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flutter Basics Quiz ${index + 1}',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Description of quiz ${index + 1}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildQuizeStatus(
                      icon: Icons.quiz_outlined,
                      title: '${index + 1} Questions',
                      index: index,
                      theme: theme,
                    ),
                    _buildQuizeStatus(
                      icon: Icons.timer_outlined,
                      title: '1:00:00',
                      index: index,
                      theme: theme,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _buildQuizeStatus extends StatelessWidget {
  const _buildQuizeStatus({
    super.key,
    required this.index,
    required this.theme,
    required this.icon,
    required this.title,
  });

  final int index;
  final ThemeData theme;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.secondary),
        const SizedBox(width: 8),
        Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }
}

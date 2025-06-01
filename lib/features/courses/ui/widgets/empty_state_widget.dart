import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onActionPressed;
  final String? actionText;
  final IconData icon;
  const EmptyStateWidget({
    super.key,
    this.title = "No Courses Found",
    this.message = "There are no courses available in this category yet.",
    this.onActionPressed,
    this.actionText = "Go Back",
    this.icon = Icons.school_outlined,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100, color: AppColors.primary.withOpacity(0.5)),
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.secondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: onActionPressed ?? () => Get.back(),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            label: Text(actionText ?? "Go Back"),
          ),
        ],
      ),
    );
  }
}

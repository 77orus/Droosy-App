import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CourseFilterDialog extends StatelessWidget {
  const CourseFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Filter Courses",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          _buildFilterOption(context, "All Levels", false),
          _buildFilterOption(context, "Beginner", true),
          _buildFilterOption(context, "Intermediate", false),
          _buildFilterOption(context, "Advanced", false),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Apply"),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Reset"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOption(
    BuildContext context,
    String title,
    bool isSelected,
  ) {
    return ListTile(
      title: Text(title),
      trailing:
          isSelected
              ? const Icon(Icons.check_circle, color: AppColors.primary)
              : const Icon(
                Icons.radio_button_unchecked,
                color: AppColors.primary,
              ),
      onTap: () {
        //! Handle filter option selection
        Navigator.pop(context);
      },
    );
  }
}

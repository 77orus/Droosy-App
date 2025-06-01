import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:droosy_app/features/courses/ui/widgets/course_details/review_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsSection extends StatelessWidget {
  // final String courseId; // Add courseId as a parameter
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Reviews",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            TextButton.icon(
              onPressed: () {
                final result = Get.dialog<Map<String, dynamic>>(
                  const ReviewDialog(),
                );
                Get.snackbar(
                  "Success",
                  "Thank you for your review!",
                  backgroundColor: AppColors.primary,
                );
              },
              icon: const Icon(Icons.rate_review),
              label: const Text("Add Review"),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder:
              (context, index) => const ReviewCard(
                name: "User Name",
                comment: "This is a sample review comment.",
                rating: 4.5,
                date: "2 days ago",
              ),
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String comment;
  final double rating;
  final String date;

  const ReviewCard({
    super.key,
    required this.name,
    required this.comment,
    required this.rating,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),

            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Text(
                  name[0].toUpperCase().toString(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        ...List.generate(5, (index) {
                          return Icon(
                            index < rating.floor()
                                ? Icons.star
                                : Icons.star_border,
                            color: AppColors.primary,
                            size: 16,
                          );
                        }),
                        const SizedBox(width: 4),
                        Text(
                          date,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.secondary),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    Text(
                      comment,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.play_circle, color: AppColors.accent),
            label: const Text("Start Learning"),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              //! Handle start learning
              // if(course is premimum and course is unlocked){
              //   navigate to payment screen if the course is premium and not purchased
              // } else {
              //   navigate to first lesson of course is free or already purchased
              // }
            },
          ),
        ),
        // only show chat button if course is not premimum  or if its not unlocked
      ],
    );
  }
}

import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SliverAppBar(
      expandedHeight: 180,
      backgroundColor: AppColors.primary,
      pinned: true,
      floating: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.analytics, color: Colors.white),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.accent.withOpacity(0.8),
              ),
            ),
            Text(
              "Hossam Magdy",
              style: theme.textTheme.titleLarge?.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
    );
  }
}

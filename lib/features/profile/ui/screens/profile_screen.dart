import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:droosy_app/features/profile/ui/widgets/profile_app_bar.dart';
import 'package:droosy_app/features/profile/ui/widgets/profile_options.dart';
import 'package:droosy_app/features/profile/ui/widgets/profile_stats_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          ProfileAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ProfileStatsCard(),
                  SizedBox(height: 20),
                  ProfileOptions(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

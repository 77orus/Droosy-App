import 'package:droosy_app/core/routing/app_routes.dart';
import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:droosy_app/core/utils/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileOptionsCard(
          title: "Edit Profile",
          subtitle: "Update your Personal Information",
          icon: Icons.edit_outlined,
          onTap: () {},
        ),
        ProfileOptionsCard(
          title: "Notifications",
          subtitle: "Manage your notification settings",
          icon: Icons.notifications_outlined,
          onTap: () {},
        ),
        ProfileOptionsCard(
          title: "Settings",
          subtitle: "Manage your account settings",
          icon: Icons.settings_outlined,
          isDestructive: true,
          onTap: () {},
        ),
        ProfileOptionsCard(
          title: "Help & Support",
          subtitle: "Get help or contact support",
          icon: Icons.help_outline,
          isDestructive: true,
          onTap: () {},
        ),
        ProfileOptionsCard(
          title: "Logout",
          subtitle: "Sign out of your account",
          icon: Icons.logout_outlined,
          isDestructive: true,
          onTap: () async {
            final confirm = await AppDialogs.showLogoutDialog(context);
            if (confirm == true) {
              Get.offAllNamed(AppRoutes.login);
            }
          },
        ),
      ],
    );
  }
}

class ProfileOptionsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final bool isDestructive;

  const ProfileOptionsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(icon, size: 32, color: AppColors.primary),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),

                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: isDestructive ? Colors.red : AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

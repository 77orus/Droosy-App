import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:droosy_app/features/auth/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: AppColors.primary, size: 64),
            const SizedBox(height: 16),
            Text(
              "Payment Successful!",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Youc can now access the course content.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: "Start Learning",
              onPressed: () => Navigator.pop(context),
              height: 56,
            ),
          ],
        ),
      ),
    );
  }
}

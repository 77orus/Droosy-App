import 'package:droosy_app/features/courses/ui/widgets/payment_widgets/payment_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentService {
  static void PaymentProcess({required GlobalKey<FormState> formKey}) {
    if (formKey.currentState!.validate()) {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      // simulate payment process
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Get.back();

        // add the course to the purchased courses list

        Get.dialog(const PaymentSuccessDialog(), barrierDismissible: false);
      });
    }
  }
}

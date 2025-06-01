import 'package:droosy_app/core/services/payment_service.dart';
import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:droosy_app/features/auth/ui/widgets/custom_button.dart';
import 'package:droosy_app/features/courses/ui/widgets/payment_widgets/order_summary.dart';
import 'package:droosy_app/features/courses/ui/widgets/payment_widgets/payment_fields.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final formKey = GlobalKey<FormState>();
  final cardNumberController = TextEditingController();
  final cvvController = TextEditingController();
  final expiryDateController = TextEditingController();
  final nameOnCardController = TextEditingController();

  final errorStyle = const TextStyle(color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment Screen",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OrderSummary(),
              const SizedBox(height: 16),
              PaymentFields(
                formKey: formKey,
                cardNumberController: cardNumberController,
                cvvController: cvvController,
                expiryDateController: expiryDateController,
                nameOnCardController: nameOnCardController,
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: "Pay Now \$50",
                onPressed: () {
                  PaymentService.PaymentProcess(formKey: formKey);
                },
                isLoading: false,
                height: 56,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

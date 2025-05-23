import 'package:droosy_app/core/utils/validators.dart';
import 'package:droosy_app/core/widgets/custom_text_form_field.dart';
import 'package:droosy_app/features/auth/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _handleForgotPasswordLogic() {
    if (_formKey.currentState!.validate()) {
      Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.mark_email_read_outlined,
                size: 100,
                color: Colors.green,
              ),
              SizedBox(height: 20),
              Text(
                "Check your email!",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 10),
              Text(
                "We have sent a password reset link to your email address.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "OK",
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot Password",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Enter your email address to receive a password reset link.",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 20),
            //! Email Field
            Form(
              key: _formKey,
              child: CustomTextFormField(
                label: "Email",
                hintText: "Enter your email",
                textInputType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                controller: _emailController,
                validator: FormValidators.validateEmail,
              ),
            ),
            SizedBox(height: 30),
            //! Reset Password Button
            CustomButton(
              text: "Reset Password",
              onPressed: _handleForgotPasswordLogic,
            ),
          ],
        ),
      ),
    );
  }
}

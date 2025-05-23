import 'package:droosy_app/core/routing/app_routes.dart';
import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:droosy_app/core/utils/validators.dart';
import 'package:droosy_app/core/widgets/custom_text_form_field.dart';
import 'package:droosy_app/features/auth/models/user_model.dart';
import 'package:droosy_app/features/auth/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  UserRole? selectedRole;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! Wave Container
            Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        const Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        const Text(
                          'Start your learning journey',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 20,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
            //! Froms Fields
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          label: 'Full Name',
                          hintText: 'Enter your name',
                          textInputType: TextInputType.name,
                          prefixIcon: Icons.person_2_outlined,
                          controller: _fullNameController,
                          validator: FormValidators.validateFullName,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          label: 'Email',
                          hintText: 'Enter your email',
                          textInputType: TextInputType.emailAddress,
                          prefixIcon: Icons.email_outlined,
                          controller: _emailController,
                          validator: FormValidators.validateEmail,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          label: 'Password',
                          hintText: 'Enter your password',
                          obscureText: true,
                          textInputType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock_outlined,

                          controller: _passwordController,
                          validator: FormValidators.validatePassword,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          label: 'Confirm Password',
                          hintText: 'Enter your confirm password',
                          obscureText: true,
                          textInputType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock_outlined,

                          controller: _confirmPasswordController,
                          validator:
                              (value) => FormValidators.validateConfirmPassword(
                                value,
                                _passwordController.text,
                              ),
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<UserRole>(
                          value: selectedRole,
                          icon: const Icon(Icons.arrow_drop_down),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person_2_outlined),
                            labelText: 'Role',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),

                          items:
                              UserRole.values.map((role) {
                                return DropdownMenuItem<UserRole>(
                                  value: role,
                                  child: Text(
                                    role.toString().split('.').last.capitalize!,
                                  ),
                                );
                              }).toList(),
                          onChanged: (UserRole? value) {
                            setState(() {
                              selectedRole = value;
                            });
                          },
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          text: 'Register',
                          isLoading: false,
                          onPressed: () {
                            _handleRegisterLogic();
                          },
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account? '),
                            InkWell(
                              onTap: () => Get.offAllNamed(AppRoutes.login),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRegisterLogic() {
    if (formKey.currentState!.validate() && selectedRole != null) {
      if (selectedRole == UserRole.teacher) {
        Get.offAllNamed(AppRoutes.teacherHome);
      } else if (selectedRole == UserRole.student) {
        Get.offAllNamed(AppRoutes.main);
      } else if (selectedRole == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a role'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

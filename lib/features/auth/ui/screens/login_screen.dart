import 'package:droosy_app/core/routing/app_routes.dart';
import 'package:droosy_app/core/utils/validators.dart';
import 'package:droosy_app/core/widgets/custom_text_form_field.dart';
import 'package:droosy_app/features/auth/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLoginLogic() {
    if (_formKey.currentState!.validate()) {
      Get.offAllNamed(AppRoutes.main);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.school, size: 50, color: Colors.white),
                        SizedBox(height: 20),
                        const Text(
                          'Welcome Back!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //! Email Field
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
                        //! ForgotPassword Button
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.forgotPassword);
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        //! Login Button
                        CustomButton(
                          text: 'Login',
                          onPressed: () {
                            _handleLoginLogic();
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  //! Or Continue With
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                      Text('Or Continue With'),
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                    ],
                  ),
                  SizedBox(height: 20),
                  //! Social Login Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSocialLoginButton(
                        icon: Icons.g_mobiledata,
                        onPressed: () {},
                      ),
                      _buildSocialLoginButton(
                        icon: Icons.facebook,
                        onPressed: () {},
                      ),
                      _buildSocialLoginButton(
                        icon: Icons.apple,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  //! Don't have an account? Sign Up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.register);
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
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
    );
  }

  Widget _buildSocialLoginButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return CustomButton(
      text: '',
      icon: icon,
      onPressed: onPressed,
      isOutlined: true,
      height: 50,
      isFullWidth: false,
    );
  }
}

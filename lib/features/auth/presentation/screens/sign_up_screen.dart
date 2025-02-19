import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import '../../providers/auth_provider.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/social_login_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // App Logo and Welcome Text
              FadeInDown(
                duration: const Duration(milliseconds: 1500),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 127, 233).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.medical_services_outlined,
                        color: Color.fromARGB(255, 34, 127, 233),
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'MediCare',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 34, 127, 233),
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Welcome Text
              FadeInDown(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 32,
                      ),
                ),
              ),
              const SizedBox(height: 8),
              FadeInDown(
                delay: const Duration(milliseconds: 300),
                child: Text(
                  'Sign up to get started',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                ),
              ),
              const SizedBox(height: 40),
              // Full Name Field
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                child: CustomTextField(
                  controller: _fullNameController,
                  hint: 'Full Name',
                  prefixIcon: Icons.person_outline,
                ),
              ),
              const SizedBox(height: 16),
              // Email Field
              FadeInDown(
                delay: const Duration(milliseconds: 500),
                child: CustomTextField(
                  controller: _emailController,
                  hint: 'Email address',
                  prefixIcon: Icons.email_outlined,
                ),
              ),
              const SizedBox(height: 16),
              // Phone Field
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                child: CustomTextField(
                  controller: _phoneController,
                  hint: 'Phone',
                  prefixIcon: Icons.phone_outlined,
                ),
              ),
              const SizedBox(height: 16),
              // Date of Birth Field
              FadeInDown(
                delay: const Duration(milliseconds: 700),
                child: CustomTextField(
                  controller: _dobController,
                  hint: 'Date of Birth',
                  prefixIcon: Icons.calendar_today_outlined,
                  isPassword: false,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Password Field
              FadeInDown(
                delay: const Duration(milliseconds: 800),
                child: CustomTextField(
                  controller: _passwordController,
                  hint: 'Password',
                  isPassword: true,
                  prefixIcon: Icons.lock_outline_rounded,
                ),
              ),
              const SizedBox(height: 24),
              // Terms of Use and Privacy Policy
              FadeInDown(
                delay: const Duration(milliseconds: 900),
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'By continuing, you agree to ',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms of Use',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 34, 127, 233),
                            fontWeight: FontWeight.w600,
                          ),
                          // Add onTap functionality if needed
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 34, 127, 233),
                            fontWeight: FontWeight.w600,
                          ),
                          // Add onTap functionality if needed
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Sign Up Button
              FadeInDown(
                delay: const Duration(milliseconds: 1000),
                child: ElevatedButton(
                  onPressed: () => _handleSignUp(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 34, 127, 233),
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // More rounded
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Divider
              FadeInDown(
                delay: const Duration(milliseconds: 1100),
                child: Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[300])),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'or',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey[300])),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Social Login Buttons
              FadeInDown(
                delay: const Duration(milliseconds: 1200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton(
                      'assets/icons/google.svg',
                      () => _handleGoogleSignIn(context),
                    ),
                    const SizedBox(width: 16),
                    _buildSocialButton(
                      'assets/icons/facebook.svg',
                      () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Sign In Link
              FadeInDown(
                delay: const Duration(milliseconds: 1300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Navigate back to login screen
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color.fromARGB(255, 34, 127, 233),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(
          icon,
          height: 24,
          width: 24,
        ),
      ),
    );
  }

  void _handleSignUp(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.signUp(
      _fullNameController.text,
      _emailController.text,
      _phoneController.text,
      _dobController.text,
      _passwordController.text,
    );
  }

  void _handleGoogleSignIn(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.signInWithGoogle();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
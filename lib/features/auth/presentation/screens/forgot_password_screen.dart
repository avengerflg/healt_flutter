import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import '../../providers/auth_provider.dart';
import '../widgets/custom_text_field.dart';
import 'otp_verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

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
              // App Logo and Title
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
                        Icons.lock_outline,
                        color: Color.fromARGB(255, 34, 127, 233),
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Forgot Password',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 34, 127, 233),
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Instruction Text
              FadeInDown(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  'Enter your email address to receive a password reset link.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                ),
              ),
              const SizedBox(height: 40),
              // Email Field
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                child: CustomTextField(
                  controller: _emailController,
                  hint: 'Email address',
                  prefixIcon: Icons.email_outlined,
                ),
              ),
              const SizedBox(height: 24),
              // Send Reset Link Button
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                child: ElevatedButton(
                  onPressed: () => _handleSendResetLink(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 34, 127, 233),
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // More rounded
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Send Reset Link',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Back to Login Link
              FadeInDown(
                delay: const Duration(milliseconds: 800),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to login screen
                    },
                    child: const Text(
                      'Back to Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 34, 127, 233),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSendResetLink(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.sendPasswordResetEmail(_emailController.text);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OTPVerificationScreen()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
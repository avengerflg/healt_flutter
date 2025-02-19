import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import '../../providers/auth_provider.dart';
import '../widgets/custom_text_field.dart';
import 'new_password_screen.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final _otpController = TextEditingController();

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
                      'OTP Verification',
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
                  'Enter the OTP sent to your email address.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                ),
              ),
              const SizedBox(height: 40),
              // OTP Field
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                child: CustomTextField(
                  controller: _otpController,
                  hint: 'OTP',
                  prefixIcon: Icons.lock_outline,
                ),
              ),
              const SizedBox(height: 24),
              // Verify OTP Button
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                child: ElevatedButton(
                  onPressed: () => _handleVerifyOTP(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 34, 127, 233),
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // More rounded
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Verify OTP',
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

  void _handleVerifyOTP(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.verifyOTP(_otpController.text);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewPasswordScreen()),
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import '../../providers/auth_provider.dart';
import '../widgets/custom_text_field.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
                      'New Password',
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
                  'Enter your new password and confirm it.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                ),
              ),
              const SizedBox(height: 40),
              // New Password Field
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                child: CustomTextField(
                  controller: _passwordController,
                  hint: 'New Password',
                  isPassword: true,
                  prefixIcon: Icons.lock_outline,
                ),
              ),
              const SizedBox(height: 16),
              // Confirm Password Field
              FadeInDown(
                delay: const Duration(milliseconds: 500),
                child: CustomTextField(
                  controller: _confirmPasswordController,
                  hint: 'Confirm Password',
                  isPassword: true,
                  prefixIcon: Icons.lock_outline,
                ),
              ),
              const SizedBox(height: 24),
              // Set New Password Button
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                child: ElevatedButton(
                  onPressed: () => _handleSetNewPassword(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 34, 127, 233),
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // More rounded
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Set New Password',
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

  void _handleSetNewPassword(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (_passwordController.text == _confirmPasswordController.text) {
      authProvider.setNewPassword(_passwordController.text);
      Navigator.pop(context); // Navigate back to login screen
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import '../../providers/auth_provider.dart';
import '../widgets/custom_text_field.dart';
import 'sign_up_screen.dart';
import 'forgot_password_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

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
              const SizedBox(height: 50),

              // Animated App Logo and Welcome Text
              FadeInDown(
                duration: const Duration(milliseconds: 1200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: _animation,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 34, 127, 233).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 34, 127, 233).withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.medical_services_outlined,
                          color: Color.fromARGB(255, 34, 127, 233),
                          size: 40,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'MediCalse',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 34, 127, 233),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),

              // Welcome Text
              FadeInDown(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Colors.black87,
                        fontSize: 34,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              FadeInDown(
                delay: const Duration(milliseconds: 300),
                child: Text(
                  'Sign in to your account',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[600],
                        fontSize: 17,
                      ),
                ),
              ),
              const SizedBox(height: 50),

              // Email Field
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                child: CustomTextField(
                  controller: _emailController,
                  hint: 'Email Address',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 20),

              // Password Field
              FadeInDown(
                delay: const Duration(milliseconds: 500),
                child: CustomTextField(
                  controller: _passwordController,
                  hint: 'Password',
                  isPassword: true,
                  prefixIcon: Icons.lock_outline_rounded,
                ),
              ),
              const SizedBox(height: 10),

              // Forgot Password
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 34, 127, 233),
                    ),
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Login Button
              FadeInDown(
                delay: const Duration(milliseconds: 700),
                child: ElevatedButton(
                  onPressed: () => _handleLogin(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 34, 127, 233),
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Divider
              FadeInDown(
                delay: const Duration(milliseconds: 800),
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(color: Colors.grey, thickness: 0.8, height: 1,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(color: Colors.grey, thickness: 0.8, height: 1,),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Social Login Buttons
              FadeInDown(
                delay: const Duration(milliseconds: 900),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton(
                      'assets/icons/google.svg',
                      () => _handleGoogleSignIn(context),
                      'Google',
                    ),
                    const SizedBox(width: 20),
                    _buildSocialButton(
                      'assets/icons/facebook.svg',
                      () {},
                      'Facebook',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Sign Up Link
              FadeInDown(
                delay: const Duration(milliseconds: 1000),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen()),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 34, 127, 233),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String iconPath, VoidCallback onPressed, String label) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black87, backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey[300]!),
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      icon: SvgPicture.asset(
        iconPath,
        height: 22,
        width: 22,
      ),
      label: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.login(_emailController.text, _passwordController.text);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _handleGoogleSignIn(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.signInWithGoogle();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
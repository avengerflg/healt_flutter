import 'package:flutter/material.dart';
import '../data/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  final _authRepository = AuthRepository();
  bool _isLoggedIn = false;
  bool isLoading = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) return;
    
    isLoading = true;
    notifyListeners();
    
    try {
      await _authRepository.signInWithEmail(email, password);
      _isLoggedIn = true;
      // Handle successful login
    } catch (e) {
      // Handle error
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithGoogle() async {
    isLoading = true;
    notifyListeners();
    
    try {
      await _authRepository.signInWithGoogle();
      _isLoggedIn = true;
      // Handle successful login
    } catch (e) {
      // Handle error
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithFacebook() async {
    isLoading = true;
    notifyListeners();
    
    try {
      await _authRepository.signInWithFacebook();
      _isLoggedIn = true;
      // Handle successful login
    } catch (e) {
      // Handle error
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  void signUp(String fullName, String email, String phone, String dob, String password) {
    // Implement your sign-up logic here
    // For example, you can call an API to register the user
    print('Full Name: $fullName');
    print('Email: $email');
    print('Phone: $phone');
    print('Date of Birth: $dob');
    print('Password: $password');
    
    // Notify listeners if needed
    notifyListeners();
  }

  void sendPasswordResetEmail(String email) {
    // Implement your password reset logic here
    // For example, you can call an API to send the reset link
    print('Password reset email sent to: $email');
    
    // Notify listeners if needed
    notifyListeners();
  }

  void verifyOTP(String otp) {
    // Implement your OTP verification logic here
    // For example, you can call an API to verify the OTP
    print('OTP verified: $otp');
    
    // Notify listeners if needed
    notifyListeners();
  }

  void setNewPassword(String newPassword) {
    // Implement your logic to set a new password here
    // For example, you can call an API to update the password
    print('New password set: $newPassword');
    
    // Notify listeners if needed
    notifyListeners();
  }
}

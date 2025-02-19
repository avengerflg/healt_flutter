class AuthRepository {
  Future<void> signInWithEmail(String email, String password) async {
    // Implement email sign in
    await Future.delayed(const Duration(seconds: 2)); // Simulated delay
  }

  Future<void> signInWithGoogle() async {
    // Implement Google sign in
    await Future.delayed(const Duration(seconds: 2)); // Simulated delay
  }

  Future<void> signInWithFacebook() async {
    // Implement Facebook sign in
    await Future.delayed(const Duration(seconds: 2)); // Simulated delay
  }
}

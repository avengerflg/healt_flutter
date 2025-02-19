import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    required this.controller,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      readOnly: readOnly,
      onTap: onTap,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontSize: 15,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: 22,
                color: Colors.grey[600],
              )
            : null,
        filled: true,
        fillColor: const Color(0xFFECF1FF), // Updated color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFF4A90E2),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
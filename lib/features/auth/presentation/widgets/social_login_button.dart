import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;
  final bool isSvg;

  const SocialLoginButton({
    required this.icon,
    required this.onPressed,
    this.isSvg = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isSvg
          ? SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
            )
          : Image.asset(
              icon,
              width: 24,
              height: 24,
            ),
      onPressed: onPressed,
    );
  }
}
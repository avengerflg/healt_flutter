// lib/navigation/custom_navigation_bar.dart

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:health_and_pharmacy_app/core/themes/app_theme.dart';

class CustomNavigationBar extends StatelessWidget {
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomNavigationBar({
    Key? key,
    required this.bottomNavigationKey,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: bottomNavigationKey,
      backgroundColor: AppTheme.backgroundColor,
      color: AppTheme.primaryColor,
      buttonBackgroundColor: AppTheme.primaryColor,
      height: 60,
      items: const <Widget>[
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.calendar_today, size: 30, color: Colors.white),
        Icon(Icons.medical_services, size: 30, color: Colors.white),
        Icon(Icons.person, size: 30, color: Colors.white),
      ],
      onTap: onTap,
      animationDuration: Duration(milliseconds: 300),
      animationCurve: Curves.easeInOut,
    );
  }
}

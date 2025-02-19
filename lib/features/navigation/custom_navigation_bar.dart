import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CustomNavigationBar extends StatelessWidget {
  final GlobalKey<CurvedNavigationBarState>? bottomNavigationKey;
  final Function(int) onTap;
  final int selectedIndex; // Add selectedIndex to manage active state

  const CustomNavigationBar({
    super.key,
    this.bottomNavigationKey,
    required this.onTap,
    required this.selectedIndex, // Required parameter
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: bottomNavigationKey,
      backgroundColor: Colors.white,
      color: Colors.blueAccent,
      buttonBackgroundColor: Colors.blueAccent,
      animationDuration: const Duration(milliseconds: 300),
      items: [
        Icon(Icons.home_outlined, size: selectedIndex == 0 ? 50 : 28),
        Icon(Icons.calendar_month_outlined, size: selectedIndex == 1 ? 50 : 28),
        Icon(Icons.filter_b_and_w_rounded, size: selectedIndex == 2 ? 50 : 28),
        Icon(Icons.notifications_outlined, size: selectedIndex == 3 ? 50 : 28),
        Icon(Icons.perm_identity, size: selectedIndex == 4 ? 50 : 28),
      ],
      onTap: onTap,
    );
  }
}

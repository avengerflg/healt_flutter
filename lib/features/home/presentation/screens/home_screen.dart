import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../../navigation/custom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final GlobalKey<CurvedNavigationBarState>? _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = [
    const Center(child: Text('Home Page')),
    const Center(child: Text('Calendar Page')),
    const Center(child: Text('Filters Page')),
    const Center(child: Text('Notifications Page')),
    const Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavigationBar(
        bottomNavigationKey: _bottomNavigationKey,
        selectedIndex: _selectedIndex, // Pass the selected index
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:health_and_pharmacy_app/core/themes/app_theme.dart';
import 'package:health_and_pharmacy_app/features/navigation/custom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 25),
              _buildSearchBar(),
              const SizedBox(height: 25),
              _buildCarousel(),
              const SizedBox(height: 25),
              _buildTopServices(),
              const SizedBox(height: 25),
              _buildUpcomingAppointments(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        bottomNavigationKey: _bottomNavigationKey,
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppTheme.primaryColor,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, Pranab', style: AppTheme.headerStyle),
                const SizedBox(height: 4),
                Text(
                  'How are you feeling today?',
                  style: AppTheme.subHeaderStyle.copyWith(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        InkWell(
          onTap: () {
            // Handle notification tap
          },
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(Icons.notifications_outlined, size: 28, color: AppTheme.textPrimaryColor),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  Widget _buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          hintText: 'Search for services, doctors...',
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
          prefixIcon: Icon(Icons.search, color: AppTheme.primaryColor, size: 24),
          suffixIcon: IconButton(
            icon: Icon(Icons.close, color: Colors.grey[500], size: 20),
            onPressed: () {
              // Clear search input logic (if needed)
            },
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    ),
  );
}

  Widget _buildCarousel() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _carouselCard(Icons.calendar_today, 'Book Appointments', AppTheme.primaryColor),
          _carouselCard(Icons.assignment, 'My Appointments', AppTheme.secondaryColor),
          _carouselCard(Icons.local_pharmacy, 'Medicines', AppTheme.accentColor),
          _carouselCard(Icons.healing, 'Health Tips', AppTheme.primaryColor),
        ],
      ),
    ),
  );
}

Widget _carouselCard(IconData icon, String label, Color color) {
  return GestureDetector(
    onTap: () {
      // Handle card tap
    },
    child: AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 150,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.1), color.withOpacity(0.03)], // Reduced opacity
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1), // Reduced opacity for less blur
            blurRadius: 5, // Reduced blur
            spreadRadius: 1, // Reduced spread
            offset: Offset(0, 3), // Slightly adjusted offset
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 32, color: color),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildTopServices() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Top Services', style: AppTheme.headerStyle),
              TextButton(
                onPressed: () {
                  // Navigate to see all services
                },
                child: Text('See All', style: AppTheme.linkStyle),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _serviceCard('Dental', Icons.medical_services, AppTheme.primaryColor),
                _serviceCard('Cardiology', Icons.favorite, AppTheme.secondaryColor),
                _serviceCard('Neurology', Icons.grain, AppTheme.accentColor),
                _serviceCard('Orthopedics', Icons.accessibility, Colors.blueAccent),
                _serviceCard('Pediatrics', Icons.child_care, Colors.greenAccent),
              ].map((widget) => Padding(
                padding: const EdgeInsets.only(right: 15),
                child: widget,
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(String label, IconData icon, Color color) {
    return InkWell(
      onTap: () {
        // Handle service card tap
      },
      borderRadius: BorderRadius.circular(15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: color, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppTheme.cardSubtitleStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingAppointments() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Upcoming Appointments', style: AppTheme.headerStyle),
          const SizedBox(height: 15),
          _appointmentCard(
            'Dr. Sarah Johnson',
            'Cardiologist',
            'Today, 10:00 AM',
          ),
          const SizedBox(height: 10),
          _appointmentCard(
            'Dr. Michael Chen',
            'Dentist',
            'Tomorrow, 2:30 PM',
          ),
        ],
      ),
    );
  }

  Widget _appointmentCard(String doctorName, String specialty, String time) {
    return InkWell(
      onTap: () {
        // Handle appointment card tap
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
              child: Icon(Icons.person, color: AppTheme.primaryColor),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctorName, style: AppTheme.cardTitleStyle),
                  const SizedBox(height: 4),
                  Text(specialty, style: AppTheme.cardSubtitleStyle),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
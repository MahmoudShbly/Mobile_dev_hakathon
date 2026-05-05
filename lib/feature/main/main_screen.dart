import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/feature/pharmacy_shifts/presentation/screens/pharmacy_shifts_screen.dart';
import 'package:mobile_dev_hakathon/feature/profile/presentation/screens/profile_screen.dart';
import 'package:mobile_dev_hakathon/feature/search/presentation/screens/search_screen.dart';
import 'package:mobile_dev_hakathon/feature/trainings/presentation/screens/trainings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    ProfileScreen(),
    TrainingsScreen(),
    PharmacyShiftsScreen(),
    SearchScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'حسابي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            activeIcon: Icon(Icons.school),
            label: 'تدريب',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services_outlined),
            activeIcon: Icon(Icons.medical_services),
            label: 'المناوبة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search),
            label: 'بحث',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF0057B8),
        unselectedItemColor: const Color(0xFF727784),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

}

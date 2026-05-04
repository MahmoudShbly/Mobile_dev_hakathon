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
    SearchScreen(),
    ProfileScreen(),
    TrainingsScreen(),
    PharmacyShiftsScreen(),
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
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'البحث'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الملف الشخصي',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'التدريبات'),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'المناوبات',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

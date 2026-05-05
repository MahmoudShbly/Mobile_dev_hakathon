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
  int _selectedIndex = 3;

  static const List<Widget> _screens = <Widget>[
    ProfileScreen(),
    TrainingsScreen(),
    PharmacyShiftsScreen(),
    SearchScreen(),
  ];

  // static const List<Widget> _screens = <Widget>[
  //   SearchScreen(),
  //   ProfileScreen(),
  //   TrainingsScreen(),
  //   PharmacyShiftsScreen(),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.onPrimary,
        elevation: 0,
        leading: Container(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: colorScheme.primary.withOpacity(0.1),
                child: Icon(Icons.person, size: 20, color: colorScheme.primary),
              ),
              const SizedBox(width: 8),
              Text(
                'أحمد خالد',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 120,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: colorScheme.onSurfaceVariant,
            ),
            tooltip: 'الإشعارات',
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: colorScheme.onPrimary,
          border: Border(
            top: BorderSide(color: colorScheme.outline.withOpacity(0.1)),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Expanded(child: _buildNavItem(0, Icons.person, 'حسابي')),
            Expanded(child: _buildNavItem(1, Icons.school, 'تدريب')),
            Expanded(
              child: _buildNavItem(2, Icons.medical_services, 'المناوبة'),
            ),
            Expanded(child: _buildNavItem(3, Icons.search, 'بحث')),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.onSurfaceVariant,
              fill: isSelected ? 1 : 0,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

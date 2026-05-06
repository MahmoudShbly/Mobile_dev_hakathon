import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/core/services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _authService = AuthService();
  String _userName = 'جاري التحميل...';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    try {
      final userData = await _authService.getUserData();
      setState(() {
        _userName = userData['name'] ?? 'أحمد محمد';
      });
    } catch (e) {
      setState(() {
        _userName = 'أحمد محمد'; // Fallback
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFF),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32.h),
            // Profile Image & Name
            Center(
              child: Column(
                children: [
                  Container(
                    width: 120.w,
                    height: 120.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1633332755192-727a05c4013d?auto=format&fit=crop&w=400&q=80',
                        ), // Professional user avatar
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    _userName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF191C22),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            // Menu Items
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.account_circle_outlined,
                    title: 'ملفي الشخصي',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.editProfileScreen);
                    },
                  ),
                  SizedBox(height: 16.h),
                  _buildMenuItem(
                    icon: Icons.favorite_border,
                    title: 'المفضلة',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.favoritesScreen);
                    },
                  ),
                  SizedBox(height: 16.h),
                  _buildMenuItem(
                    icon: Icons.medical_services_outlined,
                    title: 'الصيدليات المناوبة',
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.homeScreen,
                        (route) => false,
                        arguments: 1,
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  _buildMenuItem(
                    icon: Icons.help_outline,
                    title: 'حول التطبيق',
                    onTap: () {
                      showAboutDialog(
                        context: context,
                        applicationName: 'تطبيق الدواء',
                        applicationVersion: '1.0.0',
                        applicationIcon: Image.network(
                          'https://via.placeholder.com/100',
                          width: 50,
                          height: 50,
                        ),
                        children: [
                          const Text(
                            'تطبيق طبي متكامل يساعدك في الوصول إلى الأدوية والصيدليات المناوبة والمستشفيات والأطباء بكل سهولة.',
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  _buildMenuItem(
                    icon: Icons.report_problem,
                    title: 'بلاغ',
                    color: Colors.red,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.reportScreen);
                    },
                  ),
                  SizedBox(height: 16.h),
                  _buildMenuItem(
                    icon: Icons.logout,
                    title: 'تسجيل الخروج',
                    color: Colors.red,
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.loginScreen,
                        (route) => false,
                      );
                    },
                  ),
                  SizedBox(height: 40.h),

                  // Logout
                ],
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    Color? color,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, size: 24, color: color ?? const Color(0xFF00408B)),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: color ?? const Color(0xFF191C22),
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 16, color: color),
          ],
        ),
      ),
    );
  }
}

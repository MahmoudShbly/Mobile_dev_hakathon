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
      if (userData.exists) {
        setState(() {
          _userName = userData.get('name') ?? 'مستخدم';
        });
      }
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
      appBar: AppBar(
        title: Text(
          'الدواء',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF00408B),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
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
                        image: NetworkImage('https://via.placeholder.com/150'), // Placeholder for doctor image
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
                    onTap: () {},
                  ),
                  SizedBox(height: 16.h),
                  _buildMenuItem(
                    icon: Icons.medical_services_outlined,
                    title: 'الصيدليات المناوبة',
                    onTap: () {},
                  ),
                  SizedBox(height: 16.h),
                  _buildMenuItem(
                    icon: Icons.help_outline,
                    title: 'حول التطبيق',
                    onTap: () {},
                  ),
                  SizedBox(height: 40.h),
                  // Logout
                  InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'تسجيل الخروج',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          const Icon(Icons.logout, color: Colors.red),
                        ],
                      ),
                    ),
                  ),
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
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
        leading: const Icon(Icons.arrow_back_ios, size: 14, color: Color(0xFF727784)),
        title: Text(
          title,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF191C22),
          ),
        ),
        trailing: Icon(icon, color: const Color(0xFF0057B8)),
      ),
    );
  }
}

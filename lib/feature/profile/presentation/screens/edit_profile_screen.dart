import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_dev_hakathon/core/shared%20widgets/custom_button.dart';
import 'package:mobile_dev_hakathon/core/shared%20widgets/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController(text: 'د. أحمد عبدالله');
  final _emailController = TextEditingController(text: 'ahmed.a@medical-app.com');
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'تعديل الملف الشخصي',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF191C22),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 32.h),
            // Avatar with camera icon
            Center(
              child: Stack(
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
                        ),
                      ],
                      image: const DecorationImage(
                        image: NetworkImage('https://via.placeholder.com/150'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: const BoxDecoration(
                        color: Color(0xFF0057B8),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            CustomTextField(
              hintText: 'الاسم الكامل',
              suffixIcon: Icons.person_outline,
              controller: _nameController,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              hintText: 'البريد الإلكتروني',
              suffixIcon: Icons.email_outlined,
              controller: _emailController,
            ),
            SizedBox(height: 32.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'تغيير كلمة المرور',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF727784),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              hintText: 'كلمة المرور الحالية',
              suffixIcon: Icons.lock_outline,
              isPassword: true,
              controller: _currentPasswordController,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              hintText: 'كلمة المرور الجديدة',
              suffixIcon: Icons.lock_outline,
              isPassword: true,
              controller: _newPasswordController,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              hintText: 'تأكيد كلمة المرور الجديدة',
              suffixIcon: Icons.lock_outline,
              isPassword: true,
              controller: _confirmPasswordController,
            ),
            SizedBox(height: 40.h),
            CustomButton(
              text: 'حفظ التغييرات',
              icon: Icons.check_circle_outline,
              onPressed: () {
                // Implement Save Logic
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

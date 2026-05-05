import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/core/shared%20widgets/custom_button.dart';
import 'package:mobile_dev_hakathon/core/shared%20widgets/custom_text_field.dart';
import 'package:mobile_dev_hakathon/core/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (_phoneController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال جميع البيانات')),
      );
      return;
    }

    setState(() => _isLoading = true);
    final user = await _authService.login(
      phone: _phoneController.text,
      password: _passwordController.text,
    );
    
    if (!mounted) return;
    setState(() => _isLoading = false);

    if (user != null) {
      Navigator.pushReplacementNamed(context, Routes.homeScreen);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('خطأ في تسجيل الدخول. يرجى التحقق من البيانات.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              // App Logo/Title
              Column(
                children: [
                  Text(
                    'دواء',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF00408B),
                    ),
                  ),
                  Container(
                    width: 40.w,
                    height: 3.h,
                    color: const Color(0xFF0057B8),
                  ),
                ],
              ),
              SizedBox(height: 60.h),
              // Login Card
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF191C22),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'مرحباً بك مجدداً في تطبيق دواء',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF545F73),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    CustomTextField(
                      labelText: 'رقم الجوال',
                      hintText: '05xxxxxxxx',
                      suffixIcon: Icons.phone_outlined,
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      labelText: 'كلمة المرور',
                      hintText: '********',
                      suffixIcon: Icons.lock_outline,
                      isPassword: true,
                      controller: _passwordController,
                    ),
                    SizedBox(height: 12.h),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.forgotPasswordScreen);
                      },
                      child: Text(
                        'نسيت كلمة المرور؟',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF0057B8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    CustomButton(
                      text: 'دخول',
                      isLoading: _isLoading,
                      onPressed: _handleLogin,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.registerScreen);
                    },
                    child: Text(
                      'إنشاء حساب',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF0057B8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'ليس لديك حساب؟',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF545F73),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}


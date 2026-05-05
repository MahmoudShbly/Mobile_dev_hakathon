import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/core/shared%20widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Welcome Image
              Container(
                width: 300.w,
                height: 300.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  image: const DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/300x300?text=Medicine+App'), // Placeholder for pill image
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withValues(alpha: 0.2),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.h),
              Text(
                'مرحباً بك في حجوزاتي',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF191C22),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'رعايتك الصحية، بين يديك بضغطة واحدة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xFF545F73),
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'ابدأ الآن',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginScreen);
                },
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}

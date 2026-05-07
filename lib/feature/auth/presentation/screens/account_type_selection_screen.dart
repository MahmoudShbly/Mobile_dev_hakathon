import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/core/utils/shared_preferences_helper.dart';

class AccountTypeSelectionScreen extends StatefulWidget {
  const AccountTypeSelectionScreen({super.key});

  @override
  State<AccountTypeSelectionScreen> createState() =>
      _AccountTypeSelectionScreenState();
}

class _AccountTypeSelectionScreenState
    extends State<AccountTypeSelectionScreen> {
  String _selectedType = 'pharmacist'; // Default to pharmacist as per design

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/image/image.png',
                            width: 120.w,
                            height: 120.w,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 20.h),
                          const Text(
                            'مرحباً بك في بلسم',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Manrope',
                              color: Color(0xFF00408B),
                              letterSpacing: -0.02,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8.h),
                          const Text(
                            'يرجى اختيار نوع الحساب للمتابعة',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manrope',
                              color: Color(0xFF727784),
                              height: 1.6,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    // Selection Cards
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedType = 'user';
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20.w),
                        margin: EdgeInsets.only(bottom: 16.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _selectedType == 'user'
                                ? const Color(0xFF0057B8)
                                : const Color(0xFFC2C6D4),
                            width: _selectedType == 'user' ? 2 : 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 18,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 52.w,
                              height: 52.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFFD5E0F8),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Color(0xFF586377),
                                size: 24,
                              ),
                            ),
                            SizedBox(width: 14.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'مستخدم عادي',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Manrope',
                                      color: Color(0xFF191C22),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  const Text(
                                    'للبحث عن الأدوية والصيدليات القريبة',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Manrope',
                                      color: Color(0xFF424752),
                                      height: 1.6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (_selectedType == 'user')
                              Container(
                                width: 22.w,
                                height: 22.w,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF0057B8),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedType = 'pharmacist';
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          color: _selectedType == 'pharmacist'
                              ? const Color(0xFFADC7FF).withOpacity(0.1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _selectedType == 'pharmacist'
                                ? const Color(0xFF0057B8)
                                : const Color(0xFFC2C6D4),
                            width: _selectedType == 'pharmacist' ? 2 : 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 18,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 52.w,
                              height: 52.w,
                              decoration: const BoxDecoration(
                                color: Color(0xFF0057B8),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.medication,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            SizedBox(width: 14.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'صيدلي',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Manrope',
                                      color: Color(0xFF00408B),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  const Text(
                                    'لإدارة الصيدلية، المخزون، والطلبات',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Manrope',
                                      color: Color(0xFF424752),
                                      height: 1.6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 22.w,
                              height: 22.w,
                              decoration: BoxDecoration(
                                color: _selectedType == 'pharmacist'
                                    ? const Color(0xFF0057B8)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: _selectedType == 'pharmacist'
                                      ? Colors.transparent
                                      : const Color(0xFFC2C6D4),
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: _selectedType == 'pharmacist'
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 14,
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ),
          
                    SizedBox(height: 24.h),
                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 52.h,
                            child: ElevatedButton(
                              onPressed: () async {
                                await SharedPreferencesHelper.setUserType(
                                  _selectedType,
                                );
                                if (_selectedType == 'user') {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    Routes.loginScreen,
                                  );
                                } else {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    Routes.pharmacistDashboardScreen,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF00408B),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'متابعة',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.01,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  const Icon(Icons.arrow_back, size: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

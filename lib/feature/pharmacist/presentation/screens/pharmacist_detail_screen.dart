import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';

class PharmacistDetailScreen extends StatelessWidget {
  const PharmacistDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        elevation: 0,
        title: const Text(
          'تفاصيل الصيدلية',
          style: TextStyle(
            color: Color(0xFF00408B),
            fontWeight: FontWeight.w700,
            fontSize: 32,
            fontFamily: 'Manrope',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Color(0xFF727784)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section with Pharmacy Info
            Container(
              margin: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Pharmacy Image
                  Container(
                    height: 200.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida/ADBb0uh-2O_Vknlngqdagd0rExiqEuXh4fbC7vR1f_Q-M01oMbRBVRUwr-jgUT9kZ1ScXvxNYz8dhrGvog4p9heYdrSW28oHQOR0fnkQVfmLQFCAuDbRKKfWEoVEGD7dYsgUj2v4sdTWpHFbnemZHgNgvCPY3myXPs2A2bVt2Foh9n0bYGuqhjkWTFiLkCUtN1ci7CxsYc95U50v8AQNNLGgykRk0mFqB0vdOhe9PS7LTU4uAFAFMvweJwSQGG4',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      children: [
                        // Status Badge
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.green.withOpacity(0.2),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.verified,
                                  color: Colors.green,
                                  size: 16,
                                ),
                                SizedBox(width: 4.w),
                                const Text(
                                  'موثق',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Manrope',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        // Action Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                color: Color(0xFF00408B),
                              ),
                              style: IconButton.styleFrom(
                                backgroundColor: const Color(0xFFE1E2EB),
                                padding: EdgeInsets.all(12.w),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                color: Color(0xFF00408B),
                              ),
                              style: IconButton.styleFrom(
                                backgroundColor: const Color(0xFFE1E2EB),
                                padding: EdgeInsets.all(12.w),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        // Pharmacy Name
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'صيدلية الحكمة المركزية',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Manrope',
                              color: Color(0xFF00408B),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        // Location
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Expanded(
                              child: Text(
                                'شارع الملك فهد، حي الصحافة، الرياض',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Manrope',
                                  color: Color(0xFF424752),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            const Icon(
                              Icons.location_on,
                              color: Color(0xFF727784),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        // Contact Info
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00408B),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Row(
                                  children: [
                                    Text(
                                      '+966 12 345 6789',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Manrope',
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.call,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              '|',
                              style: TextStyle(color: Color(0xFFC2C6D4)),
                            ),
                            const SizedBox(width: 16),
                            Row(
                              children: [
                                const Text(
                                  '1.2 كم من موقعك الحالي',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Manrope',
                                    color: Color(0xFF424752),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                const Icon(
                                  Icons.location_on,
                                  color: Color(0xFF727784),
                                  size: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Map Section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              height: 300.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuD2bUH7zZ1ZAgwk48Q4bUNDYi0gYQ1UQwp5sNcA4XyAxzP_lo9S50Lwpc665GAOlRiIcPb5r_gqAxoylH9ivw-m3N-zAr8xxEO2HfYxz79isCKj0ybLIr6jOjJ4XGM-fuoYoTpv7iBXQq42psuRgrGzvLoqbO-8p4cEE12zyTDJpRZonsGRZStxbbNgdKkj0jZUH-35TmC8UjNKvSvMMLmDziHlkZ5iTPBWdbxFoDNpSzkSsKo3f6cLQbkJK6jqb8ci_0w7axI3PmY7',
                        ),
                        fit: BoxFit.cover,
                        opacity: 0.8,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16.h,
                    left: 16.w,
                    right: 16.w,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'الموقع على الخريطة',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Manrope',
                                color: Color(0xFF00408B),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF00408B),
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'فتح في خرائط جوجل',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Manrope',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            // Working Hours Section
            Container(
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00408B),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.schedule, color: Colors.white),
                      ),
                      SizedBox(width: 16.w),
                      const Text(
                        'ساعات العمل والمناوبات',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Manrope',
                          color: Color(0xFF191C22),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  _WorkingHoursItem(
                    day: 'الأحد - الخميس',
                    hours: '08:00 - 23:00',
                  ),
                  _WorkingHoursItem(day: 'الجمعة', hours: '16:00 - 23:00'),
                  _WorkingHoursItem(day: 'السبت', hours: '09:00 - 22:00'),
                ],
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}

class _WorkingHoursItem extends StatelessWidget {
  final String day;
  final String hours;

  const _WorkingHoursItem({required this.day, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F3FC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Manrope',
              color: Color(0xFF191C22),
            ),
          ),
          Text(
            hours,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Manrope',
              color: Color(0xFF424752),
            ),
          ),
        ],
      ),
    );
  }
}

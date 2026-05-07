import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PharmacistReportsScreen extends StatelessWidget {
  const PharmacistReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        elevation: 0,
        title: const Text(
          'قسم التقارير',
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
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'قسم التقارير',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                fontFamily: 'Manrope',
                color: Color(0xFF191C22),
              ),
            ),
            SizedBox(height: 8.h),
            const Text(
              'ساعدنا في تحسين الخدمات الصحية من خلال الإبلاغ الفوري عن أي مشكلات تواجهها.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: 'Manrope',
                color: Color(0xFF424752),
              ),
            ),
            SizedBox(height: 40.h),
            // Report Cards Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 16.w,
              children: [
                _ReportCard(
                  icon: Icons.medical_services,
                  title: 'تبليغ عن نقص دواء',
                  description:
                      'قم بالإبلاغ عن الأدوية غير المتوفرة في الصيدليات لتتبع العجز.',
                  color: const Color(0xFF00408B),
                  onTap: () {},
                ),
                _ReportCard(
                  icon: Icons.verified_user,
                  title: 'تبليغ عن دواء مشبوه/مزيف',
                  description:
                      'يساعد الإبلاغ السريع في حماية المجتمع. يمكنك إرفاق صور العبوات المشبوهة.',
                  color: const Color(0xFF00408B),
                  onTap: () {},
                  isHighlighted: true,
                ),
                _ReportCard(
                  icon: Icons.description,
                  title: 'تبليغ عن وصفة غير واضحة',
                  description:
                      'للإبلاغ عن الوصفات الطبية المكتوبة بخط غير مقروء لضمان سلامة الصرف.',
                  color: const Color(0xFF752B00),
                  onTap: () {},
                ),
                _StatisticsCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final VoidCallback onTap;
  final bool isHighlighted;

  const _ReportCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.onTap,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: isHighlighted ? color : Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
          image: isHighlighted
              ? const DecorationImage(
                  image: NetworkImage(
                    'https://lh3.googleusercontent.com/aida/ADBb0ujOEm50kA-a1pBdriYl9XyM6dae5NCsNgbQKRpNAUrgeBBvy3AprvACky46IYShEr1XOHVcq7rXFq7E5Pcd1NxhBvf0oaHkQ1240xEL8_0fPlvhWdKur2SyGFQETVbpqFtl8mmVFBI9E_8Umza7KSkPomkEo_MBXFWyQSE07rSNNbo396IePPdqkX3Ch0bzRc9fN6EnDKaKTi6fe6FY3_WsIgziugQw002CcegsoCx-xQDS6TyiY36GAfc',
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: isHighlighted
                    ? Colors.white.withOpacity(0.2)
                    : color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: isHighlighted ? Colors.white : color,
                size: 24,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: 'Manrope',
                color: isHighlighted ? Colors.white : const Color(0xFF191C22),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Manrope',
                color: isHighlighted
                    ? Colors.white.withOpacity(0.9)
                    : const Color(0xFF424752),
              ),
            ),
            if (isHighlighted) ...[
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(width: 8.w),
                    const Text(
                      'إرفاق صورة',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatisticsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
        border: const Border(
          right: BorderSide(color: Color(0xFF00408B), width: 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'إحصائياتك',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Manrope',
              color: Color(0xFF00408B),
              letterSpacing: 0.01,
            ),
          ),
          SizedBox(height: 8.h),
          const Text(
            'إجمالي التقارير: 12',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              fontFamily: 'Manrope',
              color: Color(0xFF191C22),
            ),
          ),
          SizedBox(height: 4.h),
          const Text(
            'تمت معالجة 10 تقارير بنجاح هذا الشهر.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Manrope',
              color: Color(0xFF424752),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Color(0xFF00408B),
                  size: 20,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 32.w,
                height: 32.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.hourglass_empty,
                  color: Color(0xFF545F73),
                  size: 20,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 32.w,
                height: 32.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.verified,
                  color: Color(0xFF00408B),
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

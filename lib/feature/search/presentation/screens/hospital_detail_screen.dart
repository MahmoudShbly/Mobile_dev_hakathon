import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/feature/search/model/hospital_model.dart';
import 'package:mobile_dev_hakathon/feature/search/model/doctor_model.dart';

class HospitalDetailScreen extends StatelessWidget {
  final Hospital hospital;

  const HospitalDetailScreen({super.key, required this.hospital});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_forward),
          tooltip: 'رجوع',
        ),
        title: Text(
          hospital.name,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: colorScheme.primary),
            tooltip: 'الإشعارات',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 28,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: hospital.imageUrl != null
                        ? Image.network(
                            hospital.imageUrl!,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: progress.expectedTotalBytes != null
                                      ? progress.cumulativeBytesLoaded /
                                            progress.expectedTotalBytes!
                                      : null,
                                  color: colorScheme.primary,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: colorScheme.surface,
                                child: Center(
                                  child: Icon(
                                    Icons.local_hospital,
                                    size: 96,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              );
                            },
                          )
                        : Container(
                            color: colorScheme.surface,
                            child: Center(
                              child: Icon(
                                Icons.local_hospital,
                                size: 96,
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                  ),
                  Positioned(
                    right: 16,
                    bottom: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.86),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: colorScheme.outline.withValues(alpha: 0.14),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hospital.name,
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            hospital.location,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer.withValues(
                                alpha: 0.12,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: colorScheme.primary.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Icon(
                                    Icons.call,
                                    color: colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'اتصل الآن',
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      color: colorScheme.onSurface,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer.withValues(
                                alpha: 0.12,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: colorScheme.primary.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Icon(
                                    Icons.directions,
                                    color: colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'الاتجاهات',
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      color: colorScheme.onSurface,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'حالة الأجهزة الطبية',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildStatusCard(
                      context,
                      icon: Icons.settings_input_component,
                      title: 'MRI (رنين مغناطيسي)',
                      caption: 'التكلفة التقديرية: 500 ريال',
                      badgeText: 'متاح / قيد التشغيل',
                      badgeColor: const Color(0xFF065F46),
                      backgroundColor: const Color(0xFFEAF9F1),
                    ),
                    const SizedBox(height: 12),
                    _buildStatusCard(
                      context,
                      icon: Icons.image,
                      title: 'X-Ray (أشعة سينية)',
                      caption: 'التكلفة التقديرية: 150 ريال',
                      badgeText: 'تحت الصيانة',
                      badgeColor: const Color(0xFF9A3C00),
                      backgroundColor: const Color(0xFFFFF4E6),
                    ),
                    const SizedBox(height: 12),
                    _buildStatusCard(
                      context,
                      icon: Icons.biotech,
                      title: 'CT Scan (أشعة مقطعية)',
                      caption: 'التكلفة التقديرية: 350 ريال',
                      badgeText: 'خارج الخدمة',
                      badgeColor: const Color(0xFF991B1B),
                      backgroundColor: const Color(0xFFFFEBEB),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'الأطباء المناوبون',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              Routes.doctorsListScreen,
                              arguments: {
                                'departmentName': 'قسم الأطباء',
                                'hospitalName': hospital.name,
                                'doctors': sampleDoctors,
                              },
                            );
                          },
                          child: Text(
                            'عرض الكل',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildDoctorCard(
                      context,
                      imageUrl:
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuAoo-PpkjrAup8-ee2iIROk0bPslPYUA1DNmFFQy65b14mKLSVAN0TZ8zBXhckSD2ZfceWvASN6U3CWXM2MM7eByiqgav-y4rcQR6_LyQ0tNQut4f-25QWriyQC6M5vScZDKfwHFAPW-4NVievgd3tyd_ANyVrpixQiIR8zWjh0Bg4CRmasPTqQ6VhkeNWlxVkZ_AWxekdZemMIr8fvO18xCu-DOxIi7tGDNSsi5KCwWOiaU8UII8762QnYitSP6t-f5Pm8-HuhWB9q',
                      name: 'د. سامي أحمد',
                      specialty: 'أخصائي قلب',
                      availability: 'متاح حتى 04:00 م',
                    ),
                    const SizedBox(height: 12),
                    _buildDoctorCard(
                      context,
                      imageUrl:
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuA58LN0ZsgLYlhVx4zDv20p-zCnm2P4TKwc3aj3hoeDHLyMos02vxJkdnSCk0P9PKYEAvvTFr4p01yUnVF5x-StU0DdseBQlkfBc7udkI9VgdZrk-Btm20kJH8Lj1CE1u4nfWrw2OVQQblalsdss6qZ4Ka_ZRiKVOaL87wvNlXu_jfwcrQJB5eFMom2hlW0aIQlxh5gdoJCq0Si60gKuMBi0TOibwaoNfjOlFlhghXD2GYYMbvqulL-iz-yG0YZkhn7gZPeHrpwYyf2',
                      name: 'د. ليلى خالد',
                      specialty: 'أخصائية جلدية',
                      availability: 'متاحة حتى 08:00 م',
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'دليل الاختصاصات',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _buildSpecialtyChip(
                          context,
                          'طب العيون',
                          Icons.visibility,
                        ),
                        _buildSpecialtyChip(
                          context,
                          'أمراض القلب',
                          Icons.favorite,
                        ),
                        _buildSpecialtyChip(
                          context,
                          'طب الأطفال',
                          Icons.child_care,
                        ),
                        _buildSpecialtyChip(
                          context,
                          'طب العظام',
                          Icons.accessibility_new,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String caption,
    required String badgeText,
    required Color badgeColor,
    required Color backgroundColor,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.18)),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: colorScheme.onPrimary.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: badgeColor, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  caption,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: badgeColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              badgeText,
              style: theme.textTheme.bodySmall?.copyWith(
                color: badgeColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(
    BuildContext context, {
    required String imageUrl,
    required String name,
    required String specialty,
    required String availability,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.14)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F7EE),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'متاح',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF065F46),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  specialty,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      size: 16,
                      color: Color(0xFF424654),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      availability,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.calendar_month, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialtyChip(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

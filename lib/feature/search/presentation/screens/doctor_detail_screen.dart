import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/feature/search/model/doctor_model.dart';

class DoctorDetailScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const backgroundColor = Color(0xFFF9F9FF);
    const cardColor = Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: cardColor,
        elevation: 0,
        centerTitle: false,
        foregroundColor: const Color(0xFF191C22),

        title: Text(
          doctor.name,
          style: theme.textTheme.titleLarge?.copyWith(
            color: const Color(0xFF00408B),
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, color: Color(0xFF424752)),
            tooltip: 'مشاركة',
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.call),
                label: const Text('اتصال هاتفـي'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF00408B),
                  elevation: 0,
                  side: const BorderSide(color: Color(0xFF00408B)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildHeroSection(context, theme, doctor),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildAboutSection(theme, doctor),
                    const SizedBox(height: 24),
                    _buildLocationsSection(theme, doctor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(
    BuildContext context,
    ThemeData theme,
    Doctor doctor,
  ) {
    final isWide = MediaQuery.of(context).size.width > 760;
    return isWide
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildHeroText(theme, doctor)),
              const SizedBox(width: 24),
              _buildHeroImage(doctor),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeroImage(doctor),
              const SizedBox(height: 24),
              _buildHeroText(theme, doctor),
            ],
          );
  }

  Widget _buildHeroImage(Doctor doctor) {
    return Image.network(
      doctor.imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        color: const Color(0xFFD9D9E2),
        child: const Center(
          child: Icon(Icons.person, size: 48, color: Color(0xFF727784)),
        ),
      ),
    );
  }

  Widget _buildHeroText(ThemeData theme, Doctor doctor) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFD5E0F8),
              borderRadius: BorderRadius.circular(999),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Text(
              doctor.specialty,
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF00408B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            doctor.name,
            style: theme.textTheme.titleLarge?.copyWith(
              color: const Color(0xFF191C22),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'متخصص في ${doctor.specialty} بخبرة تزيد عن ١٥ عاماً في أكبر المستشفيات الجامعية.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF424752),
              height: 1.7,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _buildStatTile(
                'الخبرة',
                '+15 سنة',
                const Color(0xFF191C22),
                const Color(0xFFD8E3FB),
              ),
              const SizedBox(width: 12),
              _buildStatTile(
                'المرضى',
                '+2,000',
                const Color(0xFF191C22),
                const Color(0xFFD8E3FB),
              ),
              const SizedBox(width: 12),
              _buildStatTile(
                'التقييم',
                doctor.rating.toStringAsFixed(1),
                const Color(0xFF191C22),
                const Color(0xFFFFDBCC),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatTile(
    String label,
    String value,
    Color textColor,
    Color bgColor,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF727784),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection(ThemeData theme, Doctor doctor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'حول الدكتور',
          style: theme.textTheme.titleLarge?.copyWith(
            color: const Color(0xFF191C22),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFC2C6D4).withOpacity(0.2)),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            'يعتبر ${doctor.name} من الرواد في ${doctor.specialty}. يركز في ممارسته على تقديم أحدث التقنيات الطبية بأقل قدر من التدخل الجراحي لضمان أسرع تعافي للمرضى. يساهم بشكل فعال في الأبحاث الطبية وينشر مقالات علمية في المجلات الدولية.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF424752),
              height: 1.7,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationsSection(ThemeData theme, Doctor doctor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'المستشفيات والعيادات',
              style: theme.textTheme.titleLarge?.copyWith(
                color: const Color(0xFF191C22),
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'عرض الكل',
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF0057B8),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 760;
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(
                  width: isWide
                      ? (constraints.maxWidth - 32) / 3
                      : double.infinity,
                  child: _buildLocationCard(
                    theme,
                    title: doctor.hospitalName,
                    subtitle: 'الرياض، حي المعذر',
                    icon: Icons.local_hospital,
                    iconBackground: const Color(0xFF00408B),
                    schedule: 'الأحد - الخميس (٨ص - ٤م)',
                  ),
                ),
                SizedBox(
                  width: isWide
                      ? (constraints.maxWidth - 32) / 3
                      : double.infinity,
                  child: _buildLocationCard(
                    theme,
                    title: 'عيادات النخبة',
                    subtitle: 'الرياض، طريق التخصصي',
                    icon: Icons.medical_services,
                    iconBackground: const Color(0xFF545F73),
                    schedule: 'السبت - الأربعاء (٥م - ٩م)',
                  ),
                ),
                SizedBox(
                  width: isWide
                      ? (constraints.maxWidth - 32) / 3
                      : double.infinity,
                  child: _buildMapCard(theme),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildLocationCard(
    ThemeData theme, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconBackground,
    required String schedule,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFC2C6D4).withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: Colors.white),
              ),
              const Icon(Icons.map, color: Color(0xFF727784)),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF191C22),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF727784),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.schedule, size: 16, color: Color(0xFF9B3C00)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  schedule,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF727784),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMapCard(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFC2C6D4).withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.network(
              'https://lh3.googleusercontent.com/aida/ADBb0ugAWfVaUjmHSfiN3nIkGPpFnRNE3usD9L2hkMTOeS-Ng1yT9kDryxURdSajY3S8ETPgRynWTkIdCy9w3CQC5JYoO_pog9Xin8nlo6Ha-E1kCkWrYkKxTzrbf1WxVINGENx6yZ7y2q762rzuSImp5GWWR3OendQfjmUgRTDJokhK1W8vBgk6njkWakHHuBsXr-F2KrLnBZeNWLjhbBF0MOh1OCHhb4v3X_aKg-W0oDR9NQqzfqPyr2VgzWVE',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(color: const Color(0xFFD9D9E2)),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.directions, color: Color(0xFF00408B)),
              label: const Text('فتح الخرائط'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF00408B),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';

class PharmacistDashboardScreen extends StatefulWidget {
  const PharmacistDashboardScreen({super.key});

  @override
  State<PharmacistDashboardScreen> createState() =>
      _PharmacistDashboardScreenState();
}

class _PharmacistDashboardScreenState extends State<PharmacistDashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const _DashboardContent(),
    const _ReportsContent(),
    const _InventoryContent(),
    const _ProfileContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: CircleAvatar(
          radius: 20,
          backgroundImage: const NetworkImage(
            'https://lh3.googleusercontent.com/aida/ADBb0uhbaZCvhjRIWO_M3jV6vyH8XAxO0Njk6UNbP8nmeIwrekHhKFvMpy_MIf6TuEPObG1MabuKb_EoKtTuLc-yWzbpkGxYJKARvlb5nMezV1oxaktr81aWdlUhdu-2rI8K0sqg3UIzF-pE0e45dALTDYzby8G4JeWvOsHl7exz2b3Aq8DrH3HXlOqcl_0IsJTIINjfd_iEfTYAcWKb53GF2VfVrK05u0y6LgV30Qy9h5sqkOzYjPxsFJpx2IJV',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Color(0xFF727784)),
            onPressed: () {},
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF00408B),
        unselectedItemColor: const Color(0xFF727784),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'لوحة التحكم',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'التقارير'),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'المخزون',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الملف الشخصي',
          ),
        ],
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero Section
          Container(
            height: 170.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://lh3.googleusercontent.com/aida/ADBb0ujOEm50kA-a1pBdriYl9XyM6dae5NCsNgbQKRpNAUrgeBBvy3AprvACky46IYShEr1XOHVcq7rXFq7E5Pcd1NxhBvf0oaHkQ1240xEL8_0fPlvhWdKur2SyGFQETVbpqFtl8mmVFBI9E_8Umza7KSkPomkEo_MBXFWyQSE07rSNNbo396IePPdqkX3Ch0bzRc9fN6EnDKaKTi6fe6FY3_WsIgziugQw002CcegsoCx-xQDS6TyiY36GAfc',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    const Color(0xFF00408B).withOpacity(0.8),
                    Colors.transparent,
                  ],
                ),
              ),
              padding: EdgeInsets.all(14.w),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'أهلاً دكتور أحمد،',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'نظرة سريعة على مخزون الصيدلية والطلبات النشطة لليوم.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          // Summary Cards
          _SummaryCard(
            title: 'عدد الأدوية المضافة',
            value: '1,248',
            icon: Icons.inventory_2,
            color: const Color(0xFF00408B),
          ),
          SizedBox(height: 12.h),
          _SummaryCard(
            title: 'نقص الأدوية المبلغ عنه',
            value: '12',
            icon: Icons.warning,
            color: const Color(0xFFBA1A1A),
          ),
          SizedBox(height: 12.h),
          _SummaryCard(
            title: 'طلبات الإمداد النشطة',
            value: '05',
            icon: Icons.local_shipping,
            color: const Color(0xFF00408B),
          ),
          SizedBox(height: 20.h),
          // Quick Actions
          const Text(
            'إجراءات سريعة',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Manrope',
              color: Color(0xFF191C22),
            ),
          ),
          SizedBox(height: 12.h),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
            childAspectRatio: 0.95,
            children: [
              _QuickActionButton(
                icon: Icons.add_circle,
                label: 'إضافة دواء',
                onTap: () {},
              ),
              _QuickActionButton(
                icon: Icons.search,
                label: 'البحث',
                onTap: () {},
              ),
              _QuickActionButton(
                icon: Icons.report,
                label: 'تقرير',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
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
            width: 42.w,
            height: 42.w,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Manrope',
                    color: Color(0xFF424752),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Manrope',
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFF00408B),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            SizedBox(height: 6.h),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'Manrope',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ReportsContent extends StatelessWidget {
  const _ReportsContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'قسم التقارير',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              fontFamily: 'Manrope',
              color: Color(0xFF191C22),
            ),
          ),
          SizedBox(height: 8.h),
          const Text(
            'تابع البلاغات وتحقق من حالة التقارير التي قمت بإرسالها.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Manrope',
              color: Color(0xFF424752),
            ),
          ),
          SizedBox(height: 20.h),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            childAspectRatio: 0.65,
            children: [
              _ReportCard(
                icon: Icons.medical_services,
                title: 'نقص دواء',
                description: 'أبلغ عن أدوية غير متوفرة لتحديث المخزون بسرعة.',
                color: const Color(0xFF00408B),
                onTap: () {},
              ),
              _ReportCard(
                icon: Icons.verified_user,
                title: 'دواء مشبوه',
                description: 'أرسل بلاغاً عن أي دواء مشكوك في أمره.',
                color: const Color(0xFF00408B),
                onTap: () {},
                isHighlighted: true,
              ),
              _ReportCard(
                icon: Icons.description,
                title: 'وصفة غير واضحة',
                description: 'قم برفع صورة الوصفة في حال كانت غير مقروءة.',
                color: const Color(0xFF752B00),
                onTap: () {},
              ),
              _StatisticsCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class _InventoryContent extends StatefulWidget {
  const _InventoryContent();

  @override
  State<_InventoryContent> createState() => _InventoryContentState();
}

class _InventoryContentState extends State<_InventoryContent> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _medicines = [
    {
      'name': 'بانادول أدفانس ٥٠٠ ملغ',
      'description': 'مسكن وخافض للحرارة.',
      'quantity': 124,
      'expiryDate': '08 / 2025',
      'isAvailable': true,
    },
    {
      'name': 'أموكسيسيلين ٥٠٠ ملغ',
      'description': 'مضاد حيوي واسع الطيف.',
      'quantity': 0,
      'expiryDate': '12 / 2024',
      'isAvailable': false,
    },
  ];

  List<Map<String, dynamic>> get _filteredMedicines {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) return _medicines;
    return _medicines.where((medicine) {
      return medicine['name'].toLowerCase().contains(query) ||
          medicine['description'].toLowerCase().contains(query);
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'المخزون',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              fontFamily: 'Manrope',
              color: Color(0xFF191C22),
            ),
          ),
          SizedBox(height: 8.h),
          const Text(
            'ابحث وأدرج حالة الأدوية الموجودة في الصيدلية.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Manrope',
              color: Color(0xFF424752),
            ),
          ),
          SizedBox(height: 20.h),
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'ابحث عن دواء...',
              prefixIcon: const Icon(Icons.search, color: Color(0xFF727784)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFC2C6D4)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFC2C6D4)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF00408B)),
              ),
              filled: true,
              fillColor: const Color(0xFFF2F3FC),
            ),
            onChanged: (_) => setState(() {}),
          ),
          SizedBox(height: 20.h),
          GridView.builder(
            itemCount: _filteredMedicines.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 16.h,
              childAspectRatio: 3,
            ),
            itemBuilder: (context, index) {
              final medicine = _filteredMedicines[index];
              return Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28.w,
                      backgroundColor: medicine['isAvailable']
                          ? const Color(0xFFD5E0F8)
                          : const Color(0xFFF8D5D5),
                      child: Icon(
                        medicine['isAvailable']
                            ? Icons.check_circle
                            : Icons.warning,
                        color: medicine['isAvailable']
                            ? const Color(0xFF00408B)
                            : const Color(0xFFBA1A1A),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            medicine['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Manrope',
                              color: Color(0xFF191C22),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            medicine['description'],
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manrope',
                              color: Color(0xFF727784),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${medicine['quantity']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Manrope',
                            color: Color(0xFF00408B),
                          ),
                        ),
                        const Text(
                          'الكمية',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Manrope',
                            color: Color(0xFF727784),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=400&q=80',
            ),
          ),
          SizedBox(height: 16.h),
          const Text(
            'د. أحمد محمد',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: 'Manrope',
              color: Color(0xFF191C22),
            ),
          ),
          SizedBox(height: 8.h),
          const Text(
            'صيدلي إدارة المخزون',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Manrope',
              color: Color(0xFF727784),
            ),
          ),
          SizedBox(height: 24.h),
          _ProfileTile(
            icon: Icons.person,
            title: 'بياناتي',
            subtitle: 'عرض وتعديل معلومات الحساب',
            onTap: () {},
          ),
          SizedBox(height: 14.h),
          _ProfileTile(
            icon: Icons.stacked_bar_chart,
            title: 'الإعدادات',
            subtitle: 'تحكم في إشعاراتك وخصائص التطبيق',
            onTap: () {},
          ),
          SizedBox(height: 14.h),
          _ProfileTile(
            icon: Icons.logout,
            title: 'تسجيل الخروج',
            subtitle: 'إنهاء الجلسة والعودة لتسجيل الدخول',
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.loginScreen,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: const Color(0xFF00408B).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF00408B), size: 22),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Manrope',
                      color: Color(0xFF191C22),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope',
                      color: Color(0xFF727784),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xFF727784),
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
        padding: EdgeInsets.all(18.w),
        decoration: BoxDecoration(
          color: isHighlighted ? color : Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
          image: isHighlighted
              ? const DecorationImage(
                  image: NetworkImage(
                    'https://lh3.googleusercontent.com/aida/ADBb0ujOEm50kA-a1pBdriYl9XyM6dae5NCsNgbQKRpNAUrgeBBvy3AprvACky46IYShEr1XOHVcq7rXFq7E5Pcd1NxhBvf0oaHkQ1240xEL8_0fPlvhWdKur2SyGFQETVbpqFtl8mmVFBI9E_8Umza7KSkPomkEo_MBXFWyQSE07rSNNbo396IePPdqkX3Ch0bzRc9fN6EnDKaKTi6fe6FY3_WsIgziugQw002CcegsoCx-xQDS6TyiY36GAfc',
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.18,
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: isHighlighted
                    ? Colors.white.withOpacity(0.2)
                    : color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                color: isHighlighted ? Colors.white : color,
                size: 22,
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Manrope',
                color: isHighlighted ? Colors.white : const Color(0xFF191C22),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Manrope',
                color: isHighlighted
                    ? Colors.white.withOpacity(0.9)
                    : const Color(0xFF424752),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatisticsCard extends StatelessWidget {
  const _StatisticsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
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
          SizedBox(height: 10.h),
          const Text(
            'إجمالي البلاغات',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Manrope',
              color: Color(0xFF191C22),
            ),
          ),
          SizedBox(height: 8.h),
          const Text(
            '12',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontFamily: 'Manrope',
              color: Color(0xFF00408B),
            ),
          ),
          SizedBox(height: 12.h),
          const Text(
            'آخر تحديث: اليوم',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Manrope',
              color: Color(0xFF727784),
            ),
          ),
        ],
      ),
    );
  }
}

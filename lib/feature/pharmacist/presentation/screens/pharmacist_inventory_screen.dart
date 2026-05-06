import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PharmacistInventoryScreen extends StatefulWidget {
  const PharmacistInventoryScreen({super.key});

  @override
  State<PharmacistInventoryScreen> createState() =>
      _PharmacistInventoryScreenState();
}

class _PharmacistInventoryScreenState extends State<PharmacistInventoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _medicines = [
    {
      'name': 'بانادول أدفانس ٥٠٠ ملغ',
      'description': 'مسكن للألم وخافض للحرارة - أقراص مغلفة.',
      'quantity': 124,
      'expiryDate': '08 / 2025',
      'image':
          'https://lh3.googleusercontent.com/aida/ADBb0ujOEm50kA-a1pBdriYl9XyM6dae5NCsNgbQKRpNAUrgeBBvy3AprvACky46IYShEr1XOHVcq7rXFq7E5Pcd1NxhBvf0oaHkQ1240xEL8_0fPlvhWdKur2SyGFQETVbpqFtl8mmVFBI9E_8Umza7KSkPomkEo_MBXFWyQSE07rSNNbo396IePPdqkX3Ch0bzRc9fN6EnDKaKTi6fe6FY3_WsIgziugQw002CcegsoCx-xQDS6TyiY36GAfc',
      'isAvailable': true,
    },
    {
      'name': 'أموكسيسيلين ٥٠٠ ملغ',
      'description': 'مضاد حيوي واسع الطيف.',
      'quantity': 0,
      'expiryDate': '12 / 2024',
      'image':
          'https://lh3.googleusercontent.com/aida/ADBb0uh-2O_Vknlngqdagd0rExiqEuXh4fbC7vR1f_Q-M01oMbRBVRUwr-jgUT9kZ1ScXvxNYz8dhrGvog4p9heYdrSW28oHQOR0fnkQVfmLQFCAuDbRKKfWEoVEGD7dYsgUj2v4sdTWpHFbnemZHgNgvCPY3myXPs2A2bVt2Foh9n0bYGuqhjkWTFiLkCUtN1ci7CxsYc95U50v8AQNNLGgykRk0mFqB0vdOhe9PS7LTU4uAFAFMvweJwSQGG4',
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        elevation: 0,
        title: const Text(
          'إدارة الأدوية',
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'إدارة الأدوية',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Manrope',
                    color: Color(0xFF00408B),
                  ),
                ),
                SizedBox(height: 8.h),
                const Text(
                  'تتبع وتحديث قائمة الأدوية المتوفرة في صيدلية المركز.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Manrope',
                    color: Color(0xFF424752),
                  ),
                ),
                SizedBox(height: 24.h),
                // Search and Filter Bar
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'البحث عن اسم الدواء أو الكود الطبي...',
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF727784),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFFC2C6D4),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFFC2C6D4),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF00408B),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF2F3FC),
                        ),
                        onChanged: (value) => setState(() {}),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.filter_list),
                              label: const Text('تصفية'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF545F73),
                                side: const BorderSide(
                                  color: Color(0xFFC2C6D4),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                              label: const Text('إضافة دواء جديد'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF00408B),
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
                childAspectRatio: 1.2,
              ),
              itemCount: _filteredMedicines.length,
              itemBuilder: (context, index) {
                final medicine = _filteredMedicines[index];
                return _MedicineCard(medicine: medicine);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MedicineCard extends StatelessWidget {
  final Map<String, dynamic> medicine;

  const _MedicineCard({required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border(
          bottom: BorderSide(
            color: medicine['isAvailable']
                ? const Color(0xFF00408B)
                : const Color(0xFFC2C6D4),
            width: 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: NetworkImage(medicine['image']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  if (!medicine['isAvailable'])
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                    ),
                  Positioned(
                    top: 12.h,
                    right: 12.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: medicine['isAvailable']
                            ? Colors.green.withOpacity(0.9)
                            : Colors.grey.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        medicine['isAvailable'] ? 'متوفر' : 'غير متوفر',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Manrope',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Content Section
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          medicine['name'],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Manrope',
                            color: Color(0xFF191C22),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, color: Color(0xFF727784)),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    medicine['description'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope',
                      color: Color(0xFF424752),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'الكمية المتوفرة',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Manrope',
                              color: Color(0xFF727784),
                            ),
                          ),
                          Text(
                            '${medicine['quantity']} Box',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Manrope',
                              color: Color(0xFF00408B),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'تاريخ انتهاء الصلاحية',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Manrope',
                              color: Color(0xFF727784),
                            ),
                          ),
                          Text(
                            medicine['expiryDate'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Manrope',
                              color: Color(0xFFBA1A1A),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

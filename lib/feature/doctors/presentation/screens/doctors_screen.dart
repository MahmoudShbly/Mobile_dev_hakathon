import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_dev_hakathon/feature/doctors/model/doctor_model.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Doctor> doctors = [
      const Doctor(
        name: 'د. أحمد الشمراني',
        specialty: 'استشاري جراحة القرنية والليزر',
        rating: 4.9,
        status: 'متاح الآن',
        isAvailable: true,
        imageUrl: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?auto=format&fit=crop&w=400&q=80', // Professional doctor image
      ),
      const Doctor(
        name: 'د. سارة المنصور',
        specialty: 'أخصائية طب وجراحة عيون الأطفال',
        rating: 4.8,
        status: 'متاح ابتداءً من الساعة 4 مساءً',
        isAvailable: false,
        imageUrl: 'https://images.unsplash.com/photo-1594824401543-98276f7f6a6c?auto=format&fit=crop&w=400&q=80', // Female doctor image
      ),
      const Doctor(
        name: 'د. فيصل الحربي',
        specialty: 'استشاري أمراض الشبكية والماء الأزرق',
        rating: 5.0,
        status: 'متاح الآن',
        isAvailable: true,
        imageUrl: 'https://images.unsplash.com/photo-1622253692010-333f2da6031d?auto=format&fit=crop&w=400&q=80', // Professional doctor image
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0057B8)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'قسم العيون',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF00408B)),
            ),
            Text(
              'مشفى المدينة الطبي',
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.grey)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'الأطباء والمتخصصون',
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, color: const Color(0xFF00408B)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF26D7F3).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '12 طبيب',
                    style: TextStyle(color: const Color(0xFF26D7F3), fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  'نخبة من أفضل استشاريي طب العيون',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: doctors.length,
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemBuilder: (context, index) => _buildDoctorCard(context, doctors[index]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context, Doctor doctor) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: Colors.amber.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            children: [
                              Text(doctor.rating.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
                              const Icon(Icons.star, color: Colors.amber, size: 14),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          doctor.name,
                          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF191C22)),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      doctor.specialty,
                      style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          doctor.status,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: doctor.isAvailable ? Colors.green : Colors.grey,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        CircleAvatar(
                          radius: 4,
                          backgroundColor: doctor.isAvailable ? Colors.green : Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              CircleAvatar(
                radius: 40.r,
                backgroundImage: NetworkImage(doctor.imageUrl),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('سيتم تفعيل ميزة المراسلة والاتصال في التحديث القادم!', style: TextStyle(fontFamily: 'Cairo')),
                  backgroundColor: const Color(0xFF00408B),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0057B8),
              minimumSize: Size(double.infinity, 50.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
              elevation: 0,
            ),
            child: Text(
              'تواصل',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

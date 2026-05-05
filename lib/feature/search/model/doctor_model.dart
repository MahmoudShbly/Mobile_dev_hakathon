class Doctor {
  final String name;
  final String specialty;
  final String imageUrl;
  final double rating;
  final bool isAvailable;
  final String availabilityStatus;
  final String availabilityTime;
  final String hospitalName;
  final String departmentName;
  final String? phone;

  const Doctor({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.isAvailable,
    required this.availabilityStatus,
    required this.availabilityTime,
    required this.hospitalName,
    required this.departmentName,
    this.phone,
  });
}

final List<Doctor> sampleDoctors = [
  Doctor(
    name: 'د. أحمد الشمراني',
    specialty: 'استشاري جراحة القرنية والليزك',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBYme-B8BMo8unG7DDVzlrjvO56b2D82icFxt2dcnqS2uMCg3A617mjWW2gqVuQp0-Faq-ovrIq8Zc_quffEhjh6QIK_FOeVzCbuGpQ6TS9zzVnR5vyQL5OIakAQzGM1KtPTVtqZryWiCSpDBrjaZfIDZmfr3_Dj3QagWmIx-3Ze936LXr1f2ZWv7YT3jWllBS0Tu9WnF8hsJ6TlHczYyG7vzhrnLKYPUGke2MXhhDB3PZ9x4NNyZ0oteLQ0hbRzaEtUDydXJMIB6rO',
    rating: 4.9,
    isAvailable: true,
    availabilityStatus: 'متاح الآن',
    availabilityTime: '',
    hospitalName: 'مشفى المدينة الطبي',
    departmentName: 'قسم العيون',
    phone: '+966501234567',
  ),
  Doctor(
    name: 'د. سارة المنصور',
    specialty: 'أخصائية طب وجراحة عيون الأطفال',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBxNr_BJKJmS9_WI32jE68m2dL38WJ2eO5t0RNQ0c9GE6gbWs5IJG3XIoSUK4A0WDc5GCRgnVRoIo1resYhjXu7FC-8cFm2RVdg6K6FrYt3Jh_bm4xdDeav83gJNB3E8D1RE5FPZPh47kf91v88moeZMCaT6b_WcfW4beDvyPS1EOf3RkfUjJtjrdKUljQoPW6EbLtUkYc6OIiXVYZaPC9yhVwXGYGMNk5hlScmwhxQpzKnSdVNxS9qi6xo84QX1o_N1AsEpzWzr6Z6',
    rating: 4.8,
    isAvailable: false,
    availabilityStatus: 'متاح ابتداءً من الساعة 4 مساءً',
    availabilityTime: '4:00 PM',
    hospitalName: 'مشفى المدينة الطبي',
    departmentName: 'قسم العيون',
    phone: '+966502345678',
  ),
  Doctor(
    name: 'د. فيصل الحربي',
    specialty: 'استشاري أمراض الشبكية والماء الأزرق',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuAgZgqkxW43W7y8l6oUoVHDXRskh5TUWTUxOKVjGrwXk6S_cHhbgosUXIqK0ZhdrFuxtK_0BR3mYY2SryIHuowS8O9fS-9OyeAN9ID98cC6eKNh7Nt9OMPAkEDGvO_2FGx5SSWiqX-aGpyYNYWR1OWO4VFV-CxMsrjyunzewcQ1ChcX9rasjjXwta3n-ySG6obVw4FgSxfANpN7pMfuEe0Mv1O_eX2Hi5t-xlYL45FJ4aQFCWoAvGkEj9HdHI3C6hyAlLWved8Ao_ex',
    rating: 5.0,
    isAvailable: true,
    availabilityStatus: 'متاح الآن',
    availabilityTime: '',
    hospitalName: 'مشفى المدينة الطبي',
    departmentName: 'قسم العيون',
    phone: '+966503456789',
  ),
  Doctor(
    name: 'د. ليلى القحطاني',
    specialty: 'أخصائية البصريات والعدسات اللاصقة',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuACSxLxIaswJ6k8Dz9p3zdhd54WqSHDLEEouJjMq8YZitIb4MgXqFFxenSX_qQsq4hmGb0Z-QGMrShRjwWUExa3m98gvEBVPbbsnY_aNFP_sDntvgWD70uOxmKe6OFMJhCXpoQXzb77LWsZaHd9vR41Z33-Zg3VKLdSuVrhIlUFBe2j7CyIk0FPRLGPsHt_msLXH0hSjzcOen5jYm2ZnfW9AFIaSU_tp4SvCx19Q8NV-Vuo1hrPzNnXhqtOKYmHmodveJ4CLYdViUG_',
    rating: 4.7,
    isAvailable: false,
    availabilityStatus: 'متاح ابتداءً من غداً 9 صباحاً',
    availabilityTime: 'Tomorrow 9:00 AM',
    hospitalName: 'مشفى المدينة الطبي',
    departmentName: 'قسم العيون',
    phone: '+966504567890',
  ),
];

enum MedicineAvailability { available, prescription }

class Medicine {
  final String name;
  final String description;
  final String imageUrl;
  final MedicineAvailability availability;
  final String fullDescription;
  final String dosage;
  final String price;
  final String packSize;
  final String warning;
  final List<String> availablePharmacies;

  const Medicine({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.availability,
    required this.fullDescription,
    required this.dosage,
    required this.price,
    required this.packSize,
    required this.warning,
    required this.availablePharmacies,
  });

  bool matches(String query) {
    final lowerQuery = query.toLowerCase();
    return name.toLowerCase().contains(lowerQuery) ||
        description.toLowerCase().contains(lowerQuery) ||
        fullDescription.toLowerCase().contains(lowerQuery);
  }
}

final List<Medicine> searchMedicines = [
  const Medicine(
    name: 'بانادول أدفانس',
    description: '500 ملغ • مسكن للآلام وخافض للحرارة',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCCg9JuCpCzXRZTsETq7Y1rOTE6g4CJa2vqKmHjPSS_mFwo1AV-slZ_FgQy9SzJNfdtOE7AcyeBhYQsQN1vIsJp-TepBT7CejnUJO2buvbBTG1hjvciEq9c1m-qBlor44CqguVcQN8EILDBHRdfTWafkf7vhtgHinQVsfUTDSAOS5kEh5HDYAO12F0fkonWFGtmZJ8bDMp_nmeKRDgDh3CMai5x5UB41Wanfquru_AnfFnMeBpYWoGWobOJBiNXTfYhYJKEYOijBttK',
    availability: MedicineAvailability.available,
    fullDescription:
        'يستخدم بانادول أدفانس لتسكين الآلام المتوسطة والشديدة مثل الصداع، آلام الأسنان، وآلام العضلات. يحتوي على باراسيتامول وكافيين لدعم التأثير والمسكن.',
    dosage: 'قرص إلى قرصين كل 4-6 ساعات حسب الحاجة. لا تتجاوز 8 أقراص يومياً.',
    price: '25.00 ل.س',
    packSize: '24 قرص',
    warning:
        'لا ينصح باستخدامه مع أدوية تحتوي على باراسيتامول أخرى. استشر الطبيب قبل الاستخدام للحوامل ومرضى ضغط الدم.',
    availablePharmacies: ['صيدلية النهدي', 'صيدلية الدواء', 'صيدلية وايتس'],
  ),
  const Medicine(
    name: 'أوغمنتين',
    description: '1 جرام • مضاد حيوي واسع المدى',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDLhXcaG0s4cqcdUNDGY6tTscPIG382j1ks2wyGbbMxg23Sc8yFRJvBs32C_ny3o6oJJ6TinIDPYCywUDNGPO5yjqcUx6RsXXVT9H9LoyNi-8J-aoVIZQO8TQlcz84VeBWM-Oki48NqfaMQNLIqvPc22Ng1kq8SBUySibX0F6VoLCEbxyFuhTFtuyUlakqt21vnl4fO7Ilh7QmluZnZOx1g5Y_8u3su5kFqbnA-XtJMnG_Vt08oD7b2L5UlpexdBJJrEBlruEA-V-TC',
    availability: MedicineAvailability.prescription,
    fullDescription:
        'أوغمنتين مضاد حيوي يستخدم لعلاج عدوى الجهاز التنفسي، الأذن، الجلد والمسالك البولية. يتضمن أموكسيسيلين وحمض الكلافولانيك.',
    dosage: 'قرص كل 12 ساعة مع الطعام. أكمل دورة العلاج الموصوفة بالكامل.',
    price: '48.00 ل.س',
    packSize: '12 قرص',
    warning:
        'لا يُستخدم إذا كان لديك حساسية من البنسلين أو مشتقاته. قد يسبب اضطراباً معوياً.',
    availablePharmacies: ['صيدلية الدواء', 'صيدلية وايتس'],
  ),
  const Medicine(
    name: 'ليبيدور',
    description: '20 ملغ • لعلاج الكوليسترول',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuA1Wi3_m1mVZn3cs8ix1-GiFzRF02wM-1JbeThk4UE0o4ZfHgcegMMtH8vzZ75FO4fFj8uk5K6imv8vcN8bktpLH1DJXL0bAynUd5vel4BrrP7CVEGi9JQ3ZCd4VRUC63LD7N0Xyc9BMBXbOc-exEuk3A347PTaJxgQk4To1YqzJj37CmYApIbQ6kRjs18I9PVBbCaUAglEvXgUqwi0kVKzddImF8GTQJXvvsyd2VOLOb7A-lOJsZknIZzUF1B4SqgBj-Av0dwTK5hv',
    availability: MedicineAvailability.available,
    fullDescription:
        'ليبيدور يستخدم للمساعدة في خفض مستويات الكوليسترول الضار في الدم. يحتوي على أتورفاستاتين.',
    dosage: 'قرص واحد يومياً مساءً مع الماء. اتبع توصيات الطبيب.',
    price: '120.00 ل.س',
    packSize: '30 قرص',
    warning:
        'قد يتفاعل مع بعض أدوية القلب. راجع الطبيب إذا كنت تعاني من مشاكل كبدية.',
    availablePharmacies: ['صيدلية النهدي', 'صيدلية كنوز'],
  ),
  const Medicine(
    name: 'شراب كوفكس',
    description: '100 مل • شراب طارد للبلغم',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuAhyJU4KkJMDBeA46jx0_nlFcgoF9ZMz9SS7rFzyjieYCwpyGASleQjV5x94-36wyPBvzR5eutK84zhWQSUsRICou9MqCv7Ck9zBpBUCFrhYdfRLmlv7YobNlJ9QGoL1ebiJWPpGVQhgOdwyvddDyg-ANCi0_W1w1wbhvozziEVCiWsH3cANbXn_EwGPHfAFTo4o0Jo3geZLVe7JSFhjd-GTvEHyXoMv9SX4SsSkOX7_0EPxIsew1jiduRKojW17tfIy9-bCBvYowiZ',
    availability: MedicineAvailability.available,
    fullDescription:
        'شراب كوفكس يساعد على تسييل البلغم وتخفيف السعال. يحتوي على مكونات طاردة للبلغم وآمنة للأطفال البالغين 12 سنة فأكثر.',
    dosage:
        'ملعقة صغيرة ثلاث مرات يومياً بعد الطعام. لا تتجاوز الجرعة المسموح بها.',
    price: '38.00 ل.س',
    packSize: '100 مل',
    warning:
        'لا يستخدم للأطفال تحت 12 سنة دون استشارة الطبيب. قد يسبب نعاساً خفيفاً.',
    availablePharmacies: ['صيدلية الدواء', 'صيدلية وايتس', 'صيدلية كنوز'],
  ),
];

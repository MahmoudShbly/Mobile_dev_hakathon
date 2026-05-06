class Pharmacy {
  final String name;
  final String imageUrl;
  final String distance;
  final String address;
  final bool isFavorite;
  final bool isDisabled;
  final bool isOnDuty;
  final double rating;
  final List<String> services;
  final String hours;
  final String fridayHours;
  final String description;
  final String mapImageUrl;

  final double? latitude;
  final double? longitude;

  const Pharmacy({
    required this.name,
    required this.imageUrl,
    required this.distance,
    required this.address,
    this.isFavorite = false,
    this.isDisabled = false,
    this.isOnDuty = false,
    this.rating = 4.8,
    this.services = const [],
    this.hours = 'من السبت إلى الخميس: 09:00 AM - 11:00 PM',
    this.fridayHours = 'الجمعة: 04:00 PM - 11:00 PM',
    this.description =
        'نحن في هذه الصيدلية نقدم أفضل خدمات الرعاية الصحية والمعلومات الدوائية مع فريق صيدلي متخصص متوفر دائماً.',
    this.mapImageUrl =
        'https://images.unsplash.com/photo-1523961131990-5ea7c61b2107?auto=format&fit=crop&w=900&q=80',
    this.latitude,
    this.longitude,
  });
}

final List<Pharmacy> pharmacies = [
  const Pharmacy(
    name: 'صيدلية النهدي اكسبريس',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBf1LKllmaCP27q4I-dYsDXiKo-5p1hvQTwtrlY51m07mll6qHcKHr8TWDUp6tWJ4e2fy475oZQmOUeMd_kfAgdPXL0PdXU6vCdCym7trk9iB5K4kXjaV8P9E7qbVqbHwv5r1FlH9H3tx9eFYlNqtT1GR7AAdS1XMrRSSo7dFt04XOFEJrBRI2irCK_NAVYArGAEibbkSgKNP7KpBrnDBBUu4izoJgFRayJtd5s2n0Om6db3x0hT3EOajxEuRfQ8jAwU1V_sCkkvU3Q',
    distance: 'على بعد 450 متر',
    address: 'حي الروضة، شارع الأمير محمد بن عبدالعزيز، جدة',
    isOnDuty: true,
    services: ['توصيل منزلي', 'دفع إلكتروني', 'فحص سكري', 'قياس ضغط'],
    latitude: 21.5433,
    longitude: 39.1728,
  ),
  const Pharmacy(
    name: 'صيدلية المجتمع الرئيسية',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBE6zinbdsuCevSMNpeKhg7_yp3c18L08P-Xsx59VK0fh8yLX8C3ONtVZoiH4p_H_7DxaUepHA8Fl985fg7WJrwXFolzUDL-53fDunQSFBlY1YqFz13aVCPGWoZ9aG9MqcJ57lfQbemHFReY7UxO1pfqnaIGaJwUOt2rYBhWmzqSntpbZQ6VogJUrwwyih-5q4MUm91AJ96xnuA1sWAS-gAMicQZbLlqjcMKKgjRbuOkz9RqB4swc5DHjLd5pTEOn5itjsfOqouGCef',
    distance: 'على بعد 1.2 كم',
    address: 'شارع التحلية، بجانب مستشفى التخصصي، جدة',
    isOnDuty: true,
    services: ['توصيل منزلي', 'دفع إلكتروني', 'فحص سكري', 'قياس ضغط'],
    latitude: 21.5500,
    longitude: 39.1800,
  ),
  const Pharmacy(
    name: 'صيدلية الدواء المتميزة',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuAz2UldmKwg1_XB1r9dZz2npq5S9THVssZ_24X0jXXSKmibLQABIlw60nLZXkPnmVX7xp3fBZOBOnPg7Q_xtc1QfbDYRVjZlOFT92bsgPVV1W8atfiTHvYlzZ-fUDBZcGQhk4B9Pn41huN-ZUrb_2l5kDkVXvg8ogN2sNFn-n3SGMcU4UR8QtiH8oQRXreSIkDW_C4WUapaKNZ6R9rUQA0cSofAWytVSolFotunuLwcC6Ha8nDjvWVtyjjUKWwg9qV5VDJQVXBz3F9k',
    distance: 'على بعد 2.4 كم',
    address: 'حي السلامة، طريق المدينة المنورة، جدة',
    isOnDuty: true,
    services: ['توصيل منزلي', 'دفع إلكتروني', 'فحص سكري', 'قياس ضغط'],
    latitude: 21.5800,
    longitude: 39.1600,
  ),
  const Pharmacy(
    name: 'صيدلية وايتس',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDJbrXiZ_80XvZss182MeIVcjDOS0VJH2DNNVF5KLcCZvgEJJD5tOoWon0WQxkP5Ttag83JZHPV3CV__zpM8MdsVn-rXVxRv3ZCAGFPPFy4ZfL7jeonn-IvPETnTd5QisH4ruQt-OfJ2Rz-2Jo9bOTHYSK0AgJwRtrO-m0-e_pdaQijIzvfkbYJgMWZGQrUXCSV0T53D8GoIi-gKqHJwCMxKUkJsco0BJmqJmfvtJzrWK1kb85S6O44re3fN1Mom59W9MmHvLZHkZOy',
    distance: 'على بعد 3.1 كم',
    address: 'شارع صاري، تقاطع طريق الملك، جدة',
    isOnDuty: true,
    services: ['توصيل منزلي', 'دفع إلكتروني', 'فحص سكري', 'قياس ضغط'],
    latitude: 21.5900,
    longitude: 39.1500,
  ),
];

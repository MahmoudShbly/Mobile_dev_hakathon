import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/feature/pharmacy_shifts/model/pharmacy_model.dart';
import 'package:mobile_dev_hakathon/feature/pharmacy_shifts/presentation/widgets/search_section.dart';
import 'package:mobile_dev_hakathon/feature/pharmacy_shifts/presentation/widgets/pharmacy_list.dart';

class PharmacyShiftsScreen extends StatefulWidget {
  const PharmacyShiftsScreen({super.key});

  @override
  State<PharmacyShiftsScreen> createState() => _PharmacyShiftsScreenState();
}

class _PharmacyShiftsScreenState extends State<PharmacyShiftsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Pharmacy> _pharmacies = [
    const Pharmacy(
      name: 'صيدلية النهدي اكسبريس',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBf1LKllmaCP27q4I-dYsDXiKo-5p1hvQTwtrlY51m07mll6qHcKHr8TWDUp6tWJ4e2fy475oZQmOUeMd_kfAgdPXL0PdXU6vCdCym7trk9iB5K4kXjaV8P9E7qbVqbHwv5r1FlH9H3tx9eFYlNqtT1GR7AAdS1XMrRSSo7dFt04XOFEJrBRI2irCK_NAVYArGAEibbkSgKNP7KpBrnDBBUu4izoJgFRayJtd5s2n0Om6db3x0hT3EOajxEuRfQ8jAwU1V_sCkkvU3Q',
      distance: 'على بعد 450 متر',
      address: 'حي الروضة، شارع الأمير محمد بن عبدالعزيز، جدة',
      isOnDuty: true,
    ),
    const Pharmacy(
      name: 'صيدلية المجتمع الرئيسية',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBE6zinbdsuCevSMNpeKhg7_yp3c18L08P-Xsx59VK0fh8yLX8C3ONtVZoiH4p_H_7DxaUepHA8Fl985fg7WJrwXFolzUDL-53fDunQSFBlY1YqFz13aVCPGWoZ9aG9MqcJ57lfQbemHFReY7UxO1pfqnaIGaJwUOt2rYBhWmzqSntpbZQ6VogJUrwwyih-5q4MUm91AJ96xnuA1sWAS-gAMicQZbLlqjcMKKgjRbuOkz9RqB4swc5DHjLd5pTEOn5itjsfOqouGCef',
      distance: 'على بعد 1.2 كم',
      address: 'شارع التحلية، بجانب مستشفى التخصصي، جدة',
      isOnDuty: true,
    ),
    const Pharmacy(
      name: 'صيدلية الدواء المتميزة',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAz2UldmKwg1_XB1r9dZz2npq5S9THVssZ_24X0jXXSKmibLQABIlw60nLZXkPnmVX7xp3fBZOBOnPg7Q_xtc1QfbDYRVjZlOFT92bsgPVV1W8atfiTHvYlzZ-fUDBZcGQhk4B9Pn41huN-ZUrb_2l5kDkVXvg8ogN2sNFn-n3SGMcU4UR8QtiH8oQRXreSIkDW_C4WUapaKNZ6R9rUQA0cSofAWytVSolFotunuLwcC6Ha8nDjvWVtyjjUKWwg9qV5VDJQVXBz3F9k',
      distance: 'على بعد 2.4 كم',
      address: 'حي السلامة، طريق المدينة المنورة، جدة',
      isOnDuty: true,
    ),
    const Pharmacy(
      name: 'صيدلية وايتس',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDJbrXiZ_80XvZss182MeIVcjDOS0VJH2DNNVF5KLcCZvgEJJD5tOoWon0WQxkP5Ttag83JZHPV3CV__zpM8MdsVn-rXVxRv3ZCAGFPPFy4ZfL7jeonn-IvPETnTd5QisH4ruQt-OfJ2Rz-2Jo9bOTHYSK0AgJwRtrO-m0-e_pdaQijIzvfkbYJgMWZGQrUXCSV0T53D8GoIi-gKqHJwCMxKUkJsco0BJmqJmfvtJzrWK1kb85S6O44re3fN1Mom59W9MmHvLZHkZOy',
      distance: 'على بعد 3.1 كم',
      address: 'شارع صاري، تقاطع طريق الملك، جدة',
      isOnDuty: true,
    ),
  ];

  List<Pharmacy> get _filteredPharmacies {
    final query = _searchController.text.trim();
    if (query.isEmpty) return _pharmacies;
    return _pharmacies.where((pharmacy) {
      final lowerQuery = query.toLowerCase();
      return pharmacy.name.toLowerCase().contains(lowerQuery) ||
          pharmacy.address.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text(
          'الصيدليات المناوبة',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: colorScheme.primary),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchSection(searchController: _searchController),
                  const SizedBox(height: 24),
                  PharmacyList(pharmacies: _filteredPharmacies),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

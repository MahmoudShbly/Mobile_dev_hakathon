import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/core/models/pharmacy.dart';
import 'pharmacy_card.dart';

class PharmacyList extends StatelessWidget {
  final List<Pharmacy> pharmacies;

  const PharmacyList({
    super.key,
    required this.pharmacies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pharmacies.length,
      itemBuilder: (context, index) {
        final pharmacy = pharmacies[index];
        return PharmacyCard(
          pharmacy: pharmacy,
        );
      },
    );
  }
}

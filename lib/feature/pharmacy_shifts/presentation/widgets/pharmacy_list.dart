import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/feature/pharmacy_shifts/model/pharmacy_model.dart';
import 'package:mobile_dev_hakathon/feature/pharmacy_shifts/presentation/widgets/pharmacy_card.dart';

class PharmacyList extends StatelessWidget {
  final List<Pharmacy> pharmacies;

  const PharmacyList({super.key, required this.pharmacies});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الصيدليات المفتوحة حالياً (${pharmacies.length})',
            style: theme.textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: pharmacies.length,
              separatorBuilder: (_, _) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                return PharmacyCard(
                  pharmacy: pharmacies[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.pharmacyDetailScreen,
                      arguments: pharmacies[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

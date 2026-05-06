import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_dev_hakathon/core/models/pharmacy.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/core/shared%20widgets/pharmacy_card.dart';

/// Scrollable list of pharmacies for trainings screen.
/// Displays pharmacy cards in a column with bottom padding.
class TrainingsListView extends StatelessWidget {
  final List<Pharmacy> pharmacies;

  const TrainingsListView({super.key, required this.pharmacies});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 120.h),
      child: ListView.builder(
        itemCount: pharmacies.length,
        itemBuilder: (context, index) {
          final pharmacy = pharmacies[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.opportunityDetailScreen,
                arguments: pharmacy,
              );
            },
            borderRadius: BorderRadius.circular(12),
            child: PharmacyCard(pharmacy: pharmacy),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/feature/search/model/medicine_model.dart';

class MedicineList extends StatelessWidget {
  final List<Medicine> medicines;
  final void Function(Medicine)? onTap;

  const MedicineList({super.key, required this.medicines, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (medicines.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            'لم يتم العثور على أدوية مطابقة',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: medicines.length,
        separatorBuilder: (_, _) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final medicine = medicines[index];
          final badgeColor =
              medicine.availability == MedicineAvailability.available
              ? theme.colorScheme.secondaryContainer
              : theme.colorScheme.errorContainer;
          final badgeTextColor =
              medicine.availability == MedicineAvailability.available
              ? theme.colorScheme.onSecondaryContainer
              : theme.colorScheme.onError;
          final badgeLabel =
              medicine.availability == MedicineAvailability.available
              ? 'متوفر'
              : 'وصفة طبية';

          return GestureDetector(
            onTap: onTap == null ? null : () => onTap!(medicine),
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: 0.18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: theme.colorScheme.surface,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        medicine.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                              color: theme.colorScheme.primary,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(
                              Icons.medical_services,
                              color: theme.colorScheme.primary,
                              size: 34,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            medicine.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: theme.colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            medicine.description,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: badgeColor,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              badgeLabel,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: badgeTextColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: theme.colorScheme.primary,
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

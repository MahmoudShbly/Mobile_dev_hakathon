import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_dev_hakathon/feature/pharmacy_shifts/model/pharmacy_model.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // بيانات وهمية للمفضلة (نستخدم الصيدليات من القائمة العامة)
    final favoritePharmacies = pharmacies.take(2).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFF),
      appBar: AppBar(
        title: Text(
          'المفضلة',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF00408B),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF00408B)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: favoritePharmacies.isEmpty
          ? _buildEmptyState(theme, colorScheme)
          : ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: favoritePharmacies.length,
              itemBuilder: (context, index) {
                final pharmacy = favoritePharmacies[index];
                return _buildFavoriteItem(context, pharmacy, theme, colorScheme);
              },
            ),
    );
  }

  Widget _buildEmptyState(ThemeData theme, ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80.sp, color: colorScheme.outline),
          SizedBox(height: 16.h),
          Text(
            'لا يوجد عناصر في المفضلة',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteItem(
    BuildContext context,
    Pharmacy pharmacy,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(12.w),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.network(
            pharmacy.imageUrl,
            width: 60.w,
            height: 60.w,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              width: 60.w,
              height: 60.w,
              color: colorScheme.surfaceContainer,
              child: Icon(Icons.local_pharmacy, color: colorScheme.primary),
            ),
          ),
        ),
        title: Text(
          pharmacy.name,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          pharmacy.address,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodySmall,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.favorite, color: Colors.red),
          onPressed: () {
            // منطق الحذف من المفضلة
          },
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.pharmacyDetailScreen,
            arguments: pharmacy,
          );
        },
      ),
    );
  }
}

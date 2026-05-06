import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Segmented filter bar for trainings (Full-time / Part-time)
/// Handles UI presentation only; parent manages state.
class TrainingsFilterBar extends StatelessWidget {
  final int selectedFilter;
  final ValueChanged<int> onFilterChanged;

  const TrainingsFilterBar({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          border: BoxBorder.all(color: const Color(0xFF0057B8), width: 1),
        ),
        child: Row(
          children: [
            _buildFilterButton(
              context,
              label: 'فرص عمل ',
              isSelected: selectedFilter == 0,
              onTap: () => onFilterChanged(0),
            ),
            _buildFilterButton(
              context,
              label: 'فرص تدريب',
              isSelected: selectedFilter == 1,
              onTap: () => onFilterChanged(1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF0057B8) : Colors.transparent,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: isSelected ? Colors.white : const Color(0xFF191C22),
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

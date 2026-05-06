import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/feature/search/model/medicine_model.dart';
import 'package:mobile_dev_hakathon/feature/search/model/hospital_model.dart';
import 'package:mobile_dev_hakathon/feature/search/model/doctor_model.dart';
import 'package:mobile_dev_hakathon/feature/search/presentation/widgets/doctor_list.dart';
import 'package:mobile_dev_hakathon/feature/search/presentation/widgets/medicine_list.dart';
import 'package:mobile_dev_hakathon/feature/search/presentation/widgets/search_field.dart';
import 'package:mobile_dev_hakathon/feature/search/presentation/widgets/hospital_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  String _selectedCategory = 'أدوية';

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  String get _searchQuery => _searchController.text.trim();

  bool get _hasSearchQuery => _searchQuery.isNotEmpty;

  List<Medicine> get _filteredMedicines {
    if (_searchQuery.isEmpty) return searchMedicines;
    return searchMedicines
        .where((medicine) => medicine.matches(_searchQuery))
        .toList();
  }

  List<Hospital> get _filteredHospitals {
    if (_searchQuery.isEmpty) return searchHospitals;
    final lowerQuery = _searchQuery.toLowerCase();
    return searchHospitals.where((hospital) {
      return hospital.name.toLowerCase().contains(lowerQuery) ||
          hospital.location.toLowerCase().contains(lowerQuery) ||
          hospital.specialties.any(
            (specialty) => specialty.toLowerCase().contains(lowerQuery),
          );
    }).toList();
  }

  List<Doctor> get _filteredDoctors {
    if (_searchQuery.isEmpty) return sampleDoctors;
    final lowerQuery = _searchQuery.toLowerCase();
    return sampleDoctors.where((doctor) {
      return doctor.name.toLowerCase().contains(lowerQuery) ||
          doctor.specialty.toLowerCase().contains(lowerQuery) ||
          doctor.hospitalName.toLowerCase().contains(lowerQuery) ||
          doctor.departmentName.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  Widget _buildSearchField(ThemeData theme) {
    return SearchField(
      controller: _searchController,
      focusNode: _searchFocusNode,
      onChanged: (value) {
        setState(() {});
      },
      onClear: () {
        _searchController.clear();
        setState(() {});
      },
      onTap: () {
        setState(() {});
      },
    );
  }

  Widget _buildCategoryChips(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildCategoryChip('أدوية', theme),
        const SizedBox(width: 16),
        _buildCategoryChip('أجهزة طبية', theme),
        const SizedBox(width: 16),
        _buildCategoryChip('أطباء', theme),
      ],
    );
  }

  Widget _buildCategoryChip(String category, ThemeData theme) {
    final isSelected = _selectedCategory == category;
    final iconColor = isSelected ? Colors.white : const Color(0xFF191B23);
    final iconData = category == 'أدوية'
        ? Icons.medical_services_outlined
        : category == 'أجهزة طبية'
        ? Icons.settings_overscan
        : Icons.medical_information;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = category;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0040A1) : const Color(0xFFE7E7F2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData, size: 18, color: iconColor),
            const SizedBox(width: 8),
            Text(
              category,
              style: TextStyle(
                color: iconColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Manrope',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicineList(ThemeData theme) {
    return MedicineList(
      medicines: _filteredMedicines,
      onTap: (medicine) {
        Navigator.pushNamed(
          context,
          Routes.medicineDetailScreen,
          arguments: medicine,
        );
      },
    );
  }

  Widget _buildDoctorList(ThemeData theme) {
    return DoctorList(doctors: _filteredDoctors);
  }

  Widget _buildHospitalList(ThemeData theme) {
    return HospitalList(hospitals: _filteredHospitals);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('الدواء'),
        centerTitle: false,
        elevation: 0,
        backgroundColor: colorScheme.onPrimary,
        foregroundColor: colorScheme.onSurface,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('قريباً: ميزة التصفية المتقدمة!', style: TextStyle(fontFamily: 'Cairo')),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: Icon(Icons.tune, color: colorScheme.onSurfaceVariant),
            tooltip: 'التصفية',
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('لا توجد إشعارات جديدة حالياً', style: TextStyle(fontFamily: 'Cairo')),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: Icon(
              Icons.notifications,
              color: colorScheme.onSurfaceVariant,
            ),
            tooltip: 'الإشعارات',
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
                  _buildSearchField(theme),
                  const SizedBox(height: 18),
                  _buildCategoryChips(theme),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      _selectedCategory == 'أدوية'
                          ? (_hasSearchQuery
                                ? 'نتائج البحث عن دواء'
                                : 'قائمة الأدوية المتاحة')
                          : _selectedCategory == 'أطباء'
                          ? (_hasSearchQuery
                                ? 'نتائج البحث عن الأطباء'
                                : 'أفضل الأطباء المتاحين حالياً')
                          : 'المستشفيات والأقسام',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: _selectedCategory == 'أدوية'
                        ? _buildMedicineList(theme)
                        : _selectedCategory == 'أطباء'
                        ? _buildDoctorList(theme)
                        : _buildHospitalList(theme),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

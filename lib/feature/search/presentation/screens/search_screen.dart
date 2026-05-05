import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/feature/search/model/medicine_model.dart';
import 'package:mobile_dev_hakathon/feature/search/model/pharmacy_model.dart';
import 'package:mobile_dev_hakathon/feature/search/presentation/widgets/medicine_list.dart';
import 'package:mobile_dev_hakathon/feature/search/presentation/widgets/search_field.dart';
import 'package:mobile_dev_hakathon/feature/search/presentation/widgets/result_list.dart';

import '../../../../core/models/pharmacy.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

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

  List<Pharmacy> get _filteredPharmacies => searchPharmacies;

  List<Medicine> get _filteredMedicines {
    if (_searchQuery.isEmpty) return const [];
    return searchMedicines
        .where((medicine) => medicine.matches(_searchQuery))
        .toList();
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

  Widget _buildPharmacyList(ThemeData theme) {
    return ResultList(pharmacies: _filteredPharmacies);
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
            onPressed: () {},
            icon: Icon(Icons.tune, color: colorScheme.onSurfaceVariant),
            tooltip: 'التصفية',
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: colorScheme.onSurfaceVariant,
            ),
            tooltip: 'الإشعارات',
          ),
        ],
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.arrow_forward, color: colorScheme.primary),
        //   tooltip: 'رجوع',
        // ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      _hasSearchQuery
                          ? 'نتائج البحث عن دواء'
                          : 'نتائج البحث عن دواء في الصيدليات المجاورة',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_hasSearchQuery) ...[
                    _buildMedicineList(theme),
                  ] else ...[
                    _buildPharmacyList(theme),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

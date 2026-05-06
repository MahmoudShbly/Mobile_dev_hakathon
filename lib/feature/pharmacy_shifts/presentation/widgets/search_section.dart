import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  final TextEditingController searchController;

  const SearchSection({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
            ),
            decoration: InputDecoration(
              hintText: 'ابحث عن صيدلية...',
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              filled: true,
              fillColor: colorScheme.onPrimary,
              suffixIcon: Icon(Icons.search, color: colorScheme.primary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

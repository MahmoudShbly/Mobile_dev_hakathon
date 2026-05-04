import 'package:flutter/material.dart';

class SearchResultsHeader extends StatelessWidget {
  const SearchResultsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'نتائج البحث عن دواء في الصيدليات المجاورة',
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
    );
  }
}

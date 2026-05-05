import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/feature/search/presentation/widgets/search_suggestion_chip.dart';

class PlaceholderState extends StatelessWidget {
  const PlaceholderState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAdTSFM9UGtcTerushDIqkOVcVprGjypgw7UxpQrPCnDu2hgRddvySFkR2sWbHrIGgrUlhng_rFY7h3CLSL89p2I3DjueWfV-QiMr82PyIL-O2N0g-MoC-xka1Lr8CL_KqzRlHnJUdqVR2ZB12XBd3oWPAQcqcPJz33MfTCmKWZEuKG50bhUAeNQiDMx8b_VRGbFDU9PBPNOOnBCmdw3iIqGrVWhyg_BzFZMHvTexc5QfnYdHQHNrpxoO79DNh4DQBmHYDIihsaHhja',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'ابحث عن الدواء الذي تحتاجه',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'أدخل اسم الدواء في حقل البحث أعلاه للبدء',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: const [
              SearchSuggestionChip(label: 'مسكنات'),
              SearchSuggestionChip(label: 'مضادات حيوية'),
              SearchSuggestionChip(label: 'فيتامينات'),
            ],
          ),
        ],
      ),
    );
  }
}

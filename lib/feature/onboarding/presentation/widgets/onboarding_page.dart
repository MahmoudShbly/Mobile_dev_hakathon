import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/feature/onboarding/presentation/widgets/page_indicator.dart';
import 'package:mobile_dev_hakathon/core/theme/app_spacing.dart';

class OnboardingPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final bool showSkipButton;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final VoidCallback? onSkipPressed;
  final int currentPage;
  final int pageCount;

  const OnboardingPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.showSkipButton = false,
    this.buttonText,
    this.onButtonPressed,
    this.onSkipPressed,
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFF),
      body: SafeArea(
        child: Column(
          children: [
            if (showSkipButton)
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: onSkipPressed,
                    child: const Text(
                      'تخطي',
                      style: TextStyle(
                        color: Color(0xFF727784),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Illustration
                    Expanded(
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 80,
                              color: colorScheme.primary,
                            ),
                          );
                        },
                      ),
                    ),
                    AppSpacing.verticalSpaceXxl,
                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00408B),
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    AppSpacing.verticalSpaceMd,
                    // Description
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF545F73),
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.verticalSpaceLg,
            PageIndicator(currentPage: currentPage, pageCount: pageCount),
            if (buttonText != null)
              Padding(
                padding: EdgeInsets.fromLTRB(24, 24, 24, 40),
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0057B8),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    buttonText!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final bool showSkipButton;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final VoidCallback? onSkipPressed;

  const OnboardingPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.showSkipButton = false,
    this.buttonText,
    this.onButtonPressed,
    this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
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
                    child: Text(
                      'تخطي',
                      style: TextStyle(
                        color: colorScheme.onSecondaryContainer,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
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
                    Container(
                      width: 320,
                      height: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.contain,
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
                    const SizedBox(height: 40),
                    // Title
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.inverseSurface,
                        height: 1.2,
                        letterSpacing: -0.01,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    // Description
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: colorScheme.onSecondaryContainer,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            if (buttonText != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primaryContainer,
                    foregroundColor: colorScheme.onPrimary,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    buttonText!,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

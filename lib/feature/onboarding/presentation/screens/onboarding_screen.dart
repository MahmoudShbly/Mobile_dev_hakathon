import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/core/utils/shared_preferences_helper.dart';
import 'package:mobile_dev_hakathon/feature/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:mobile_dev_hakathon/feature/onboarding/presentation/widgets/page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'imageUrl': 'assets/image/screen.png',
      'title': 'ابحث عن صيدلية للتدريب',
      'description':
          'اكتشف أفضل الفرص التدريبية في كبرى الصيدليات القريبة منك، تواصل مع المشرفين مباشرة، وابدأ رحلتك المهنية في بيئة تعليمية متميزة تدعم طموحاتك العلمية والعملية.',
      'showSkipButton': false,
      'buttonText': 'ابدأ الآن',
    },
    {
      'imageUrl': 'assets/image/screen1.png',
      'title': 'البحث عن الدواء',
      'description':
          'استكشف مخزون آلاف الصيدليات المعتمدة بضغطة واحدة. يوفر لك تطبيقنا وصولاً فورياً للمخزون الحقيقي والأسعار الرسمية المحدثة، مما يضمن لك العثور على دوائك بأمان وسهولة في منطقتك.',
      'showSkipButton': true,
      'buttonText': 'التالي',
    },
    {
      'imageUrl': 'assets/image/screen3.png',
      'title': 'الصيدليات المناوبة',
      'description':
          'اعثر على أقرب صيدلية مفتوحة في أي وقت من اليوم، حتى في الساعات المتأخرة من الليل مع تحديثات لحظية للمواقع وتفاصيل الاتصال المباشرة لضمان وصولك السريع للأدوية الضرورية.',
      'showSkipButton': false,
      'buttonText': 'التالي',
    },
  ];

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _skipOnboarding() {
    _completeOnboarding();
  }

  void _completeOnboarding() async {
    await SharedPreferencesHelper.setOnboardingCompleted(true);
    if (mounted) {
      Navigator.pushReplacementNamed(context, Routes.loginScreen);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              final page = _pages[index];
              return OnboardingPage(
                imageUrl: page['imageUrl'],
                title: page['title'],
                description: page['description'],
                showSkipButton: page['showSkipButton'],
                buttonText: page['buttonText'],
                onButtonPressed: _nextPage,
                onSkipPressed: _skipOnboarding,
              );
            },
          ),
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: PageIndicator(
              currentPage: _currentPage,
              pageCount: _pages.length,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/core/utils/shared_preferences_helper.dart';
import 'package:mobile_dev_hakathon/feature/onboarding/presentation/widgets/onboarding_page.dart';

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
      'imageUrl': 'assets/image/image-removebg-preview (8).png',
      'title': 'انطلق في مسيرتك المهنية',
      'description':
          'نوفر لطلاب وخريجي الصيدلة وصولاً مباشراً لأفضل فرص التدريب الميداني في كبرى الصيدليات. تواصل، تدرب، وابنِ خبرتك العملية في بيئة احترافية.',
      'showSkipButton': true,
      'buttonText': 'التالي',
    },
    {
      'imageUrl': 'assets/image/image-removebg-preview (9).png',
      'title': 'أدويتك بين يديك',
      'description':
          'وفر وقتك وجهدك. ابحث عن الأدوية التي تحتاجها، واستعرض توفرها وأسعارها الرسمية في الصيدليات القريبة منك بخطوات بسيطة وسريعة.',
      'showSkipButton': true,
      'buttonText': 'التالي',
    },
    {
      'imageUrl': 'assets/image/image-removebg-preview (10).png',
      'title': 'رعاية مستمرة على مدار الساعة',
      'description':
          'صحتك لا تنتظر. اكتشف الصيدليات المناوبة القريبة منك في أي وقت، واحصل على المواقع الدقيقة وأرقام التواصل لتلبية احتياجاتك الطارئة.',
      'showSkipButton': false,
      'buttonText': 'ابدأ رحلتك',
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
      Navigator.pushReplacementNamed(
        context,
        Routes.accountTypeSelectionScreen,
      );
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
      body: PageView.builder(
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
            currentPage: _currentPage,
            pageCount: _pages.length,
          );
        },
      ),
    );
  }
}

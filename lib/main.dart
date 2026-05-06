import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/my_app.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/core/utils/shared_preferences_helper.dart';
import 'firebase_options.dart';

void main() async {
  // لضمان استمرارية التشغيل حتى لو فشلت بعض الخدمات
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // تهيئة Firebase باستخدام الخيارات المناسبة للمنصة (مهم جداً للويب)
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ).timeout(const Duration(seconds: 10));
    } catch (e) {
      debugPrint('Firebase initialization error: $e');
      // لا نتوقف هنا لنسمح للتطبيق بالظهور حتى لو فشل Firebase مؤقتاً
    }

    // التحقق من حالة Onboarding مع وقت انتظار محدد
    bool isOnboardingCompleted = false;
    try {
      isOnboardingCompleted =
          await SharedPreferencesHelper.isOnboardingCompleted().timeout(
            const Duration(seconds: 3),
          );
    } catch (e) {
      debugPrint('SharedPreferences timeout or error: $e');
    }

    // التحقق من حالة تسجيل الدخول
    bool isUserLoggedIn = false;
    try {
      isUserLoggedIn = FirebaseAuth.instance.currentUser != null;
    } catch (e) {
      debugPrint('Auth check error: $e');
    }

    String initialRoute;
    if (!isOnboardingCompleted) {
      initialRoute = Routes.onboardingScreen;
    } else if (isUserLoggedIn) {
      initialRoute = Routes.loginScreen;
    } else {
      initialRoute = Routes.homeScreen;
    }

    runApp(MyApp(initialRoute: initialRoute));
  } catch (e) {
    debugPrint('Fatal error during startup: $e');
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 60),
                const SizedBox(height: 16),
                const Text(
                  'خطأ في تشغيل التطبيق',
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                  onPressed: () => main(),
                  child: const Text('إعادة المحاولة'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

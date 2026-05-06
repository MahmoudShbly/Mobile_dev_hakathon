import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_dev_hakathon/firebase_options.dart';
import 'package:mobile_dev_hakathon/my_app.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/core/utils/shared_preferences_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة Firebase (مطلوب لـ Google Sign-In)
  bool firebaseInitialized = false;
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).timeout(const Duration(seconds: 10));
    firebaseInitialized = true;
    debugPrint('✅ Firebase initialized successfully');
  } catch (e) {
    debugPrint('⚠️ Firebase init failed: $e');
  }

  // التحقق من حالة Onboarding
  bool isOnboardingCompleted = false;
  try {
    isOnboardingCompleted =
        await SharedPreferencesHelper.isOnboardingCompleted();
  } catch (e) {
    debugPrint('SharedPreferences error: $e');
  }

  // التحقق من حالة تسجيل الدخول
  bool isUserLoggedIn = false;
  if (firebaseInitialized) {
    // التحقق من Firebase Auth (يشمل Google Sign-In)
    isUserLoggedIn = FirebaseAuth.instance.currentUser != null;
  }

  String initialRoute;
  if (!isOnboardingCompleted) {
    initialRoute = Routes.onboardingScreen;
  } else if (!isUserLoggedIn) {
    initialRoute = Routes.loginScreen;
  } else {
    initialRoute = Routes.homeScreen;
  }

  runApp(MyApp(initialRoute: initialRoute));
}

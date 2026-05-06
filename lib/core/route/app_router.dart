import 'package:flutter/material.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/feature/auth/email_verification_screen.dart';
import 'package:mobile_dev_hakathon/feature/auth/forgot_password_screen.dart';
import 'package:mobile_dev_hakathon/feature/auth/login_screen.dart';
import 'package:mobile_dev_hakathon/feature/auth/register_screen.dart';
import 'package:mobile_dev_hakathon/feature/auth/reset_password_screen.dart';
import 'package:mobile_dev_hakathon/feature/main/main_screen.dart';
import 'package:mobile_dev_hakathon/feature/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:mobile_dev_hakathon/feature/startup/startup_error_screen.dart';
import 'package:mobile_dev_hakathon/feature/pharmacy_shifts/model/pharmacy_model.dart';
import 'package:mobile_dev_hakathon/feature/pharmacy_shifts/presentation/screens/pharmacy_detail_screen.dart';
import 'package:mobile_dev_hakathon/feature/search/model/medicine_model.dart';
import 'package:mobile_dev_hakathon/feature/search/model/hospital_model.dart';
import 'package:mobile_dev_hakathon/feature/search/model/doctor_model.dart';
import 'package:mobile_dev_hakathon/feature/search/presentation/screens/medicine_detail_screen.dart';
import 'package:mobile_dev_hakathon/feature/search/presentation/screens/hospital_detail_screen.dart';
import 'package:mobile_dev_hakathon/feature/search/presentation/screens/doctors_list_screen.dart';
import 'package:mobile_dev_hakathon/feature/profile/presentation/screens/edit_profile_screen.dart';
import 'package:mobile_dev_hakathon/feature/map/presentation/screens/map_screen.dart';
import 'package:mobile_dev_hakathon/feature/doctors/presentation/screens/doctors_screen.dart';
import 'package:mobile_dev_hakathon/feature/profile/presentation/screens/favorites_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _fadeRoute(const OnboardingScreen(), settings);
      case Routes.startupError:
        return _fadeRoute(const StartupErrorScreen(), settings);
      case Routes.onboardingScreen:
        return _fadeRoute(const OnboardingScreen(), settings);
      case Routes.loginScreen:
        return _slideRoute(const LoginScreen(), settings);
      case Routes.registerScreen:
        return _slideRoute(const RegisterScreen(), settings);
      case Routes.forgotPasswordScreen:
        return _slideRoute(const ForgotPasswordScreen(), settings);
      case Routes.resetPasswordScreen:
        return _slideRoute(const ResetPasswordScreen(), settings);
      case Routes.verifyEmailScreen:
        return _slideRoute(const EmailVerificationScreen(), settings);
      case Routes.homeScreen:
        final index = settings.arguments as int? ?? 3;
        return _fadeRoute(MainScreen(initialIndex: index), settings);
      case Routes.editProfileScreen:
        return _slideRoute(const EditProfileScreen(), settings);
      case Routes.pharmacyDetailScreen:
        final pharmacy = settings.arguments;
        if (pharmacy is Pharmacy) {
          return _slideRoute(
            PharmacyDetailScreen(pharmacy: pharmacy),
            settings,
          );
        }
        return null;
      case Routes.medicineDetailScreen:
        final medicine = settings.arguments;
        if (medicine is Medicine) {
          return _slideRoute(
            MedicineDetailScreen(medicine: medicine),
            settings,
          );
        }
        return null;
      case Routes.hospitalDetailScreen:
        final hospital = settings.arguments;
        if (hospital is Hospital) {
          return _slideRoute(
            HospitalDetailScreen(hospital: hospital),
            settings,
          );
        }
        return null;
      case Routes.doctorsListScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        if (args != null) {
          return _slideRoute(
            DoctorsListScreen(
              departmentName: args['departmentName'] ?? 'قسم عام',
              hospitalName: args['hospitalName'] ?? 'مشفى',
              doctors: args['doctors'] ?? sampleDoctors,
            ),
            settings,
          );
        }
        return null;
      case Routes.mapScreen:
        final mapArgs = settings.arguments as Map<String, dynamic>?;
        return _slideRoute(
          MapScreen(
            initialLocation: mapArgs?['location'],
            targetPharmacyName: mapArgs?['pharmacyName'],
          ),
          settings,
        );
      case Routes.doctorsScreen:
        return _slideRoute(const DoctorsScreen(), settings);
      case Routes.favoritesScreen:
        return _slideRoute(const FavoritesScreen(), settings);
      default:
        return null;
    }
  }

  static PageRouteBuilder _slideRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 280),
      reverseTransitionDuration: const Duration(milliseconds: 240),
      pageBuilder: (context, animation, _) => page,
      transitionsBuilder: (context, animation, _, child) {
        final slideAnimation =
            Tween<Offset>(
              begin: const Offset(0.15, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );

        final scaleAnimation = Tween<double>(begin: 0.97, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        );

        return ScaleTransition(
          scale: scaleAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: FadeTransition(opacity: animation, child: child),
          ),
        );
      },
    );
  }

  /// Fade transition (for top-level screens like home, onboarding)
  static PageRouteBuilder _fadeRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
          child: child,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.tajawal().fontFamily,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF00408B),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFF0057B8),
        onPrimaryContainer: Color(0xFFBFd2FF),
        secondary: Color(0xFF545F73),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFD5E0F8),
        onSecondaryContainer: Color(0xFF586377),
        tertiary: Color(0xFF752B00),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFF9B3C00),
        onTertiaryContainer: Color(0xFFFFC5AC),
        error: Color(0xFFBA1A1A),
        onError: Color(0xFFFFFFFF),
        errorContainer: Color(0xFFFFDAD6),
        onErrorContainer: Color(0xFF93000A),
        surface: Color(0xFFF9F9FF),
        onSurface: Color(0xFF191C22),
        surfaceContainerHighest: Color(0xFFE1E2EB),
        onSurfaceVariant: Color(0xFF424752),
        outline: Color(0xFF727784),
        outlineVariant: Color(0xFFC2C6D4),
        shadow: Color(0xFF000000),
        scrim: Color(0xFF000000),
        inverseSurface: Color(0xFF2E3037),
        // inverseOnSurface: Color(0xFFEFF0F9),
        inversePrimary: Color(0xFFADC7FF),
        surfaceTint: Color(0xFF0D5BBC),
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.tajawal(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          height: 1.2,
          letterSpacing: -0.02,
        ),
        headlineMedium: GoogleFonts.tajawal(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          height: 1.2,
          letterSpacing: -0.01,
        ),
        headlineSmall: GoogleFonts.tajawal(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
        bodyLarge: GoogleFonts.tajawal(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.tajawal(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.6,
        ),
        labelMedium: GoogleFonts.tajawal(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1.4,
          letterSpacing: 0.01,
        ),
        labelSmall: GoogleFonts.tajawal(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF191C22),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF0057B8),
        unselectedItemColor: Color(0xFF727784),
        type: BottomNavigationBarType.fixed,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xFF0057B8), width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}

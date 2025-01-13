// lib/theme/app_colors.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();

// Brand Colors
  static const Color primary = Color(0xFFCCC8FF); // Updated main purple color
  static const Color primaryLight = Color(0xFFDEDBFF); // Lighter shade
  static const Color primaryDark = Color(0xFFB3AEFF); // Darker shade

  // Background Colors
  static const Color backgroundDark = Color(0xFF121212); // Deep dark background
  static const Color backgroundMedium = Color(0xFF1E1E1E); // Card backgrounds
  static const Color backgroundLight = Color(0xFF2C2C2C); // Elevated surfaces

  // Overlay Colors
  static const Color overlay30 = Color(0x4D000000); // 30% black overlay
  static const Color overlay50 = Color(0x80000000); // 50% black overlay

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF); // White text
  static const Color textSecondary = Color(0xFFAAAAAA); // Grey text
  static const Color textDisabled = Color(0xFF666666); // Darker grey text

  // Interactive Elements
  static const Color buttonBackground = Color(0xFF2D2B52); // Dark purple button
  static const Color buttonBackgroundActive = Color(0xFF373561);
  static const Color buttonOutline = Color(0xFF4A4A4A);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFB74D);

  // Gradients
  static const List<Color> primaryGradient = [
    Color(0xFFCCC8FF), // Updated gradient start
    Color(0xFFB3AEFF), // Updated gradient end
  ];

  static const List<Color> backgroundGradient = [
    Color(0xFF1E1E1E),
    Color(0xFF121212),
  ];
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.backgroundDark,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.primaryLight,
        surface: AppColors.backgroundMedium,
        onPrimary: AppColors.textPrimary,
        onSecondary: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
      ),
      cardTheme: CardTheme(
        color: AppColors.backgroundMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundDark,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          backgroundColor: AppColors.buttonBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        headlineLarge: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

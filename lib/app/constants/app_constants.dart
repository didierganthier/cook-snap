import 'package:flutter/material.dart';

class AppConstants {
  final String title = "Start Cooking";
  final String subtitle = "Discover and share your favorite recipes";
  final String description = "Let’s join our community to cook better food!";
  final String ctaText = "Get Started";
}

class AppColors {
  static const Color primaryColor = Color(0xFF3f5481);
  static const Color secondaryColor = Color(0xFF9FA5C0);
  static const Color tertiaryColor = Color(0xFFF4F5F7);
  static const Color accentColor = Color(0xFF21CC79);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color textColor = Color(0xFF3E5481);
  static const Color textSecondaryColor = Color(0xFF9FA5C0);
  static const Color textTertiaryColor = Color(0xFF2E3E5C);
  static const Color textQuaternaryColor = Color(0xFFFFFFFF);
  static const Color dangerColor = Color(0xFFFF6464);
}

class TextThemes {
  static const TextStyle ctaTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.7,
  );

  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.8,
    color: AppColors.textTertiaryColor,
    height: 2.5,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    height: 1.2,
    color: AppColors.textSecondaryColor,
  );
}

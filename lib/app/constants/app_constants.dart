import 'dart:ui';

import 'package:flutter/material.dart';

class AppConstants {
  String title = '';
  String subtitle = '';
  final String description;
  final String ctaText;

  AppConstants({
    required this.title,
    required this.subtitle,
    this.description = '',
    this.ctaText = '',
  });

  factory AppConstants.getConstants() {
    return AppConstants(
      title: "Start Cooking",
      subtitle: "Discover and share your favorite recipes",
      description: "Let’s join our community to cook better food!",
      ctaText: "Get Started",
    );
  }
}

class AppColors {
  static const Color primaryColor = Color(0xFF3f5481);
  static const Color secondaryColor = Color(0xFF9FA5C0);
  static const Color tertiaryColor = Color(0xFFF4F5F7);
  static const Color accentColor = Color(0xFF21CC79);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFFD0DBEA);
  static const Color textColor = Color(0xFF3E5481);
  static const Color textSecondaryColor = Color(0xFF9FA5C0);
  static const Color textTertiaryColor = Color(0xFF2E3E5C);
  static const Color textQuaternaryColor = Color(0xFFFFFFFF);
  static const Color dangerColor = Color(0xFFFF5842);
  static const Color darkColor = Color(0xFF000000);
}

class TextThemes {
  static const TextStyle ctaTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontVariations: [
      FontVariation('wght', 700),
    ],
    letterSpacing: 0.7,
  );

  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontVariations: [
      FontVariation('wght', 700),
    ],
    letterSpacing: 0.8,
    color: AppColors.textTertiaryColor,
    height: 2.5,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.normal,
    fontVariations: [
      FontVariation('wght', 400),
    ],
    letterSpacing: 0.5,
    height: 1.2,
    color: AppColors.textSecondaryColor,
  );

  static const TextStyle textFieldsHintStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontVariations: [
      FontVariation('wght', 500),
    ],
    letterSpacing: 0.5,
    color: AppColors.textSecondaryColor,
  );

  static const TextStyle textFieldsStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontVariations: [
      FontVariation('wght', 500),
    ],
    letterSpacing: 0.5,
    color: AppColors.textColor,
  );
}

class CallToActionTheme {
  static TextButtonThemeData primaryTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.accentColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
    ),
  );

  static TextButtonThemeData secondaryTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.tertiaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
    ),
  );

  static TextButtonThemeData tertiaryTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.backgroundColor,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: AppColors.textSecondaryColor,
          strokeAlign: 0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
    ),
  );

  static TextButtonThemeData dangerTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.dangerColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
    ),
  );

  static TextButtonThemeData nakedTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
    ),
  );

  static TextButtonThemeData darkTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.darkColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
    ),
  );
}

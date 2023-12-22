import 'package:cook_snap/types/colors.dart';
import 'package:flutter/widgets.dart';

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

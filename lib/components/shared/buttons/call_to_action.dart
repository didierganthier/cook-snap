import 'package:cook_snap/types/colors.dart';
import 'package:cook_snap/types/themes.dart';
import 'package:flutter/material.dart';

enum CallToActionType {
  primary,
  secondary,
  tertiary,
}

class CallToAction extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function() onPressed;
  final void Function()? onLongPressed;
  final CallToActionType type;

  const CallToAction({
    super.key,
    required this.text,
    required this.onPressed,
    this.onLongPressed,
    this.icon,
    this.type = CallToActionType.primary,
  });

  @override
  Widget build(BuildContext context) {
    TextButtonThemeData primaryTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.accentColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
      ),
    );

    TextButtonThemeData secondaryTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.tertiaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
      ),
    );

    TextButtonThemeData tertiaryTheme = TextButtonThemeData(
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

    getButtonTheme() {
      switch (type) {
        case CallToActionType.primary:
          return primaryTheme;
        case CallToActionType.secondary:
          return secondaryTheme;
        case CallToActionType.tertiary:
          return tertiaryTheme;
      }
    }

    getTextColor() {
      switch (type) {
        case CallToActionType.primary:
          return AppColors.textQuaternaryColor;
        case CallToActionType.secondary:
          return AppColors.textTertiaryColor;
        case CallToActionType.tertiary:
          return AppColors.textSecondaryColor;
      }
    }

    var iconItem = icon != null
        ? Icon(
            icon,
            color: getTextColor(),
          )
        : null;

    return TextButton(
      style: getButtonTheme().style,
      onPressed: onPressed,
      onLongPress: onLongPressed,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: iconItem),
            Text(
              text,
              style: TextThemes.ctaTextStyle.copyWith(
                color: getTextColor(),
                shadows: type == CallToActionType.primary
                    ? [
                        const Shadow(
                          color: Color(0x33000000),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ]
                    : [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

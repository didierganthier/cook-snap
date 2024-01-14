import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:flutter/material.dart';

enum CallToActionType {
  primary,
  secondary,
  tertiary,
  danger,
  text,
  dark,
}

enum CallToActionSize {
  small,
  medium,
  large,
}

class CallToAction extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function() onPressed;
  final void Function()? onLongPressed;
  final CallToActionType type;
  final bool isFullWidth;
  final CallToActionSize size;

  const CallToAction({
    super.key,
    required this.text,
    required this.onPressed,
    this.onLongPressed,
    this.icon,
    this.type = CallToActionType.primary,
    this.isFullWidth = true,
    this.size = CallToActionSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    getButtonTheme() {
      switch (type) {
        case CallToActionType.primary:
          return CallToActionTheme.primaryTheme;
        case CallToActionType.secondary:
          return CallToActionTheme.secondaryTheme;
        case CallToActionType.tertiary:
          return CallToActionTheme.tertiaryTheme;
        case CallToActionType.danger:
          return CallToActionTheme.dangerTheme;
        case CallToActionType.text:
          return CallToActionTheme.nakedTheme;
        case CallToActionType.dark:
          return CallToActionTheme.darkTheme;
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
        case CallToActionType.danger:
          return AppColors.textQuaternaryColor;
        case CallToActionType.text:
          return AppColors.textTertiaryColor;
        case CallToActionType.dark:
          return AppColors.textQuaternaryColor;
      }
    }

    getSize() {
      switch (size) {
        case CallToActionSize.small:
          return 2.0;
        case CallToActionSize.medium:
          return 6.0;
        case CallToActionSize.large:
          return 10.0;
      }
    }

    Icon? iconItem =
        icon != null ? Icon(icon, color: getTextColor(), size: 16.0) : null;

    Widget callToActionWidget = TextButton(
      style: getButtonTheme().style,
      onPressed: onPressed,
      onLongPress: onLongPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: getSize(), horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconItem ?? const SizedBox(width: 0.0),
            SizedBox(width: icon != null ? 8.0 : 0.0),
            Text(
              text,
              style: TextThemes.ctaTextStyle.copyWith(
                letterSpacing: 0.2,
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

    return isFullWidth
        ? callToActionWidget
        : IntrinsicWidth(
            child: callToActionWidget,
          );
  }
}

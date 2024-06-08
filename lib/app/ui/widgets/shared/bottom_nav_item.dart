import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final String label;
  final void Function() onPressed;
  final bool? isCallToAction;

  const BottomNavBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.isActive,
    this.isCallToAction = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: InkWell(
        onTap: !isCallToAction! ? onPressed : null,
        child: SizedBox(
          width: 85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20.0,
                color:
                    isActive ? AppColors.accentColor : AppColors.secondaryColor,
              ),
              const SizedBox(height: 4.0),
              Text(
                label,
                style: TextThemes.navLabelStyle.copyWith(
                  color: isActive
                      ? AppColors.accentColor
                      : AppColors.textSecondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

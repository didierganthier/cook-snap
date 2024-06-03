import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/utils/cook_snap_icons.dart';
import 'package:flutter/material.dart';

class ScanBottomNavBarCta extends StatelessWidget {
  final void Function() onPressed;
  const ScanBottomNavBarCta({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.accentColor,
      elevation: 0.0,
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: const Icon(CookSnapIcons.scan),
    );
  }
}

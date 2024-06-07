import 'package:cook_snap/app/constants/routes.dart';
import 'package:cook_snap/app/ui/widgets/shared/bottom_nav_item.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onIndexChanged;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: AppRoutes.bottomNavBarRoutes.map((route) {
            return BottomNavBarItem(
              icon: route['icon'],
              label: route['label'],
              isActive: currentIndex == route['id'],
              isCallToAction: route['id'] == 2,
              onPressed: () {
                if (route['id'] == 2) {
                  return;
                }
                onIndexChanged(route['id'] as int);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

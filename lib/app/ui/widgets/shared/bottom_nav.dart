import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/constants/routes.dart';
import 'package:cook_snap/app/ui/widgets/shared/bottom_nav_item.dart';
import 'package:cook_snap/utils/cook_snap_icons.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  const BottomNavBar({super.key, required this.currentIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _currentItemIndex;

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentItemIndex = widget.currentIndex;
    });
  }

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
              isActive: _currentItemIndex == route['id'],
              isCallToAction: route['id'] == 2,
              onPressed: () {
                setState(() {
                  if (route['id'] == 2) {
                    return;
                  }
                  _currentItemIndex = route['id'];
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

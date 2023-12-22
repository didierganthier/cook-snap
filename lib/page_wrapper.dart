import 'package:cook_snap/pages/start_page.dart';
import 'package:cook_snap/types/colors.dart';
import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.backgroundColor),
      child: const SafeArea(
        child: StartPage(),
      ),
    );
  }
}

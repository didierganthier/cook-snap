import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cms = AppConstants.getLoginConstants();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  cms.title,
                  style: TextThemes.titleTextStyle,
                ),
                Text(
                  cms.subtitle,
                  style: TextThemes.subtitleTextStyle,
                ),
                const InputField(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

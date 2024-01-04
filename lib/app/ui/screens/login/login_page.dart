import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/constants/constant_classes/login_page_constants.dart';
import 'package:cook_snap/app/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cms = LoginPageConstants.getConstants();
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
                InputField(
                  type: InputFieldType.email,
                  hint: cms.emailFieldLabel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

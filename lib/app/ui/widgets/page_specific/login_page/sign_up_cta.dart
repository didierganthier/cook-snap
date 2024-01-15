import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/constants/constant_classes/login_page_constants.dart';
import 'package:flutter/material.dart';

class SignUpCallToAction extends StatelessWidget {
  final LoginPageConstants cms;
  final VoidCallback onPressed;

  const SignUpCallToAction({
    super.key,
    required this.cms,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cms.dontHaveAccountLabel,
          style: TextThemes.textFieldsStyle,
        ),
        InkWell(
          onTap: onPressed,
          customBorder: const StadiumBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cms.signupCtaLabel,
              style: TextThemes.textFieldsStyle.copyWith(
                color: AppColors.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

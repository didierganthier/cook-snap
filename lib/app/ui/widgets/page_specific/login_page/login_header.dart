import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/constants/constant_classes/login_page_constants.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({required this.cms});

  final LoginPageConstants cms;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(cms.title, style: TextThemes.titleTextStyle),
        Text(cms.subtitle, style: TextThemes.subtitleTextStyle),
      ],
    );
  }
}

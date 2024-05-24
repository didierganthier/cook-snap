import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/constants/constant_classes/signup_page_constants.dart';
import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({required this.cms});

  final SignUpPageConstants cms;

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

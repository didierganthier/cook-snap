import 'package:cook_snap/app/constants/constant_classes/login_page_constants.dart';
import 'package:cook_snap/app/ui/screens/signup/signup_page.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/login_page/sign_up_cta.dart';
import 'package:flutter/material.dart';

class _SignUpCTA extends StatelessWidget {
  const _SignUpCTA({required this.cms});

  final LoginPageConstants cms;

  @override
  Widget build(BuildContext context) {
    return SignUpCallToAction(
      cms: cms,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SignUpPage()),
        );
      },
    );
  }
}

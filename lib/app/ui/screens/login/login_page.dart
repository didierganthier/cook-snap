import 'package:cook_snap/app/constants/constant_classes/login_page_constants.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/login_page/email_password_form.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/login_page/login_header.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/login_page/signup_cta.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/login_page/social_login_options.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginPageConstants cms = LoginPageConstants.getConstants();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LoginHeader(cms: cms),
              const SizedBox(height: 32),
              EmailPasswordForm(cms: cms),
              const SizedBox(height: 24),
              SignUpCTA(cms: cms),
              const SizedBox(height: 24),
              SocialLoginOptions(cms: cms),
            ],
          ),
        ),
      ),
    );
  }
}

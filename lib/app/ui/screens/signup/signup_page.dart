import 'package:cook_snap/app/constants/constant_classes/signup_page_constants.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/signup_page/email_password_form.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/signup_page/signup_header.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/signup_page/social_signup_options.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpPageConstants cms = SignUpPageConstants.getConstants();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SignUpHeader(cms: cms),
              const SizedBox(height: 32),
              SignUpEmailPasswordForm(cms: cms),
              const SizedBox(height: 24),
              SocialSignUpOptions(cms: cms),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

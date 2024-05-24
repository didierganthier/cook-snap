import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/constants/constant_classes/signup_page_constants.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/signup_page/email_password_form.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final SignUpPageConstants cms = SignUpPageConstants.getConstants();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              const Text(
                'CookSnap',
                style: TextThemes.titleTextStyle,
              ),
              Text(
                cms.title,
                style: TextThemes.titleTextStyle,
              ),
              Text(
                cms.subtitle,
                style: TextThemes.subtitleTextStyle,
              ),
              const SizedBox(height: 32),
              SignUpEmailPasswordForm(
                cms: cms,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

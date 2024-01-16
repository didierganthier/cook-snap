import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/constants/constant_classes/signup_page_constants.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/signup_page/email_password_form.dart';
import 'package:cook_snap/app/ui/widgets/shared/call_to_action.dart';
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
              CallToAction(
                text: cms.signupCtaLabel,
                type: CallToActionType.primary,
                onPressed: () {
                  // todo: email password login
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/constants/constant_classes/login_page_constants.dart';
import 'package:cook_snap/app/data/services/supabase_service.dart';
import 'package:cook_snap/app/ui/screens/signup/signup_page.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/login_page/email_password_form.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/login_page/sign_up_cta.dart';
import 'package:cook_snap/app/ui/widgets/shared/call_to_action.dart';
import 'package:cook_snap/utils/cook_snap_icons.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginPageConstants cms = LoginPageConstants.getConstants();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
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
                  EmailPasswordForm(cms: cms),
                  const SizedBox(height: 24),
                  SignUpCallToAction(
                    cms: cms,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    cms.orContinueWithLabel,
                    style: TextThemes.subtitleTextStyle,
                  ),
                  const SizedBox(height: 24),
                  CallToAction(
                    text: cms.googleCtaLabel,
                    type: CallToActionType.danger,
                    icon: CookSnapIcons.google,
                    onPressed: () {
                      SupabaseService().signInWithGoogle();
                    },
                  ),
                  const SizedBox(height: 18),
                  CallToAction(
                    text: cms.appleCtaLabel,
                    type: CallToActionType.dark,
                    icon: CookSnapIcons.apple,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

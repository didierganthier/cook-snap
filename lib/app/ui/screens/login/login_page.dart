import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/constants/constant_classes/login_page_constants.dart';
import 'package:cook_snap/app/data/services/supabase_service.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/login_page/email_password_form.dart';
import 'package:cook_snap/app/ui/widgets/shared/call_to_action.dart';
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
                  const SizedBox(height: 64),
                  CallToAction(
                    text: 'Google',
                    type: CallToActionType.danger,
                    icon: Icons.group_work_outlined,
                    onPressed: () {
                      SupabaseService().signInWithGoogle();
                    },
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

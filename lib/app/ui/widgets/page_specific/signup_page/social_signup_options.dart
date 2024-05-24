import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/constants/constant_classes/login_page_constants.dart';
import 'package:cook_snap/app/constants/constant_classes/signup_page_constants.dart';
import 'package:cook_snap/app/ui/viewmodels/user_viewmodel.dart';
import 'package:cook_snap/app/ui/widgets/shared/call_to_action.dart';
import 'package:cook_snap/utils/cook_snap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocialSignUpOptions extends StatelessWidget {
  const SocialSignUpOptions({required this.cms});

  final SignUpPageConstants cms;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(cms.orContinueWithLabel, style: TextThemes.subtitleTextStyle),
        const SizedBox(height: 24),
        CallToAction(
          text: cms.googleCtaLabel,
          type: CallToActionType.danger,
          icon: CookSnapIcons.google,
          onPressed: () => Provider.of<UserViewModel>(context, listen: false)
              .signInWithGoogle(context),
        ),
        const SizedBox(height: 18),
        CallToAction(
          text: cms.appleCtaLabel,
          type: CallToActionType.dark,
          icon: CookSnapIcons.apple,
          onPressed: () {},
        ),
      ],
    );
  }
}

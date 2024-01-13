import 'package:cook_snap/app/constants/constant_classes/login_page_constants.dart';
import 'package:cook_snap/app/ui/widgets/shared/call_to_action.dart';
import 'package:cook_snap/app/ui/widgets/shared/input_field.dart';
import 'package:flutter/material.dart';

class EmailPasswordForm extends StatelessWidget {
  final LoginPageConstants cms;
  const EmailPasswordForm({super.key, required this.cms});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          type: InputFieldType.email,
          hint: cms.emailFieldLabel,
        ),
        const SizedBox(height: 18),
        InputField(
          type: InputFieldType.password,
          hint: cms.passwordFieldLabel,
        ),
        const SizedBox(height: 32),
        CallToAction(
          text: 'Login',
          type: CallToActionType.primary,
          onPressed: () {
            // todo: email password login
          },
        ),
      ],
    );
  }
}

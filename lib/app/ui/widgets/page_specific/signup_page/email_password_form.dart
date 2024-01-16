import 'package:cook_snap/app/constants/constant_classes/signup_page_constants.dart';
import 'package:cook_snap/app/ui/widgets/shared/input_field.dart';
import 'package:flutter/widgets.dart';

class SignUpEmailPasswordForm extends StatelessWidget {
  final SignUpPageConstants cms;
  const SignUpEmailPasswordForm({super.key, required this.cms});

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
      ],
    );
  }
}

import 'package:cook_snap/app/constants/constant_classes/signup_page_constants.dart';
import 'package:cook_snap/app/ui/widgets/shared/call_to_action.dart';
import 'package:cook_snap/app/ui/widgets/shared/input_field.dart';
import 'package:flutter/material.dart';

class SignUpEmailPasswordForm extends StatefulWidget {
  final SignUpPageConstants cms;
  const SignUpEmailPasswordForm({super.key, required this.cms});

  @override
  State<SignUpEmailPasswordForm> createState() =>
      _SignUpEmailPasswordFormState();
}

class _SignUpEmailPasswordFormState extends State<SignUpEmailPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage;
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputField(
            type: InputFieldType.email,
            hint: widget.cms.emailFieldLabel,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              } else if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          InputField(
            type: InputFieldType.password,
            inputController: _passwordController,
            hint: widget.cms.passwordFieldLabel,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              } else if (value.length < 8) {
                return 'Password should be at least 8 characters long';
              } else if (!value.contains(RegExp(r'[A-Z]'))) {
                return 'Password should contain at least one uppercase letter';
              } else if (!value.contains(RegExp(r'[a-z]'))) {
                return 'Password should contain at least one lowercase letter';
              } else if (!value.contains(RegExp(r'[0-9]'))) {
                return 'Password should contain at least one number';
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          InputField(
            type: InputFieldType.password,
            hint: widget.cms.confirmPasswordFieldLabel,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              } else if (value != _passwordController.text) {
                print(_passwordController.text);
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          if (_errorMessage != null)
            Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
          CallToAction(
            text: widget.cms.signupCtaLabel,
            type: CallToActionType.primary,
            onPressed: () {
              // todo: email password login
              if (_formKey.currentState!.validate()) {
                // Perform sign-up logic here
                print('success');
                // ...
                setState(() => _errorMessage = null);
              } else {
                setState(() => _errorMessage = 'Please fix the errors above');
              }
            },
          ),
        ],
      ),
    );
  }
}

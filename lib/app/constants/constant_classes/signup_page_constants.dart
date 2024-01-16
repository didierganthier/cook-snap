import 'package:cook_snap/app/constants/app_constants.dart';

class SignUpPageConstants extends AppConstants {
  String emailFieldLabel;
  String passwordFieldLabel;
  String passwordMustContainLabel;
  String signupCtaLabel;

  SignUpPageConstants({
    required this.emailFieldLabel,
    required this.passwordFieldLabel,
    required this.passwordMustContainLabel,
    required this.signupCtaLabel,
    required super.subtitle,
    required super.title,
    super.description,
  });

  factory SignUpPageConstants.getConstants() {
    return SignUpPageConstants(
      title: "Welcome!",
      subtitle: "Please enter your account here",
      emailFieldLabel: 'Email or phone number',
      passwordFieldLabel: 'Password',
      signupCtaLabel: 'Sign up',
      passwordMustContainLabel: 'Password must contain:',
    );
  }
}

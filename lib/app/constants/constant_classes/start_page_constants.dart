import 'package:cook_snap/app/constants/app_constants.dart';

class StartPageConstants extends AppConstants {
  String emailFieldLabel;
  String passwordFieldLabel;
  String forgotPasswordCtalabel;
  String loginCtaLabel;
  String orContinueWithLabel;
  String googleCtaLabel;
  String dontHaveAccountLabel;
  String signupCtaLabel;

  StartPageConstants({
    required this.emailFieldLabel,
    required this.passwordFieldLabel,
    required this.forgotPasswordCtalabel,
    required this.loginCtaLabel,
    required this.orContinueWithLabel,
    required this.googleCtaLabel,
    required this.dontHaveAccountLabel,
    required this.signupCtaLabel,
    required super.title,
    required super.subtitle,
    super.description,
  });
}

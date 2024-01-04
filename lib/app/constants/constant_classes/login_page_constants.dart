import 'package:cook_snap/app/constants/app_constants.dart';

class LoginPageConstants extends AppConstants {
  String emailFieldLabel;
  String passwordFieldLabel;
  String forgotPasswordCtalabel;
  String loginCtaLabel;
  String orContinueWithLabel;
  String googleCtaLabel;
  String dontHaveAccountLabel;
  String signupCtaLabel;

  LoginPageConstants({
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

  factory LoginPageConstants.getConstants() {
    return LoginPageConstants(
      title: "Welcome Back!",
      subtitle: "Please enter your account here",
      emailFieldLabel: 'Email or phone number',
      passwordFieldLabel: 'Password',
      forgotPasswordCtalabel: 'Forgot password?',
      loginCtaLabel: 'Login',
      orContinueWithLabel: 'Or continue with',
      googleCtaLabel: 'Google',
      dontHaveAccountLabel: 'Don’t have an account?',
      signupCtaLabel: 'Sign up',
    );
  }
}

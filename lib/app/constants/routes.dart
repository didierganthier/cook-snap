import 'package:cook_snap/app/app.dart';
import 'package:cook_snap/app/ui/screens/home/home_page.dart';
import 'package:cook_snap/app/ui/screens/login/login_page.dart';
import 'package:cook_snap/app/ui/screens/signup/signup_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/home';
  static const String app = '/';
  static const String login = '/login';
  static const String signup = '/signup';

  static Map<String, WidgetBuilder> routes = {
    app: (context) => const App(),
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    signup: (context) => const SignUpPage(),
  };
}

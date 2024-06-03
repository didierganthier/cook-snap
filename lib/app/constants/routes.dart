import 'package:cook_snap/app/app.dart';
import 'package:cook_snap/app/ui/screens/home/home_page.dart';
import 'package:cook_snap/app/ui/screens/login/login_page.dart';
import 'package:cook_snap/app/ui/screens/signup/signup_page.dart';
import 'package:cook_snap/utils/cook_snap_icons.dart';
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

  static List<Map<String, dynamic>> bottomNavBarRoutes = [
    {
      'id': 0,
      'icon': CookSnapIcons.home,
      'label': 'Home',
    },
    {
      'id': 1,
      'icon': CookSnapIcons.edit,
      'label': 'Upload',
    },
    {
      'id': 2,
      'icon': CookSnapIcons.scan,
      'label': 'Scan',
    },
    {
      'id': 3,
      'icon': CookSnapIcons.notification,
      'label': 'Notification',
    },
    {
      'id': 4,
      'icon': CookSnapIcons.profile,
      'label': 'Profile',
    }
  ];
}

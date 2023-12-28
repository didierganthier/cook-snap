import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/ui/screens/start/start_page.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Cook Snap',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColor,
        primaryContrastingColor: AppColors.primaryColor,
        barBackgroundColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      home: StartPage(),
    );
  }
}

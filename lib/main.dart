import 'package:cook_snap/app/app.dart';
import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

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
      home: App(),
    );
  }
}

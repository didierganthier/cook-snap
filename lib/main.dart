import 'package:cook_snap/app/app.dart';
import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/constants/routes.dart';
import 'package:cook_snap/app/data/repositories/user_repository.dart';
import 'package:cook_snap/app/ui/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => UserRepository(Supabase.instance.client)),
        ChangeNotifierProvider(
            create: (context) => UserViewModel(context.read<UserRepository>())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cook Snap',
      theme: ThemeData(
        fontFamily: 'Inter',
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
        ),
      ),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.app,
    );
  }
}

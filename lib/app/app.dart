import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/constants/routes.dart';
import 'package:cook_snap/app/ui/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Consumer<UserViewModel>(
        builder: (context, authProvider, child) {
          if (!authProvider.isLoading) {
            if (authProvider.isLoggedIn) {
              Future.microtask(() =>
                  Navigator.of(context).pushReplacementNamed(AppRoutes.home));
            } else {
              Future.microtask(() =>
                  Navigator.of(context).pushReplacementNamed(AppRoutes.login));
            }
          }

          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

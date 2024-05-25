import 'package:cook_snap/app/ui/screens/home/home_page.dart';
import 'package:cook_snap/app/ui/screens/login/login_page.dart';
import 'package:cook_snap/app/ui/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (context, userViewModel, child) {
        return userViewModel.isLoggedIn ? const HomePage() : const LoginPage();
      },
    );
  }
}

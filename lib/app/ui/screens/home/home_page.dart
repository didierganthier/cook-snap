// home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cook_snap/app/ui/viewmodels/user_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () =>
                Provider.of<UserViewModel>(context, listen: false).signOut(),
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome Home!'),
      ),
    );
  }
}

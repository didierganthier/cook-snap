// home_page.dart
import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/utils/cook_snap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cook_snap/app/ui/viewmodels/user_viewmodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = Supabase.instance.client.auth.currentUser;

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.accentColor,
        unselectedItemColor: AppColors.textSecondaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CookSnapIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CookSnapIcons.edit),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(CookSnapIcons.scan),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(CookSnapIcons.notification),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(CookSnapIcons.profile),
            label: 'Profile',
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: currentUser != null
              ? [
                  Text(currentUser.email!),
                  Text(currentUser.userMetadata!['full_name']!),
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(currentUser.userMetadata!['avatar_url']!),
                  ),
                ]
              : [],
        ),
      ),
    );
  }
}

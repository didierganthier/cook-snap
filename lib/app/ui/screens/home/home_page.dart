import 'package:cook_snap/app/ui/screens/home/subpages/feed_page.dart';
import 'package:cook_snap/app/ui/screens/home/subpages/notification_page.dart';
import 'package:cook_snap/app/ui/screens/home/subpages/profile_page.dart';
import 'package:cook_snap/app/ui/screens/home/subpages/upload_page.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/home_page/scan_cta.dart';
import 'package:cook_snap/app/ui/widgets/shared/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cook_snap/app/ui/viewmodels/user_viewmodel.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const FeedPage(),
    const UploadPage(),
    const Placeholder(),
    const NotificationPage(),
    const ProfilePage(),
  ];
  int _pageIndex = 0;

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ScanBottomNavBarCta(
        onPressed: () {
          Navigator.of(context).pushNamed('/scan');
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _pageIndex,
        onIndexChanged: (selectedIndex) {
          setState(() {
            _pageIndex = selectedIndex;
          });
        },
      ),
      body: _pages[_pageIndex],
    );
  }
}

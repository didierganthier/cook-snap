import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = Supabase.instance.client.auth.currentUser;

    return Center(
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
    );
  }
}

import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository {
  final SupabaseClient supabaseClient;

  UserRepository(this.supabaseClient);

  Future<void> saveUserData({
    required String userId,
    required String username,
    required String email,
    // Add other user data fields as needed
  }) async {
    final response = await supabaseClient.from('users').upsert([
      {
        'user_id': userId,
        'username': username,
        'email': email,
        'created_at': DateTime.now().toIso8601String(),
        // Add other user data fields as needed
      }
    ], onConflict: 'id').then((value) {
      print('User data saved successfully');
    }).catchError((error) {
      print('Error saving user data from UserRepository: $error');
    });
  }
}

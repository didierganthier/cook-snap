import 'package:cook_snap/app/data/services/google_auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final GoogleAuthService _googleAuthService = GoogleAuthService();
  final supabaseAuthInstance = Supabase.instance.client.auth;

  SupabaseService() {
    supabaseAuthInstance.onAuthStateChange.listen((state) {
      // Handle auth state changes
    });
  }

  Future<void> signInWithGoogle() async {
    await _googleAuthService.signIn();
    // Perform additional authentication with Supabase
  }

  Future<void> signOut() async {
    await _googleAuthService.signOut();
    // Perform additional sign out with Supabase
  }

  // Future<UserInfo> getUserInfo() async {
  // Retrieve user information from Supabase
  // and return it as UserInfo object
  // }
}

class UserInfo {
  final String name;
  final String email;
  final String photoUrl;

  UserInfo({required this.name, required this.email, required this.photoUrl});
}

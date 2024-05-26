import 'package:cook_snap/app/data/services/google_auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final GoogleAuthService _googleAuthService = GoogleAuthService();
  final supabaseAuthInstance = Supabase.instance.client.auth;

  SupabaseService() {
    supabaseAuthInstance.onAuthStateChange.listen((state) {
      state.event == AuthChangeEvent.signedIn
          ? _handleSession(state.session!)
          : _clearSession();
    });
  }

  Future<AuthResponse?> signInWithGoogle() async {
    try {
      final authResponse = await _googleAuthService.signIn();
      // Perform additional authentication with Supabase
      return authResponse;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleAuthService.signOut();
    // Perform additional sign out with Supabase
  }

  Future<void> _handleSession(Session session) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', session.accessToken);
      if (session.refreshToken != null) {
        await prefs.setString('refreshToken', session.refreshToken!);
      } else {
        await prefs.remove('refreshToken');
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error saving session: $e");
      }
    }
  }

  void _clearSession() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('accessToken');
      await prefs.remove('refreshToken');
    } catch (e) {
      if (kDebugMode) {
        print("Error clearing session: $e");
      }
    }
  }

  Future<void> restoreSession() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? refreshToken = prefs.getString('refreshToken');
      if (refreshToken != null) {
        final response =
            await supabaseAuthInstance.recoverSession(refreshToken);
        if (response.user != null) {
          _handleSession(response.session!);
        } else {
          _clearSession();
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error restoring session: $e");
      }
    }
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

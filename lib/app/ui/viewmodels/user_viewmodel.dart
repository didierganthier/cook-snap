// user_viewmodel.dart
import 'package:cook_snap/app/data/repositories/user_repository.dart';
import 'package:cook_snap/app/data/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _userRepository;
  User? _user;
  bool _loadingStatus = true;

  UserViewModel(this._userRepository) {
    _loadUserSession();
  }

  User? get user => _user;

  bool get isLoggedIn => _user != null;
  bool get isLoading => _loadingStatus;

  Future<void> _loadUserSession() async {
    await SupabaseService().restoreSession();
    _user = Supabase.instance.client.auth.currentUser;
    _loadingStatus = false;
    notifyListeners();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final AuthResponse? value = await SupabaseService().signInWithGoogle();
      if (value != null) {
        final String userId = value.user!.id;
        final String username = value.user!.email ?? '';
        final String email = value.user!.email ?? '';

        await saveUserData(userId: userId, username: username, email: email);
        _user = value.user;
        notifyListeners();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully signed in with Google')),
        );
      } else {
        print('Error: Authentication response is null.');
      }
    } catch (error) {
      print('Error signing in with Google: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Error signing in with Google from User ViewModel')),
      );
    }
  }

  void signOut() async {
    await SupabaseService().signOut().then((_) {
      print('User signed out');
      _user = null;
      print('User set to null');
      notifyListeners();
    }).catchError((error) {
      print('Error signing out: $error');
    });
  }

  Future<void> saveUserData({
    required String userId,
    required String username,
    required String email,
    // Add other user data fields as needed
  }) async {
    try {
      await _userRepository.saveUserData(
          userId: userId, username: username, email: email);
    } catch (error) {
      print('Error saving user data from User ViewModel');
    }
  }
}

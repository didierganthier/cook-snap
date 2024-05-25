// user_viewmodel.dart
import 'package:cook_snap/app/data/repositories/user_repository.dart';
import 'package:cook_snap/app/data/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _userRepository;
  User? _user;

  UserViewModel(this._userRepository);

  User? get user => _user;

  bool get isLoggedIn => _user != null;

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final value = await SupabaseService().signInWithGoogle();
      if (value != null) {
        final String userId = value.user!.id;
        final String username = value.user!.email ?? '';
        final String email = value.user!.email ?? '';

        await saveUserData(userId: userId, username: username, email: email);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully signed in with Google')),
        );

        _user = value.user;
        notifyListeners();
      } else {
        print('Error: Authentication response is null.');
      }
    } catch (error) {
      print('Error signing in with Google');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing in with Google')),
      );
    }
  }

  void signOut() {
    _user = null;
    notifyListeners();
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
      print('Error saving user data from UserViewModel');
    }
  }
}

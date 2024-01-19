import 'package:cook_snap/app/data/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository userRepository;

  UserViewModel(this.userRepository);

  Future<void> saveUserData({
    required String userId,
    required String username,
    required String email,
    // Add other user data fields as needed
  }) async {
    try {
      await userRepository.saveUserData(
        userId: userId,
        username: username,
        email: email,
        // Add other user data fields as needed
      );
      // Notify listeners if needed
      notifyListeners();
    } catch (e) {
      // Handle the error, e.g., show an error message to the user
      print('Error in saveUserData: $e');
    }
  }
}

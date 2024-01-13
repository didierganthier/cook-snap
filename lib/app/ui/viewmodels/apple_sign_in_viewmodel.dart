import 'package:cook_snap/app/data/services/apple_sign_in_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppleSignInViewModel {
  final AppleSignInService appleSignInService;

  AppleSignInViewModel(this.appleSignInService);

  Future<AuthResponse> signInWithApple() async {
    try {
      return await appleSignInService.signInWithApple();
    } catch (e) {
      // Handle any errors or exceptions
      print('Error during Apple Sign-In: $e');
      rethrow; // You may want to handle the error more gracefully
    }
  }
}

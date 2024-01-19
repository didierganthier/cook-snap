import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseFirestore firestore;

  UserRepository(this.firestore);

  Future<void> saveUserData({
    required String userId,
    required String username,
    required String email,
    // Add other user data fields as needed
  }) async {
    try {
      await firestore.collection('users').doc(userId).set({
        'username': username,
        'email': email,
        // Add other user data fields as needed
      });
    } catch (e) {
      // Handle the error
      print('Error saving user data: $e');
      rethrow;
    }
  }
}

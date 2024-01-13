import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleSignInService {
  // googleSignInInstance
  Future<GoogleSignIn> _googleSignIn() async {
    try {
      final webClientId = dotenv.env['WEB_CLIENT_ID']!;
      final iosClientId = dotenv.env['IOS_CLIENT_ID']!;

      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
        clientId: iosClientId,
        serverClientId: webClientId,
      );

      return googleSignIn;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<AuthResponse?> signIn() async {
    try {
      final googleSignInInstance = await _googleSignIn();
      final googleUser = await googleSignInInstance.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }
      final supabaseInstance = Supabase.instance.client;
      return supabaseInstance.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<void> signOut() async {
    final googleSignInInstance = await _googleSignIn();
    await googleSignInInstance.signOut();
    return;
  }
}

import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/data/services/apple_sign_in_service.dart';
import 'package:cook_snap/app/ui/screens/login/apple_sign_in_screen.dart';
import 'package:cook_snap/app/ui/viewmodels/apple_sign_in_viewmodel.dart';
import 'package:cook_snap/app/ui/widgets/call_to_action.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var imageSize = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Placeholder(
              fallbackHeight: imageSize,
            ),
            Column(
              children: [
                Text(
                  AppConstants().title,
                  style: TextThemes.titleTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 62.0),
                  child: Text(
                    AppConstants().description,
                    style: TextThemes.subtitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 52),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: CallToAction(
                    text: AppConstants().ctaText,
                    onPressed: () {
                      SupabaseClient client = Supabase.instance.client;
                      AppleSignInService _appleSignInService =
                          AppleSignInService(client);
                      AppleSignInViewModel _appleSignInViewModel =
                          AppleSignInViewModel(_appleSignInService);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppleSignInScreen(
                            viewModel: _appleSignInViewModel,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

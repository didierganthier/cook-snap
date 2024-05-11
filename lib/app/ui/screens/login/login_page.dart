import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/constants/constant_classes/login_page_constants.dart';
import 'package:cook_snap/app/data/repositories/user_repository.dart';
import 'package:cook_snap/app/data/services/supabase_service.dart';
import 'package:cook_snap/app/ui/viewmodels/user_viewmodel.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/login_page/email_password_form.dart';
import 'package:cook_snap/app/ui/widgets/page_specific/login_page/sign_up_cta.dart';
import 'package:cook_snap/app/ui/widgets/shared/call_to_action.dart';
import 'package:cook_snap/utils/cook_snap_icons.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginPageConstants cms = LoginPageConstants.getConstants();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Text(
                    cms.title,
                    style: TextThemes.titleTextStyle,
                  ),
                  Text(
                    cms.subtitle,
                    style: TextThemes.subtitleTextStyle,
                  ),
                  const SizedBox(height: 32),
                  EmailPasswordForm(cms: cms),
                  const SizedBox(height: 24),
                  SignUpCallToAction(
                    cms: cms,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 24),
                  Text(
                    cms.orContinueWithLabel,
                    style: TextThemes.subtitleTextStyle,
                  ),
                  const SizedBox(height: 24),
                  CallToAction(
                    text: cms.googleCtaLabel,
                    type: CallToActionType.danger,
                    icon: CookSnapIcons.google,
                    onPressed: () {
                      SupabaseService().signInWithGoogle().then((value) {
                        // Successfully signed in with Google
                        if (value != null) {
                          // Extract user data from the authentication response
                          final String userId = value.user!.id;
                          final String username = value.user!.email ?? '';
                          final String email = value.user!.email ?? '';

                          UserRepository userRepo =
                              UserRepository(Supabase.instance.client);

                          // Save user data to Supabase
                          UserViewModel(userRepo)
                              .saveUserData(
                                userId: userId,
                                username: username,
                                email: email,
                                // Add other user data fields as needed
                              )
                              .then((value) => {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Successfully signed in with Google'),
                                      ),
                                    )
                                  })
                              .catchError((error) {
                            // Handle the error better
                            print('Error saving user data: $error');
                          });
                        } else {
                          // Handle the case when the authentication response is null
                          print('Error: Authentication response is null.');
                        }
                      }).catchError((error) {
                        // Handle the error better
                        print('Error signing in with Google: $error');

                        // You can display a user-friendly error message to the user
                        // or perform other error-handling actions as needed
                      });
                    },
                  ),
                  const SizedBox(height: 18),
                  CallToAction(
                    text: cms.appleCtaLabel,
                    type: CallToActionType.dark,
                    icon: CookSnapIcons.apple,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

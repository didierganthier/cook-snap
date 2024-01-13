import 'package:cook_snap/app/ui/viewmodels/apple_sign_in_viewmodel.dart';
import 'package:flutter/material.dart';

class AppleSignInScreen extends StatelessWidget {
  final AppleSignInViewModel viewModel;

  const AppleSignInScreen({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final result = await viewModel
                  .signInWithApple()
                  .then((value) => {
                        print(value),
                      })
                  .catchError((e) {
                print('Error during Apple Sign-In: $e');
                return <void>{}; // return an empty set
              });
            },
            child: Text('Sign In with Apple'),
          ),
        ),
      ),
    );
  }
}

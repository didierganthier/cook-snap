import 'package:cook_snap/components/shared/buttons/call_to_action.dart';
import 'package:cook_snap/mocks/cms.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var imageSize = MediaQuery.of(context).size.height * 0.55;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Placeholder(
              fallbackHeight: imageSize,
            ),
            Text(CMS().startPage.title),
            Text(CMS().startPage.description),
            CallToAction(
              text: 'Get Started',
              type: CallToActionType.tertiary,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

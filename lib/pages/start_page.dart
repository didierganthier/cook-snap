import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/components/shared/buttons/call_to_action.dart';
import 'package:cook_snap/mocks/cms.dart';
import 'package:flutter/material.dart';

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
                  CMS().startPage.title,
                  style: TextThemes.titleTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 62.0),
                  child: Text(
                    CMS().startPage.description,
                    style: TextThemes.subtitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 52),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: CallToAction(
                    text: CMS().startPage.ctaText,
                    onPressed: () {},
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

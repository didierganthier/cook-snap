import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/app/ui/widgets/call_to_action.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var imageSize = MediaQuery.of(context).size.height * 0.4;
    final cms = AppConstants.getConstants();
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
                  cms.title,
                  style: TextThemes.titleTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 62.0),
                  child: Text(
                    cms.description,
                    style: TextThemes.subtitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 52),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: CallToAction(
                    text: cms.ctaText,
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

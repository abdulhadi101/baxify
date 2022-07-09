import 'package:baxify/const/color_constants.dart';
import 'package:baxify/const/style_constants.dart';
import 'package:flutter/material.dart';

class OnboardingTile extends StatelessWidget {
  final String title, imagePath, mainText;

  const OnboardingTile({
    Key? key,
    required this.imagePath,
    required this.mainText,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 0.0),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color.fromARGB(255, 138, 151, 235),
                    ColorConstants.primaryColor,
                  ],
                  stops: [
                    0.55,
                    1,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //   const SizedBox(height: 30.0),

          Padding(
            padding: const EdgeInsets.fromLTRB(45, 50, 45, 30),
            child: Text(
              title,
              style: kTitleTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          //const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 45.0,
            ),
            child: Text(
              mainText,
              style: kBodyTextStyle1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

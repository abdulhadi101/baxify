import 'package:baxify/const/path_constants.dart';
import 'package:baxify/const/text_constants.dart';
import 'package:baxify/screens/onboarding/widget/onboarding_tile.dart';

class DataConstants {
  // Onboarding
  static final onboardingTiles = [
    const OnboardingTile(

      title: TextConstants.onboarding1Title,
      mainText: TextConstants.onboarding1Description,
      imagePath: PathConstants.onboarding1,
    ),
    const OnboardingTile(
      title: TextConstants.onboarding2Title,
      mainText: TextConstants.onboarding2Description,
      imagePath: PathConstants.onboarding2,
    ),
    const OnboardingTile(
      title: TextConstants.onboarding3Title,
      mainText: TextConstants.onboarding3Description,
      imagePath: PathConstants.onboarding3,
    ),


  ];



}

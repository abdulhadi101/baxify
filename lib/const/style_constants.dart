import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:baxify/const/color_constants.dart';

ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  primary: ColorConstants.primaryColor,
  onPrimary: ColorConstants.textColor,
  padding: const EdgeInsets.symmetric(
    horizontal: 30,
    vertical: 13,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(100),
  ),
);

ButtonStyle buttonStyle1 = ElevatedButton.styleFrom(
  primary: ColorConstants.textColorGrey,
  onPrimary: ColorConstants.thirdColor,
  padding: const EdgeInsets.symmetric(
    horizontal: 40,
    vertical: 13,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);

TextStyle bodyTextStyle = GoogleFonts.sora(
  fontSize: 14,
  color: ColorConstants.textBlack.withOpacity(.7),
);
TextStyle titleTextStyle = GoogleFonts.roboto(
  fontSize: 16,
  color: ColorConstants.textBlack,
  fontWeight: FontWeight.bold,
);

TextStyle tabTitleTextStyle = GoogleFonts.roboto(
  fontSize: 14,
  color: ColorConstants.textBlack,
  fontWeight: FontWeight.w500,
);

TextStyle headingTextStyle = GoogleFonts.sora(
  fontSize: 24,
  color: ColorConstants.textBlack,
  fontWeight: FontWeight.bold,
);
TextStyle headingTextStyle1 = GoogleFonts.sora(
  fontSize: 24,
  color: ColorConstants.white,
  fontWeight: FontWeight.bold,
);

// Onboarding textStyle

TextStyle kTitleTextStyle = GoogleFonts.sora(
  textStyle: const TextStyle(
    fontWeight: FontWeight.w700,
    color: ColorConstants.textColor,
    fontSize: 18.0,
  ),
);

TextStyle kBodyTextStyle1 = GoogleFonts.roboto(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: ColorConstants.textColorGrey));

const klabelTextStyle2 =
    TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w900);
const klabelTextStyle3 = TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);
const klabelTextStyle4 = TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold);

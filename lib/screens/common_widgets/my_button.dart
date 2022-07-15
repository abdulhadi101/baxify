import 'package:flutter/material.dart';
import 'package:baxify/const/color_constants.dart';

class MyButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final Function() onTap;
  const MyButton(
      {Key? key,
      required this.title,
      this.isEnabled = true,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: isEnabled
          ? BoxDecoration(
              color: ColorConstants.primaryColor,
              borderRadius: BorderRadius.circular(100),
            )
          : BoxDecoration(
              color: ColorConstants.disabledColor,
              //   color: isEnabled
              // ? ColorConstants.primaryColor
              // : ColorConstants.disabledColor,

              borderRadius: BorderRadius.circular(100),
            ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: ColorConstants.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyButton2 extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final Color color;
  final Color textColors;
  final Function() onTap;
  const MyButton2(
      {Key? key,
      required this.title,
      this.textColors = ColorConstants.textBlack,
      this.color = ColorConstants.primaryColor,
      this.isEnabled = true,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: isEnabled
          ? BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
            )
          : BoxDecoration(
              color: ColorConstants.disabledColor,
              borderRadius: BorderRadius.circular(100),
            ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: textColors,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

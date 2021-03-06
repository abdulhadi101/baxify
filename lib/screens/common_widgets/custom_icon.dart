import 'package:flutter/material.dart';
import 'package:baxify/const/color_constants.dart';



class CustomIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? iconData;
  const CustomIcon({
    this.iconData,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorConstants.textColor,
      foregroundColor: ColorConstants.textBlack,
      child: InkWell(
        onTap: () => onPressed!(),
        child: Ink(
          child: Icon(
            iconData ?? Icons.person,
          ),
        ),
      ),
    );
  }
}

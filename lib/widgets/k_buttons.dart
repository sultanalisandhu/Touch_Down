import 'package:flutter/material.dart';
import 'package:touch_down/utils/constants.dart';

Widget kTextButton( {
  Color? color,
  Function()? onPressed,
  String? btnText,
  Widget? widget,
  Color? textColor,
  Color? borderColor,
  double? height,
  double ? width,
  double ? borderRadius,
  double ? fontSize,
  double? padding,
}) {
  return GestureDetector(
    onTap: (){
      if (onPressed != null) onPressed();
    },
    child: Container(
      alignment: Alignment.center,
      height: height??50,
      width: width??80,
      padding:  EdgeInsets.symmetric(horizontal: padding??15),
      decoration: BoxDecoration(
        color: color?? AppColor.primaryColor,
        border: Border.all(width: 1, color: borderColor??Colors.transparent),
        borderRadius: BorderRadius.circular(borderRadius??12),
      ),
      child: widget?? Text(textAlign: TextAlign.center, btnText!,style: TextStyle(fontSize: fontSize??14,
          fontWeight: FontWeight.w600,
          color: textColor??Colors.white),),
    ),
  );
}
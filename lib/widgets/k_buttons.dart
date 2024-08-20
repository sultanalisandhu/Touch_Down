import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
      height: height??5.h,
      width: width??80.w,
      padding:  EdgeInsets.symmetric(horizontal: padding??15),
      decoration: BoxDecoration(
        color: color?? AppColor.primaryColor,
        border: Border.all(width: 1, color: borderColor??Colors.transparent),
        borderRadius: BorderRadius.circular(borderRadius??26.w),
      ),
      child: widget?? Text(textAlign: TextAlign.center, btnText!,style: primaryTextStyle(fontSize: fontSize??12,
          fontWeight: FontWeight.w500,
          color: textColor??AppColor.blackColor),),
    ),
  );
}
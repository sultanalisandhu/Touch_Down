import 'package:flutter/material.dart';
import 'package:touch_down/utils/constants.dart';

AppBar kAppBar({
  String? titleText,
  Color? backgroundColor,

}){
  return AppBar(
    scrolledUnderElevation: 0.0,
    elevation: 0.0,
    leadingWidth: mQ.width,
    backgroundColor: backgroundColor?? AppColor.whiteColor,
    automaticallyImplyLeading: false,

    title: Text(titleText!,style: primaryTextStyle(fontSize: 18),),centerTitle: true,

  );}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppColor {
  static const Color primaryColor= Color.fromRGBO(119, 221, 119, 1);
  static const Color yellowColor= Color.fromRGBO(254, 242, 80, 1);
  static const Color greyColor= Color.fromRGBO(182, 182, 182, 1);
  static const Color lightGreyColor= Color.fromRGBO(244, 244, 244, 1);
  static const Color containerGreyColor= Color.fromRGBO(243, 241, 254, 1);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
}

Size get mQ => MediaQuery.of(Get.context!).size;



//color ful print statement
void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}
void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}


TextStyle primaryTextStyle({double? fontSize, FontWeight? fontWeight,Color? color,TextDecoration? textDecoration}){
  return GoogleFonts.inter(
      textStyle: TextStyle(
        decoration:textDecoration?? TextDecoration.none,
        fontSize: fontSize !=null ?fontSize.sp: 20.sp,
        fontWeight: fontWeight??FontWeight.w300,
        color: color,
      )
  );
}
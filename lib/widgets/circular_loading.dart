import 'package:flutter/material.dart';
import 'package:touch_down/utils/constants.dart';


Widget kCircularLoading(){
  return const Center(child:  CircularProgressIndicator(
    color: AppColor.blackColor,
    strokeCap: StrokeCap.round,
    backgroundColor: Colors.transparent,),);
}